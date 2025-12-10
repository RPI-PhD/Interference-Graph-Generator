#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_map>
#include <regex>
#include <iostream>
#include <climits>
#include <unistd.h>
#include <sys/stat.h>


/*
 * Useful structs containing node info to later construct edges
 */

#define TRUE_                   1
#define FALSE_                  0
#define MAX_USE_DEF             8
#define MAX_ID_NAME_LEN         50
#define BYTES_PER_FUNCTION      50
#define MAX_PREDECESSORS        10

typedef u_int64_t BITSIZE;

typedef struct {

    char def[MAX_USE_DEF][MAX_ID_NAME_LEN];     // I got very lazy. TODO: fix this if you feel like it
    char use[MAX_USE_DEF][MAX_ID_NAME_LEN];

    size_t size_def;
    size_t size_use;

    char *func_name;          // NULL if not a call, otherwise name of function called

} Instruct;

typedef struct {

    char use[MAX_USE_DEF][MAX_ID_NAME_LEN];
    int predecessors[MAX_PREDECESSORS];        // NULL if not a phi node; idx of use == idx of pred -> so jump to pred block and add reg to live out

    short num_pred;

} Phi;

typedef struct {
    short reglines;
    BITSIZE *bits;
} bitReg;

typedef struct {

    size_t label;

    size_t instr_len;   // space malloc'd
    size_t num_instr;   // number of instructions we have

    size_t Phi_len;
    size_t num_Phi;

    size_t num_succ;    // number of successors we have
    size_t succ_len;    // space malloc'd

    bitReg use_block;   // Doing this because per block requires WAY more registers than per instruction
    bitReg def_block;
    bitReg in_block;
    bitReg out_block;

    int *successors;    //instead of Block**, just have array of indices to look up in Function

    Instruct *instrcts;
    Phi *phis;

} Block;  // TODO: This became really big and should probably be broken into multiple structs (bitstruct, successor struct, etc)

typedef struct
{
    char func_id[256];
    int num_connections;
    int *neighbors;
} Func_vertex;

typedef struct
{
    char * func_name;
    int num_verts;
    int num_edges;
    int alloc_size;
    int * edges; // n = src, n+1 = dst
    int num_funcs;
    int func_alloc;
    int recursed; // flag
    Func_vertex *calls;
} Edge_list_funcs;

typedef struct
{
    int * neighbors;
    int offset;
    int num_neighbors;
} Recursion_helper;

typedef struct
{
    Recursion_helper *helper;
    int alloc_size;
    int cur_depth;
} Recursion_helper_stack;

/* We need this if we want to use char* */

typedef std::unordered_map<size_t, Block> Function;
typedef std::unordered_map<std::string, int> Register_mapping;

typedef struct {
    size_t func_size;

    Function *funcs;
    Register_mapping *regs;
    char *func_names;

} IRFuncs;

typedef enum {
    BRANCH,
    INTERMEDIATE
} LINE_TYPE;

/*
 * Helper bitwise funcs
 */

static void init_bits(bitReg *regs, int reg_num){
    int sz = sizeof(BITSIZE) << 3;
    regs->reglines = (reg_num + sz - 1) / sz;
    regs->bits = (BITSIZE*)calloc(regs->reglines, sizeof(BITSIZE));
}

// a - b
static inline void bit_diff(bitReg *out, bitReg *a, bitReg *b){
    for (short i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] & ~b->bits[i];
    }
}

static inline void bit_union_or(bitReg *out, bitReg *a, bitReg *b){
    for (short i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] | b->bits[i];
    }
}

static inline void bit_intersection_and(bitReg *out, bitReg *a, bitReg *b){
    for (short i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] & b->bits[i];
    }
}

// set register bit to 1
static inline void set_reg_live(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    regs->bits[regnum >> 6] |= (1ULL << (regnum & (sz - 1)));
}

// set register bit to 0
static inline void kill_reg(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    regs->bits[regnum >> 6] &= ~(1ULL << (regnum & (sz - 1)));
}

// boolean check if register is live
static inline int bit_is_active(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    return (int)((regs->bits[regnum >> 6] >> (regnum & (sz - 1))) & 1ULL);
}

static inline void clear_bits(bitReg *regs){
    memset(regs->bits,0,regs->reglines * sizeof(BITSIZE));
}
/*
 * String search state machines
 * phi_machine = std::regex phi_pair_re(R"(\[\s*([^,\]]+)\s*,\s*([^]\]]+)\])");
*  reg_machine = std::regex re("(%[A-Za-z0-9._]+)");
   func_machine = std::regex re("(@[A-Za-z0-9._]+)");
 */

const char * phi_machine(const char *p, long &len)
{
    const char * start_tok = NULL;
    len = 0;
    // ex %.01 = phi i32 [ 0, %4 ], [ %40, %39 ], ...
    while(*p != '\n')
    {
        if (*p == '[' || (*p == ',' && *(p-1) != ']'))
        {
            start_tok = p + 2;
            p = start_tok;
            // if it reaches here, it found a start character
            break;
        }
        p++;
    }
    // if it didn't find a start char, it skips this loop
    if (*p != '\n')
    {
        while (*p != ',' && *p != ' ')
        {
            p++;
        }
    }

    if (start_tok != NULL) len = p - start_tok;
    return start_tok;
}

