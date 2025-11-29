#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_set>
#include <unordered_map>
#include <regex>

/*
 * Useful structs containing node info to later construct edges
 */

#define TRUE_ 1
#define FALSE_ 0

typedef u_int64_t BITSIZE;

typedef struct {
    std::unordered_set<const char*> def;
    std::unordered_set<const char*> use;
} Instruct;

typedef struct {
    size_t reglines;
    BITSIZE *bits;
} bitReg;

typedef struct {

    size_t label;

    size_t instr_len;
    size_t num_instr;

    size_t num_succ;
    size_t succ_len;

    bitReg use_block;
    bitReg def_block;

    int *successors;    //instead of Block**, just have array of indices to look up in Function

    Instruct *instrcts;
} Block;

typedef std::unordered_map<size_t, Block> Function;

typedef struct {
    size_t size;
    Function *funcs;
} IRFuncs;

typedef enum {
    BRANCH,
    INTERMEDIATE
} LINE_TYPE;

/*
 * Helper bitwise funcs
 */

void init_bits(bitReg *regs, int reg_num){
    int sz = sizeof(BITSIZE) << 3;
    regs->reglines = (reg_num + sz - 1) / sz;
    regs->bits = (BITSIZE*)calloc(regs->reglines, sizeof(BITSIZE));
}

// a - b
inline void bit_diff(bitReg *out, bitReg *a, bitReg *b){
    for (int i = 0; i < out->reglines; ++out){
        out->bits[i] = a->bits[i] & ~b->bits[i];
    }
}

inline void bit_union_or(bitReg *out, bitReg *a, bitReg *b){
    for (int i = 0; i < out->reglines; ++out){
        out->bits[i] = a->bits[i] | b->bits[i];
    }
}

// set register bit to 1
inline void set_reg_live(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    regs->bits[regnum >> 6] |= (1ULL << (regnum & (sz - 1)));
}

// set register bit to 0
inline void kill_reg(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    regs->bits[regnum >> 6] &= ~(1ULL << (regnum & (sz - 1)));
}

// boolean check if register is live
inline int is_active(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    return (int)((regs->bits[regnum >> 6] >> (regnum & (sz - 1))) & 1ULL);
}

/*
 * Other methods
 */

void compute_use_def(const char *line, Block *block){

    size_t instr_idx;
    const char *eq, *rhs, *lhs, *txt_end, *token;

    instr_idx = block->num_instr - 1;

    eq = strchr(line, '=');

    rhs = eq == NULL ? line : eq + 1;
    lhs = eq == NULL ? NULL : eq - 1;

    std::regex re("(%[A-Za-z0-9._]+)");
    txt_end = rhs + strlen(rhs);

    std::cregex_iterator begin_rhs(rhs,txt_end,re);
    std::cregex_iterator begin_lhs(line,lhs,re);

    std::cregex_iterator end;

    for(std::cregex_iterator it = begin_lhs; it != end; ++it){
        const std::cmatch &m = *it;
        token = m[0].first;
        block->instrcts[instr_idx].def.insert(token);
    }

    for(std::cregex_iterator it = begin_rhs; it != end; ++it){
        const std::cmatch &m = *it;
        token = m[0].first;
        block->instrcts[instr_idx].use.insert(token);
    }

    block->num_instr++;
}

void compute_successors(const char *line, Block *block){

    const char *txt_end, *p;
    size_t instr_idx;

    instr_idx = block->num_instr - 1;

    if (block->num_succ == 0){
        block->successors = (int*)malloc(sizeof(int));
        block->num_succ++;
        block->succ_len++;
    }

    // First separate out the sub-instructions in the branch line

    std::regex re("(%[A-Za-z0-9._]+)");
    txt_end = line + strlen(line);

    std::cregex_iterator it(line,txt_end,re);
    std::cregex_iterator end;

    block->successors = (int*)malloc(it->size() * sizeof(int));

    for (; it != end; ++it){

        if (block->num_succ >= block->succ_len){
            size_t resize = 2 * block->succ_len;

            block->successors = (int*)realloc(block->successors,resize * sizeof(int));
            block->succ_len = resize;

            if(block->successors == NULL){
                fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
                exit(EXIT_FAILURE);
            }
        }

        const std::cmatch &m = *it;
        p = m[0].first;

        /* I'm assuming it will always be "label %{register}",
         * so walk back 6 steps and check for "label " */

        if (p - 6 >= line){
            if (strncmp(p - 6,"label ",6) != 0) {
                block->successors[block->num_succ - 1] = atoi(p + 1);
            }
        } else {
            block->instrcts[instr_idx].use.insert(p);
        }

        block->num_succ++;
    }
}

// Note to self: Function will be on the stack...only need 1
LINE_TYPE set_up_blocks(const char *line, Function &blocks, size_t block_idx){

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
            block->num_instr = 1;
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

    // Per-instruction use/def populating
    compute_use_def(line,block);

    /*
     * If we see a branch at the end of a block, we need to store the successors
     *
     * Went with a hash table instead of tree just cuz (would've done tree if still in C)
     */
    if (strncmp(line,"br",2) != 0){
        compute_successors(line,block);
        return LINE_TYPE::BRANCH;
    }

    return LINE_TYPE::INTERMEDIATE;
}

void delete_registers(){}

void analyze_registers(IRFuncs *data, FILE *fp){

    size_t len = 0, funcidx = 0, block_idx = -1, line_idx = 0;
    char *line = NULL;
    int in_func = FALSE_, in_block = FALSE_;
    LINE_TYPE loc;

    Function block_map;

    while (getline(&line, &len, fp) != -1) {
        if (!in_func){
            if (strncmp(line,"define",6) != 0) {
                in_func = TRUE_;
                block_idx = 0;
                in_block = TRUE_;
            } else { continue; }
        }

        if (!in_block){
            if (strchr(line, ':') != NULL){
                in_block = TRUE_;
                block_idx = atoi(line);
            } else { continue; }
        }

        /* Interesting stuff in here */
        loc = set_up_blocks(line,block_map,block_idx);
        in_block = (loc == LINE_TYPE::BRANCH) ? TRUE_ : FALSE_;

        if (line[0] == '}'){
            funcidx++;
            line_idx = 0;
            in_func = FALSE_;
            in_block = FALSE_;
        } else { line_idx++; }
    }

    fclose(fp);
    if (line)
        free(line);


}

int main(int argc, char **argv){

    char *fl_name;
    FILE *fp;

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

    return EXIT_SUCCESS;
}