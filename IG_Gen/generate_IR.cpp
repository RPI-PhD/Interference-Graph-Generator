#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_set>
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
#define BYTES_PER_FUNCTION      50

typedef u_int64_t BITSIZE;

typedef struct {
    char def[MAX_USE_DEF][MAX_USE_DEF];     // I got very lazy. TODO: fix this if you feel like it
    char use[MAX_USE_DEF][MAX_USE_DEF];

    size_t size_def;
    size_t size_use;

} Instruct;

typedef struct {
    size_t reglines;
    BITSIZE *bits;
} bitReg;

typedef struct {

    size_t label;

    size_t instr_len;   // space malloc'd
    size_t num_instr;   // number of instructions we have

    size_t num_succ;    // number of successors we have
    size_t succ_len;    // space malloc'd

    bitReg use_block;   // Doing this because per block requires WAY more registers than per instruction
    bitReg def_block;
    bitReg in_block;
    bitReg out_block;

    int *successors;    //instead of Block**, just have array of indices to look up in Function

    Instruct *instrcts;

} Block;  // TODO: This became really big and should probably be broken into multiple structs (bitstruct, successor struct, etc)

/* We need this if we want to use char* */

typedef std::unordered_map<size_t, Block> Function;
typedef std::unordered_map<std::string, int> Register_mapping;

typedef struct {
    size_t func_size;

    Function *funcs;
    Register_mapping *regs;

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
    for (int i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] & ~b->bits[i];
    }
}

static inline void bit_union_or(bitReg *out, bitReg *a, bitReg *b){
    for (int i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] | b->bits[i];
    }
}