const char * reg_machine(const char *p, long &len)
{
    const char * start = NULL;
    len = 0;

    for (; *p != '%' && *p != '\n'; ++p){}

    while (*p != '\n' && *p != ',' && *p != ' ' && *p != ')'){
        if (*p == '%'){
            start = p;
        }

        p++;
    }

    len = (start != NULL) ? p - start : 0;
    return start;
}

const char * func_machine(const char *p, long &len){

    const char * start = NULL;
    len = 0;

    for (; *p != '@' && *p != '\n'; ++p){}

    while (*p != '('){
        if (*p == '@'){
            start = p;
        }

        p++;
    }

    len = (start != NULL) ? p - start : 0;
    return start;
}

/*
 * Other methods
 */

void init_EL(Edge_list_funcs * el, char * name)
{
    el->func_name = (char*) malloc(strlen(name) + 1);
    strcpy(el->func_name, name);
    el->num_edges = 0;
    el->num_verts = 0;
    el->alloc_size = 8;
    el->edges = (int *)malloc(sizeof(int) * el->alloc_size);
    el->num_funcs = 0;
    el->func_alloc = 2;
    el->calls = (Func_vertex *)malloc(sizeof(Func_vertex) * el->func_alloc);
    el->recursed = 0;
}

void copy_EL(Edge_list_funcs * dst, Edge_list_funcs * src)
{
    dst->func_name = (char*) malloc(strlen(src->func_name) + 1);
    strcpy(dst->func_name, src->func_name);
    dst->num_edges = src->num_edges;
    dst->num_verts = src->num_verts;
    dst->alloc_size = src->alloc_size;
    dst->edges = (int *)malloc(sizeof(int) * dst->alloc_size);
    memcpy(dst->edges, src->edges, sizeof(int) * dst->num_edges * 2);
    dst->num_funcs = 0;
    dst->func_alloc = 2;
    dst->calls = (Func_vertex *)malloc(sizeof(Func_vertex) * dst->func_alloc);
}

void add_edge(Edge_list_funcs * el, int u, int v)
{
    if (el->num_edges * 2 >= el->alloc_size - 2)
    {
        el->alloc_size = el->alloc_size * 2;
        el->edges = (int *)realloc(el->edges, sizeof(int) * el->alloc_size);
    }
    el->edges[el->num_edges*2] = u;
    el->edges[el->num_edges*2+1] = v;
    el->num_edges++;
}

void add_func(Edge_list_funcs * el, char* func_id, int size)
{
    if (el->num_funcs >= el->func_alloc-1)
    {
        el->func_alloc = el->func_alloc * 2;
        el->calls = (Func_vertex *)realloc(el->calls, sizeof(Func_vertex) * el->func_alloc);
    }

    strcpy(el->calls[el->num_funcs].func_id, func_id);
    el->calls[el->num_funcs].num_connections = size;
    el->calls[el->num_funcs].neighbors = (int *)malloc(sizeof(int) * size);
    el->num_funcs++;
}

void init_rhs(Recursion_helper_stack * rhs)
{
    rhs->cur_depth = -1;
    rhs->alloc_size = 4;
    rhs->helper = (Recursion_helper *)malloc(sizeof(Recursion_helper) * rhs->alloc_size);
}

void rhs_push(Recursion_helper_stack * rhs, Recursion_helper * rh)
{
    if (rhs->cur_depth+1 >= rhs->alloc_size)
    {
        rhs->alloc_size = rhs->alloc_size * 2;
        rhs->helper = (Recursion_helper *)realloc(rhs->helper, sizeof(Recursion_helper) * rhs->alloc_size);
    }
    rhs->cur_depth++;
    rhs->helper[rhs->cur_depth].offset = rh->offset;
    rhs->helper[rhs->cur_depth].neighbors = rh->neighbors;
    rhs->helper[rhs->cur_depth].num_neighbors = rh->num_neighbors;
}

void compute_use_def_block(Function &blocks,Register_mapping &regMap, int num_regs){

    int reg_ID;
    size_t reg, i;

    for (std::pair<const size_t,Block> &block : blocks){

        Block *bl = &block.second;

        init_bits(&bl->use_block,num_regs);
        init_bits(&bl->def_block,num_regs);

        for (i = 0; i < bl->num_instr; ++i){
            Instruct in = bl->instrcts[i];

            for (reg = 0; reg < in.size_use; ++reg){
                reg_ID = regMap.find(in.use[reg])->second;

                if (!bit_is_active(&bl->def_block,reg_ID))
                    set_reg_live(&bl->use_block,reg_ID);
            }

            for (reg = 0; reg < in.size_def; ++reg){
                reg_ID = regMap.find(in.def[reg])->second;

                set_reg_live(&bl->def_block,reg_ID);
            }

        }

    }
}