static inline void bit_intersection_and(bitReg *out, bitReg *a, bitReg *b){
    for (int i = 0; i < out->reglines; ++i){
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
 * Other methods
 */

void compute_use_def_block(Function &blocks,Register_mapping &regMap, int num_regs){

    int reg, i, reg_ID;

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

void compute_use_def_instr(const char *line,
                           Block *block,
                           Register_mapping &regMap,
                           int &reg_idx){

    size_t instr_idx, *sz_use, *sz_def;
    const char *eq, *rhs, *lhs, *txt_end, *token;

    instr_idx = block->num_instr;

    sz_def = &block->instrcts[instr_idx].size_def;
    sz_use = &block->instrcts[instr_idx].size_use;

    *sz_def = 0, *sz_use = 0;

    eq = strchr(line, '=');

    rhs = eq == NULL ? line : eq + 1;
    lhs = eq == NULL ? line : eq - 1;

    std::regex re("(%[A-Za-z0-9._]+)");
    txt_end = rhs + strlen(rhs);

    std::cregex_iterator begin_rhs(rhs,txt_end,re);
    std::cregex_iterator begin_lhs(line,lhs,re);

    std::cregex_iterator end;

    for(std::cregex_iterator it = begin_lhs; it != end; ++it){
        const std::cmatch &m = *it;
        token = m[0].first;

        snprintf(block->instrcts[instr_idx].def[*sz_def], m[0].length() + 1,"%.*s",(int)m[0].length(),token);
        std::string map_token(block->instrcts[instr_idx].def[*sz_def],m[0].length());

        if (regMap.find(map_token) == regMap.end()){
            regMap[map_token] = reg_idx;

            reg_idx++;
        }

        (*sz_def)++;
    }

    for(std::cregex_iterator it = begin_rhs; it != end; ++it){
        const std::cmatch &m = *it;
        token = m[0].first;

        snprintf(block->instrcts[instr_idx].use[*sz_use], m[0].length() + 1,"%.*s",(int)m[0].length(),token);
        std::string map_token(block->instrcts[instr_idx].use[*sz_use],m[0].length());

        if (regMap.find(map_token) == regMap.end()){
            regMap[map_token] = reg_idx;

            reg_idx++;
        }

        (*sz_use)++;
    }

    block->num_instr++;
}

void compute_successors(const char *line,
                        Block *block,
                        Register_mapping &regMap,
                        int &reg_idx){

    const char *txt_end, *p;
    size_t instr_idx;

    instr_idx = block->num_instr - 1;

    block->num_succ = 0;

    // First separate out the sub-instructions in the branch line

    std::regex re("(%[A-Za-z0-9._]+)");
    txt_end = line + strlen(line);

    std::cregex_iterator it(line,txt_end,re);
    std::cregex_iterator end;

    block->successors = (int*)malloc(it->size() * sizeof(int));
    block->succ_len = it->size();

    for (; it != end; ++it){

        const std::cmatch &m = *it;
        p = m[0].first;

        /* I'm assuming it will always be "label %{register}",
         * so walk back 6 steps and check for "label " */

        if (p - 6 >= line){
            if (strncmp(p - 6,"label ",6) == 0) {
                block->successors[block->num_succ] = atoi(p + 1);
                block->num_succ++;
            }
        } else {

            block->instrcts[instr_idx].size_use++;
            size_t sz = block->instrcts[instr_idx].size_use;

            if (regMap.find(p) == regMap.end()){
                regMap[p] = reg_idx;

                reg_idx++;
            }
            strcpy(block->instrcts[instr_idx].use[sz - 1],p);

        }


    }
}

// Note to self: Function will be on the stack...only need 1
LINE_TYPE set_up_blocks(const char *line, Function &blocks,
                        size_t block_idx,
                        Register_mapping &regMap,
                        int &reg_idx){

    Block *block;

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
            size_t resize_i = 2 * block->instr_len;
            block->instrcts = (Instruct*) realloc(block->instrcts, resize_i * sizeof(Instruct));
            block->instr_len = resize_i;
        }

        if (block->instrcts == NULL){
            fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
            exit(EXIT_FAILURE);
        }
    }

    /*
     * If we see a branch at the end of a block, we need to store the successors
     *
     * Went with a hash table instead of tree just cuz (would've done tree if still in C)
     */
    if (strncmp(line,"  br", 4) == 0){
        compute_successors(line,block,regMap,reg_idx);
        return LINE_TYPE::BRANCH;
    } else {

        // Per-instruction use/def populating
        compute_use_def_instr(line,block,regMap,reg_idx);
    }

    return LINE_TYPE::INTERMEDIATE;
}

// https://www.geeksforgeeks.org/compiler-design/liveliness-analysis-in-compiler-design/
void compute_in_out(Function &blocks, int num_regs){
    int i, in_diff, out_diff;

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

void free_heap_alloc(Function &blocks){
    for (std::pair<const size_t,Block> &block : blocks){

        Block *bl = &block.second;

        free(bl->instrcts);
        free(bl->successors);
        free(bl->use_block.bits);
        free(bl->def_block.bits);
        free(bl->in_block.bits);
        free(bl->out_block.bits);

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
                        int num_regs,
                        char fl_name[]){
    FILE *fp;
    int i, d, r, u, regnum_d, regnum_u;
    Block *bl;
    bitReg *out;
    Instruct I;
    char* def, *use;

    if(!(fp = create_edgelist_file(fl_name))){
        return;
    }

    bitReg Live;
    init_bits(&Live,num_regs);

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
                        fprintf(fp, "%d %d\n", r, regnum_d);
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
    fclose(fp);
}

/*
 * Currently only works with 1 function.
 * TODO: make work with multiple functions. I already have the struct above
 */
void analyze_registers(FILE *fp, char fl_name[], int file_size){

    size_t len = 0, block_idx = 0, line_idx = 0, i;
    int reg_idx = 0;
    char *line = NULL;
    int in_func = FALSE_, in_block = FALSE_;
    LINE_TYPE loc;
    char gr_nm[PATH_MAX];
    int num_funcs = file_size / BYTES_PER_FUNCTION;
    IRFuncs block_map;
    block_map.func_size = 0;
    block_map.funcs = (Function*) malloc(num_funcs * sizeof(Function));
    block_map.regs = (Register_mapping*) malloc(num_funcs * sizeof(Register_mapping));

    new (&block_map.funcs[block_map.func_size]) Function();
    new (&block_map.regs[block_map.func_size]) Register_mapping();

    std::regex re("(@[A-Za-z0-9._]+)");
    std::cmatch match_out;

    while (getline(&line, &len, fp) != -1) {
        if (!in_func){
            if (strncmp(line,"define",6) == 0) {
                in_func = TRUE_;
                block_idx = 0;
                in_block = TRUE_;

                if (!std::regex_search(line,match_out,re)) {
                    fprintf(stderr,"Could not compute name of function you entered. How did you get here?\n");
                    exit(EXIT_FAILURE);
                }

                // Make file name for edge list
                snprintf(gr_nm, sizeof(gr_nm),
                         "%s_%.*s.txt",                        // {file}_{function}.txt
                         fl_name,
                         (int)match_out[0].length(),
                         match_out[0].first);


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
        loc = set_up_blocks(line,block_map.funcs[block_map.func_size],block_idx,block_map.regs[block_map.func_size],reg_idx);
        in_block = (loc != LINE_TYPE::BRANCH) ? TRUE_ : FALSE_;

        if (line[0] == '}'){        // This is wrong right now and the function never ends TODO: to implement multiple funcs, you fix state machine order first
            line_idx = 0;
            in_func = FALSE_;
            in_block = FALSE_;

            /* Core liveness tracking. All this will have to change for multiple funcs */
            compute_use_def_block(block_map.funcs[block_map.func_size],block_map.regs[block_map.func_size], reg_idx);
            compute_in_out(block_map.funcs[block_map.func_size], reg_idx);

            /* Here we make the edge list given we have populated all necessary structures */
            generate_edge_list(block_map.funcs[block_map.func_size], block_map.regs[block_map.func_size], reg_idx, gr_nm);

            block_map.func_size++;

            new (&block_map.funcs[block_map.func_size]) Function();
            new (&block_map.regs[block_map.func_size]) Register_mapping();
            reg_idx = 0;


        } else { line_idx++; }
    }

    fclose(fp);
    if (line)
        free(line);




    /* Not implemented. This program will brick your computer */
    //free_heap_alloc(block_map);
}

int main(int argc, char **argv){

    char *fl_name;
    FILE *fp;
    char abs_path[PATH_MAX];
    char graph_file_ttl[PATH_MAX];
    size_t len_ll, size_noll;

    if (argc != 2){
        fprintf(stderr,"Invalid number of arguments\n");
        return EXIT_FAILURE;
    }

    fl_name = argv[1];

    if (realpath(fl_name, abs_path) == NULL){
        fprintf(stderr,"Unable to get cwd\n");
        return EXIT_FAILURE;
    }

    fp = fopen(abs_path,"r");

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
    analyze_registers(fp,graph_file_ttl ,size);

    return EXIT_SUCCESS;

}