void compute_use_def_block_phis(Function &blocks,Register_mapping &regMap){
    int reg_ID, jmp;
    size_t i;

    Block *pred_block;

    for (std::pair<const size_t,Block> &block : blocks){

        Block *bl = &block.second;

        for (i = 0; i < bl->num_Phi; ++i){

            Phi phi = bl->phis[i];

            for (jmp = 0; jmp < phi.num_pred; ++jmp){
                reg_ID = regMap.find(phi.use[jmp])->second;
                pred_block = &blocks.find(phi.predecessors[jmp])->second;

                if (!bit_is_active(&pred_block->def_block,reg_ID))
                    set_reg_live(&pred_block->use_block,reg_ID);
            }
        }
    }
}

void compute_use_def_instr(const char *line,
                           Block *block,
                           Register_mapping &regMap,
                           int &reg_idx,
                           int is_phi){

    size_t instr_idx, *sz_use, *sz_def, phi_idx;
    short *num_pred;
    int *predecessors;
    long tok_len;
    const char *eq, *rhs, *lhs, *token, *callcheck;
    Instruct *instr;
    Phi *phis;

    instr_idx = block->num_instr;
    phi_idx = block->num_Phi;

    instr = &block->instrcts[instr_idx];
    phis = &block->phis[phi_idx];

    sz_def = &instr->size_def;
    sz_use = &instr->size_use;

<<<<<<< HEAD
<<<<<<< HEAD
=======
    if (phi_idx != 0){
        num_pred = &phis->num_pred;
        predecessors = phis->predecessors;
    }

>>>>>>> 0a73154 (undoing ethans stupidity)
=======
>>>>>>> c5885aa (Haven nuked the repo and new we have to do a rollback)
    callcheck = strstr(line, "call ");

    if (callcheck == NULL)
    {
        instr->func_name = NULL;
    }
    else
    {
        const char* first = strchr(callcheck, '@');
        const char* last = strchr(first, '(');
        int name_size = last - first;
        instr->func_name = (char *) malloc(name_size);
        strncpy(instr->func_name, first+1, name_size - 1);
        instr->func_name[name_size-1] = '\0';
    }

    *sz_def = 0, *sz_use = 0;

    eq = strchr(line, '=');

    rhs = eq == NULL ? line : eq + 1;
    lhs = eq == NULL ? line : eq - 1;

    token = line;

    token = reg_machine(token,tok_len);
    for (; token != NULL && token < lhs; token = reg_machine(++token,tok_len)){

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    std::cregex_iterator begin_rhs(rhs,txt_end,(is_phi ? phi_pair_re : re));
    std::cregex_iterator begin_lhs(line,lhs,re);
=======
    std::cregex_iterator begin_rhs(rhs,txt_end,re);
    std::cregex_iterator begin_lhs(line,lhs,(is_phi ? phi_pair_re : re));
>>>>>>> 0a73154 (undoing ethans stupidity)
=======
    std::cregex_iterator begin_rhs(rhs,txt_end,(is_phi ? phi_pair_re : re));
    std::cregex_iterator begin_lhs(line,lhs,re);
>>>>>>> c5885aa (Haven nuked the repo and new we have to do a rollback)

    std::cregex_iterator end;

    for(std::cregex_iterator it = begin_lhs; it != end; ++it){
        const std::cmatch &m = *it;
        token = m[0].first;

        snprintf(block->instrcts[instr_idx].def[*sz_def], m[0].length() + 1,"%.*s",(int)m[0].length(),token);
        std::string map_token(block->instrcts[instr_idx].def[*sz_def],m[0].length());
=======
        snprintf(block->instrcts[instr_idx].def[*sz_def], tok_len + 1,"%.*s",(int)tok_len,token);
        std::string map_token(block->instrcts[instr_idx].def[*sz_def],tok_len);
>>>>>>> 953ac0d (did some stuff)

        if (regMap.find(map_token) == regMap.end()){
            regMap[map_token] = reg_idx;

            reg_idx++;
        }

        (*sz_def)++;
    }

    token = rhs;
    if (is_phi){

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> c5885aa (Haven nuked the repo and new we have to do a rollback)
        num_pred = &phis->num_pred;
        predecessors = phis->predecessors;
        *num_pred = 0;

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 0a73154 (undoing ethans stupidity)
=======
>>>>>>> c5885aa (Haven nuked the repo and new we have to do a rollback)
        for(std::cregex_iterator it = begin_rhs; it != end; ++it){
            const std::cmatch &m = *it;
            virt_reg = m[1].first;
            bl_label = m[2].first;

            /* Skip any constant optimizations like [ 0, %2 ] since we don't need to look back at %2
             *
             *  I'm not sure if this logic is right
             */
            if (virt_reg[0] != '%'){
=======
        token = phi_machine(token,tok_len);
        for (; token != NULL; token = phi_machine(token,tok_len)){
            if (token[0] != '%'){
<<<<<<< HEAD
>>>>>>> 953ac0d (did some stuff)
=======
                token = phi_machine(token,tok_len);
>>>>>>> 995a8b4 (Working on debugging)
                continue;
            }

            snprintf(phis->use[*num_pred], tok_len + 1,"%.*s",(int)tok_len,token);

            token = phi_machine(token,tok_len);

            predecessors[*num_pred] = atoi(token + 1);

            (*num_pred)++;
        }

        if (*num_pred != 0){
            block->num_Phi++;
        }

    } else {

        token = reg_machine(token,tok_len);
        for (; token != NULL; token = reg_machine(++token,tok_len)){
            snprintf(block->instrcts[instr_idx].use[*sz_use], tok_len + 1,"%.*s",(int)tok_len,token);
            std::string map_token(block->instrcts[instr_idx].use[*sz_use],tok_len);

            if (regMap.find(map_token) == regMap.end()){
                regMap[map_token] = reg_idx;

                reg_idx++;
            }

            (*sz_use)++;
        }

    }

    block->num_instr++;
}

void compute_successors(char *line,
                        Block *block,
                        Register_mapping &regMap,
                        int &reg_idx){

    const char *p;
    size_t instr_idx;
    size_t original_num_succ, old_succ_len;

    instr_idx = block->num_instr - 1;

    // First separate out the sub-instructions in the branch line

    char token[256];

    long tok_len = 0;
    const char * tok_ptr = line;
    tok_ptr = reg_machine(tok_ptr, tok_len);
    original_num_succ = block->num_succ;

    for (; tok_ptr != NULL; tok_ptr = reg_machine(++tok_ptr, tok_len))
    {
        block->num_succ++;
    }

    old_succ_len = block->succ_len;
    while (block->succ_len <= block->num_succ){
        block->succ_len <<= 1;
    }

    if (old_succ_len != block->succ_len){

        block->successors = (int *) realloc(block->successors,block->succ_len * sizeof(int));

        if (block->successors == NULL){
            fprintf(stderr,"Realloc of block->successors failed\n");
            exit(EXIT_FAILURE);
        }
    }

    tok_ptr = line;
    tok_ptr = reg_machine(tok_ptr, tok_len);

    for (; tok_ptr != NULL; tok_ptr = reg_machine(++tok_ptr, tok_len)){

        snprintf(token, tok_len + 1, "%s", tok_ptr);
        p = token;

        /* I'm assuming it will always be "label %{register}",
         * so walk back 6 steps and check for "label " */

        if (tok_ptr - 6 >= line && strncmp(tok_ptr - 6,"label ",6) == 0) {
            block->successors[original_num_succ] = atoi(p + 1);
            original_num_succ++;
        }
        else {

            block->instrcts[instr_idx].size_use++;
            size_t sz = block->instrcts[instr_idx].size_use;

            if (regMap.find(p) == regMap.end()){
                regMap[p] = reg_idx;

                reg_idx++;
            }
            strcpy(block->instrcts[instr_idx].use[sz - 1],p);

        }
    }
    block->num_succ = original_num_succ;
}

// Note to self: Function will be on the stack...only need 1
LINE_TYPE set_up_blocks(char *&line, Function &blocks,
                        size_t block_idx,
                        Register_mapping &regMap,
                        int &reg_idx,
                        FILE *fp,
                        size_t &len){

    Block *block;
    int is_phi = FALSE_;

    /* Dynamic resizing of data structures cuz I started this in c :C */

    /* Focus in on a specific block */
    block = &blocks[block_idx];

    if (block->label == 0){
        block->label = block_idx;
    }

    if (block->num_instr >= block->instr_len){

        if (block->instr_len == 0){
            block->instrcts = (Instruct*) calloc(1, sizeof(Instruct));
            block->num_instr = 0;
            block->instr_len = 1;
        } else {
            const size_t resize_i = 2 * block->instr_len;
            block->instrcts = (Instruct*) realloc(block->instrcts, resize_i * sizeof(Instruct));
            block->instr_len = resize_i;
        }

        if (block->instrcts == NULL){
            fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
            exit(EXIT_FAILURE);
        }
    }

    // If the line is a phi node
    if (strstr(line, " phi ") != NULL){

        if (block->num_Phi >= block->Phi_len){

            if (block->Phi_len == 0){
                block->phis = (Phi*) calloc(2, sizeof(Instruct));
                block->num_Phi = 0;
                block->Phi_len = 2;
            } else {
                const size_t resize_i = 2 * block->Phi_len;
                block->phis = (Phi*) realloc(block->phis, resize_i * sizeof(Phi));
                block->Phi_len = resize_i;
            }

            if (block->phis == NULL){
                fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
                exit(EXIT_FAILURE);
            }


        }

        is_phi = TRUE_;
    }

    /*
     * If we see a branch at the end of a block, we need to store the successors
     *
     * Went with a hash table instead of tree just cuz (would've done tree if still in C)
     */

    if (strncmp(line,"  switch", 8) == 0){

        block->num_succ = 0;
        block->succ_len = 4;

        block->successors = (int*)malloc(block->succ_len * sizeof(int));

        while (line[2] != ']'){

            compute_successors(line,block,regMap,reg_idx);
            getline(&line, &len, fp);

        }

        return LINE_TYPE::BRANCH;
    }


    if (strncmp(line,"  br", 4) == 0){

        block->num_succ = 0;
        block->succ_len = 2;

        block->successors = (int*)malloc(block->succ_len * sizeof(int));

        compute_successors(line,block,regMap,reg_idx);
        return LINE_TYPE::BRANCH;
    }

    // Per-instruction use/def populating
    compute_use_def_instr(line,block,regMap,reg_idx,is_phi);
    return LINE_TYPE::INTERMEDIATE;
}

// https://www.geeksforgeeks.org/compiler-design/liveliness-analysis-in-compiler-design/
void compute_in_out(Function &blocks, int num_regs){
    int in_diff, out_diff;
    size_t i;

    bitReg in_copy, out_copy, tmp;

    init_bits(&in_copy,num_regs);
    init_bits(&out_copy,num_regs);
    init_bits(&tmp,num_regs);

    for (std::pair<const size_t,Block> &block : blocks){
        Block *bl = &block.second;

        init_bits(&bl->in_block,num_regs);
        init_bits(&bl->out_block,num_regs);

    }

    do {

        in_diff = out_diff = FALSE_;

        for (std::pair<const size_t,Block> &block : blocks){

            Block *bl = &block.second;
            bitReg *in = &bl->in_block;
            bitReg *out = &bl->out_block;

            for (i = 0; i < bl->num_succ; ++i){
                size_t s = bl->successors[i];

                bit_union_or(&out_copy,&out_copy,&blocks[s].in_block);
            }

            bit_diff(&tmp,&out_copy,&bl->def_block);
            bit_union_or(&in_copy,&bl->use_block,&tmp);

            in_diff = memcmp(in->bits,in_copy.bits,in->reglines * sizeof(BITSIZE)) != FALSE_;
            out_diff = memcmp(out->bits,out_copy.bits,out->reglines * sizeof(BITSIZE)) != FALSE_;

            if (in_diff || out_diff){
                memcpy(in->bits,in_copy.bits,in_copy.reglines * sizeof(BITSIZE));
                memcpy(out->bits,out_copy.bits,out_copy.reglines * sizeof(BITSIZE));
            }
        }


    } while (in_diff || out_diff);


    free(tmp.bits);
    free(in_copy.bits);
    free(out_copy.bits);
}

/*
*    size_t label;

    size_t instr_len;   // space malloc'd
    size_t num_instr;   // number of instructions we have

    size_t Phi_len;
    size_t num_Phi;

    size_t num_succ;    // number of successors we have
    size_t succ_len;    // space malloc'd

    bitReg use_block;   // Doing this because per block requires WAY more registers than per instruction
    bitReg def_block;
    bitReg in_block;
    bitReg out_block;

    int *successors;    //instead of Block**, just have array of indices to look up in Function

    Instruct *instrcts;
    Phi *phis;
    */

void free_heap_alloc(Function &blocks){
    for (std::pair<const size_t,Block> &block : blocks){

        Block *bl = &block.second;

        for (int i = 0; i < (int)bl->num_instr; i++) if (bl->instrcts[i].func_name != NULL) free(bl->instrcts[i].func_name);
        free(bl->instrcts);
        free(bl->successors);
        free(bl->use_block.bits);
        free(bl->def_block.bits);
        free(bl->in_block.bits);
        free(bl->out_block.bits);
        free(bl->phis);

    }
}

FILE *create_edgelist_file(char fl_name[]){
    FILE *fp;

    fp = fopen(fl_name,"w");

    if (!fp){
        fprintf(stderr,"Could not generate edge list file for %s\n",fl_name);
        return NULL;
    }

    return fp;
}

/*  https://www2.cs.arizona.edu/~collberg/Teaching/553/2011/Handouts/Handout-23.pdf

    FOR all basic blocks b in the program DO
        live := out[b];
        FOR all instructions I ∈ b, in reverse order DO
            FOR all d ∈ def(I) DO
                FOR all l ∈ live ∪ def(I) DO
                    add the interference graph edge hl, di;
            live := use(I) ∪ (live − def(I));
 */

void generate_edge_list(Function &blocks,
                        Register_mapping regmap,
                        FILE* fp,
                        Edge_list_funcs * el){
    int i, r, regnum_d, regnum_u;
    size_t d, u;
    Block *bl;
    bitReg *out;
    Instruct I;
    char* def, *use;

    int num_regs = regmap.size();
    bitReg Live;
    init_bits(&Live, num_regs);

    for (std::pair<const size_t,Block> &block : blocks){

        bl = &block.second;
        out = &bl->out_block;

        for (i = 0; i < out->reglines; ++i)
            Live.bits[i] = out->bits[i];

        for (i = bl->num_instr - 1; i >= 0; --i){
            I = bl->instrcts[i];


            for (d = 0; d < I.size_def; ++d){

                def = I.def[d];
                regnum_d = regmap[def];

                for (r = 0; r < num_regs; ++r){
                    if(bit_is_active(&Live,r) && r != regnum_d){
                        add_edge(el, r, regnum_d);
                    }
                }

                if (I.func_name != nullptr)
                {

                    int count = 0;
                    for (r = 0; r < num_regs; ++r){
                        if(bit_is_active(&Live,r) && r != regnum_d){
                            count++;
                        }
                    }
                    add_func(el, I.func_name, count);
                    int idx = 0;
                    for (r = 0; r < num_regs; ++r){
                        if(bit_is_active(&Live,r) && r != regnum_d){
                            el->calls[el->num_funcs-1].neighbors[idx] = r;
                            idx++;
                        }
                    }
                }

            }


            // live := use(I) ∪ (live − def(I))
            for (d = 0; d < I.size_def; ++d){
                def = I.def[d];
                regnum_d = regmap[def];
                kill_reg(&Live,regnum_d);

            }

            for (u = 0; u < I.size_use; ++u){
                use = I.use[u];
                regnum_u = regmap[use];
                set_reg_live(&Live,regnum_u);
            }

        }

    }

    free(Live.bits);
}

int find_func(Edge_list_funcs * el_list, char* query, int num_funcs)
{
    for (int i = 0; i < num_funcs; ++i)
    {
        if (strcmp(el_list[i].func_name, query) == 0) return i;
    }
    return -1;
}

void recursively_populate(Edge_list_funcs * el_list, Edge_list_funcs * el, int func_idx,
    int * vidx_offset, int num_funcs, Recursion_helper_stack * rhs, FILE* fp)
{
    int myoffset = *vidx_offset;
    // step 1: print current funcs edges
    for (int i = 0; i < el_list[func_idx].num_edges; i++)
    {
        int u = el_list[func_idx].edges[i*2]+myoffset;
        int v = el_list[func_idx].edges[i*2+1]+myoffset;
        if (rhs->cur_depth != -1)
        {
            add_edge(el, u, v);
        }
    }
    // step 2: deal with parents interferences
    *vidx_offset += el_list[func_idx].num_verts;
    //for each u in func neighbors of entire parent call chain
    for (int stackidx = 0; stackidx < rhs->cur_depth+1; stackidx++)
    {
        for (int u = 0; u < rhs->helper[stackidx].num_neighbors; u++)
        {
            int u_offset = rhs->helper[stackidx].neighbors[u] + rhs->helper[stackidx].offset;
            for (int v = myoffset; v < myoffset+el_list[func_idx].num_verts; ++v)
            {
                add_edge(el, u_offset, v);
            }
        }
    }

    // step 3: iterate through func calls
    for (int i = 0; i < el_list[func_idx].num_funcs; i++)
    {
        int next = find_func(el_list, el_list[func_idx].calls[i].func_id, num_funcs);

        if (next == -1)
        {
            // if the function's graph isnt known (i.e. dlls), all we can do is drop the label and its interferences
            add_func(el, el_list[func_idx].calls[i].func_id, el_list[func_idx].calls[i].num_connections);
            for (int j = 0; j < el_list[func_idx].calls[i].num_connections; ++j){
                el->calls[el->num_funcs-1].neighbors[j] = el_list[func_idx].calls[i].neighbors[j] + myoffset;
            }
        }
        else
        {
            Recursion_helper rs;
            rs.neighbors = el_list[func_idx].calls[i].neighbors;
            rs.num_neighbors = el_list[func_idx].calls[i].num_connections;
            rs.offset = myoffset;
            rhs_push(rhs, &rs);

            recursively_populate(el_list, el, next, vidx_offset, num_funcs, rhs, fp);
        }
    }
    if (rhs->cur_depth >= 0) rhs->cur_depth--;
}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 955d7f1 (ethan spreads false information and maliciously deletes files on my computer so he can blame it on me)
=======
void print_el_to_file(FILE* fp, Edge_list_funcs &el)
{
    if (el.recursed) fprintf(fp, "# (Recursed) "); else fprintf(fp, "# ");
    fprintf(fp, "Function: %s\n# |V| = %d [0, %d]\n# |E| = %d\n# Number of unexpanded functions: %d, listed last\n\n",
        el.func_name, el.num_verts, el.num_verts-1, el.num_edges, el.num_funcs);
    for (int i = 0; i < el.num_edges; ++i)
    {
        fprintf(fp, "e %d %d\n", el.edges[i*2], el.edges[i*2+1]);
    }
    for (int i = 0; i < el.num_funcs; ++i)
    {
        fprintf(fp, "%s", el.calls[i].func_id);
        for (int j = 0; j < el.calls[i].num_connections; ++j){
            fprintf(fp, " %d", el.calls[i].neighbors[j]);
        }
        fprintf(fp, "\n");
    }
    fprintf(fp, "\n");
}

>>>>>>> fc1d6bb (cleaned up output order of operations)
void cleanup(Edge_list_funcs * el_list, Recursion_helper_stack * rhs, int numfuncs)
{
    for (int i = 0; i < numfuncs; i++)
    {
        for (int j = 0; j < el_list[i].num_funcs; j++)
        {
            free(el_list[i].calls[j].neighbors);
        }
        free(el_list[i].calls);
        free(el_list[i].edges);
        free(el_list[i].func_name);
    }
    if (rhs != NULL) free(rhs->helper);
    free(el_list);
    free(rhs);
}

<<<<<<< HEAD
void generate_all_edge_lists(IRFuncs &funcs, char* fl_name, int recursive)
{
    FILE* fp = NULL;
=======
void generate_all_edge_lists(IRFuncs &funcs, char* fl_name, int recursive)
{
    FILE* fp;
>>>>>>> 0a73154 (undoing ethans stupidity)
=======
void generate_all_edge_lists(IRFuncs &funcs, char* fl_name, int recursive)
{
    FILE* fp = NULL;
>>>>>>> 955d7f1 (ethan spreads false information and maliciously deletes files on my computer so he can blame it on me)
    Edge_list_funcs * el = (Edge_list_funcs*) malloc(sizeof(Edge_list_funcs) * funcs.func_size);
    Edge_list_funcs * el_recursed = (Edge_list_funcs*) malloc(sizeof(Edge_list_funcs) * funcs.func_size);

    for (size_t ii = 0; ii < funcs.func_size; ++ii)
    {
        char * funcname = funcs.func_names + ii * PATH_MAX;
        init_EL(el + ii, funcname);
        (el + ii)->num_verts = funcs.regs[ii].size();
        if (!recursive)
        {
            fp = create_edgelist_file(funcname);
        }
        else if (ii == 0)
        {
            strcat(fl_name, ".txt");
            fp = create_edgelist_file(fl_name);
        }
        generate_edge_list(funcs.funcs[ii], funcs.regs[ii], fp, el + ii);
        print_el_to_file(fp, el[ii]);
        if (!recursive) fclose(fp);
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 955d7f1 (ethan spreads false information and maliciously deletes files on my computer so he can blame it on me)
    if (fp == NULL)
    {
        strcat(fl_name, ".txt");
        fp = create_edgelist_file(fl_name);
        free(el);
        free(el_recursed);
        return;
    }
    Recursion_helper_stack * rhs = (Recursion_helper_stack *) malloc(sizeof(Recursion_helper_stack));
<<<<<<< HEAD
=======
>>>>>>> 0a73154 (undoing ethans stupidity)
=======
>>>>>>> 955d7f1 (ethan spreads false information and maliciously deletes files on my computer so he can blame it on me)
    if (recursive)
    {

        int idx_offset = 0;
<<<<<<< HEAD
<<<<<<< HEAD
        init_rhs(rhs);

        for (int ii = 0; ii < (int)funcs.func_size; ii++)
        {
            copy_EL(&el_recursed[ii], &el[ii]);
            el_recursed[ii].recursed = 1;
            recursively_populate(el, &el_recursed[ii], ii, &idx_offset, funcs.func_size, rhs, fp);
            el_recursed[ii].num_verts = idx_offset;
            print_el_to_file(fp, el_recursed[ii]);
            idx_offset = 0;
        }
        fclose(fp);
    }
    cleanup(el, rhs, funcs.func_size);
<<<<<<< HEAD
=======
        Recursion_helper_stack rhs;
        init_rhs(&rhs);
        recursively_populate(el, main_idx, &idx_offset, funcs.func_size, &rhs, fp);
        fclose(fp);
    }

>>>>>>> 0a73154 (undoing ethans stupidity)
=======
        init_rhs(rhs);
        recursively_populate(el, main_idx, &idx_offset, funcs.func_size, rhs, fp);
        fclose(fp);
    }
    cleanup(el, rhs, funcs.func_size);
>>>>>>> 955d7f1 (ethan spreads false information and maliciously deletes files on my computer so he can blame it on me)
=======
    cleanup(el_recursed, NULL, funcs.func_size);
>>>>>>> fc1d6bb (cleaned up output order of operations)
}

/*
 * Currently only works with 1 function.
 * TODO: make work with multiple functions. I already have the struct above
 */
void analyze_registers(FILE *fp, char fl_name[], int file_size, int recursive){

    size_t len = 0, block_idx = 2, line_idx = 0;
    int reg_idx = 0;
    char *line = NULL;
    int in_func = FALSE_, in_block = FALSE_;
    LINE_TYPE loc;
    int num_funcs = file_size / BYTES_PER_FUNCTION;
    IRFuncs block_map;

    block_map.func_size = 0;
    block_map.funcs = (Function*) malloc(num_funcs * sizeof(Function));
    block_map.regs = (Register_mapping*) malloc(num_funcs * sizeof(Register_mapping));
    block_map.func_names = (char*) malloc(num_funcs * sizeof(char) * PATH_MAX);

    new (&block_map.funcs[block_map.func_size]) Function();
    new (&block_map.regs[block_map.func_size]) Register_mapping();

    while (getline(&line, &len, fp) != -1) {
        if (!in_func){
            if (strncmp(line,"define",6) == 0) {
                in_func = TRUE_;
                const char * func_tok_ptr = line;
                long func_tok_len = 0;
                func_tok_ptr = func_machine(func_tok_ptr, func_tok_len);

                const char * reg_tok_ptr = line;
                long reg_tok_len = 0;
                reg_tok_ptr = reg_machine(reg_tok_ptr, reg_tok_len);
                int num_args = 0;
                for (; reg_tok_ptr != NULL; reg_tok_ptr = reg_machine(++reg_tok_ptr, reg_tok_len))
                {
                    num_args++;
                }

                block_idx = num_args;
                in_block = TRUE_;

                if (func_tok_ptr == NULL) {
                    fprintf(stderr,"Could not compute name of function you entered. How did you get here?\n");
                    exit(EXIT_FAILURE);
                }

                char * nameptr = block_map.func_names + PATH_MAX * block_map.func_size;

                // Make file name for edge list
                if (recursive)
                    snprintf(nameptr, PATH_MAX,
                             "%.*s",
                             (int) func_tok_len - 1,
                             func_tok_ptr + 1);
                else
                    snprintf(nameptr, PATH_MAX,
                         "%s_%.*s.txt",                        // {file}_{function}.txt
                         fl_name,
                         (int) func_tok_len - 1,
                         func_tok_ptr + 1);


            } else { continue; }
        }

        if (!in_block){
            if (strchr(line, ':') != NULL){
                in_block = TRUE_;
                block_idx = atoi(line);
            }

            continue;
        }

        /* Interesting stuff in here */
        loc = set_up_blocks(line,
                            block_map.funcs[block_map.func_size],
                            block_idx,
                            block_map.regs[block_map.func_size],
                            reg_idx,fp,len);
        in_block = (loc != LINE_TYPE::BRANCH) ? TRUE_ : FALSE_;

        if (line[0] == '}'){
            line_idx = 0;
            in_func = FALSE_;
            in_block = FALSE_;

            /* Core liveness tracking. All this will have to change for multiple funcs */
            compute_use_def_block(block_map.funcs[block_map.func_size],block_map.regs[block_map.func_size], reg_idx);
            compute_use_def_block_phis(block_map.funcs[block_map.func_size],block_map.regs[block_map.func_size]);

            compute_in_out(block_map.funcs[block_map.func_size], reg_idx);

            /* Here we make the edge list given we have populated all necessary structures */

            block_map.func_size++;

            new (&block_map.funcs[block_map.func_size]) Function();
            new (&block_map.regs[block_map.func_size]) Register_mapping();
            reg_idx = 0;

        } else { line_idx++; }
    }

    fclose(fp);
    if (line)
        free(line);
<<<<<<< HEAD
    free(block_map.func_names);
    free(block_map.funcs);
    free(block_map.regs);
=======
>>>>>>> 0a73154 (undoing ethans stupidity)

    generate_all_edge_lists(block_map, fl_name, recursive);

    for (int i = 0; i < (int)block_map.func_size; i++)
    {
        free_heap_alloc(block_map.funcs[i]);
        block_map.funcs[i].~Function();
        block_map.regs[i].~Register_mapping();
    }

    free(block_map.func_names);
    free(block_map.funcs);
    free(block_map.regs);


    /* Not implemented. This program will brick your computer */
    //free_heap_alloc(block_map);
}

int main(int argc, char **argv){

    char *fl_name;
    FILE *fp;
    char graph_file_ttl[PATH_MAX];
    size_t len_ll, size_noll;

    if (argc != 2){
        fprintf(stderr,"Invalid number of arguments\n");
        return EXIT_FAILURE;
    }

    fl_name = argv[1];

    fp = fopen(fl_name,"r");

    if (fp == NULL){
        fprintf(stderr,"Could not open file %s\n",fl_name);
        return EXIT_FAILURE;
    }

    struct stat st;
    stat(fl_name, &st);
    int size = st.st_size;

    char * last = strrchr(fl_name,'/');
    *last = 'a';
    char * second_last = strrchr(fl_name,'/');
    *last = '/';
    int pathname_len = second_last - fl_name;

    len_ll = 3; // ".ll"
    size_noll = strlen(last) - len_ll - 1;

    strncpy(graph_file_ttl,fl_name,pathname_len);
    graph_file_ttl[pathname_len] = '\0';
    strcat(graph_file_ttl,"/output_graph/");
    strncat(graph_file_ttl,last+1,size_noll);
<<<<<<< HEAD
    printf("\n\nPROCESSING FILE: %s\n\n", graph_file_ttl);
=======
>>>>>>> 0a73154 (undoing ethans stupidity)

    analyze_registers(fp,graph_file_ttl ,size, 1);

    return EXIT_SUCCESS;

}