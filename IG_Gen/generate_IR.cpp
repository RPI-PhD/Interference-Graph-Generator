#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_set>
#include <unordered_map>
#include <regex>

/*
 * Useful structs containing node info to later construct edges
 */

#define TRUE_           1
#define FALSE_          0
#define NUM_REGISTERS   64
#define MAX_USE_DEF     8

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

typedef std::unordered_map<size_t, Block> Function;
typedef std::unordered_map<const char *, int> Register_mapping;

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

static void init_bits(bitReg *regs, int reg_num){
    int sz = sizeof(BITSIZE) << 3;
    regs->reglines = (reg_num + sz - 1) / sz;
    regs->bits = (BITSIZE*)calloc(regs->reglines, sizeof(BITSIZE));
}

// a - b
static inline void bit_diff(bitReg *out, bitReg *a, bitReg *b){
    for (int i = 0; i < out->reglines; ++out){
        out->bits[i] = a->bits[i] & ~b->bits[i];
    }
}

static inline void bit_union_or(bitReg *out, bitReg *a, bitReg *b){
    for (int i = 0; i < out->reglines; ++out){
        out->bits[i] = a->bits[i] | b->bits[i];
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

void compute_use_def_block(Function &blocks,Register_mapping &regMap){

    int reg, i, reg_ID;

    for (std::pair<const size_t,Block> &block : blocks){

        Block *bl = &block.second;
        init_bits(&bl->use_block,NUM_REGISTERS);
        init_bits(&bl->def_block,NUM_REGISTERS);

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
                           size_t &reg_idx){

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

        block->instrcts[instr_idx].size_def++;
        size_t sz = block->instrcts[instr_idx].size_def;

        if (regMap.find(token) == regMap.end()){
            regMap[token] = reg_idx;

            reg_idx++;
        }
        strcpy(block->instrcts[instr_idx].def[sz - 1],token);

    }

    for(std::cregex_iterator it = begin_rhs; it != end; ++it){
        const std::cmatch &m = *it;
        token = m[0].first;

        block->instrcts[instr_idx].size_use++;
        size_t sz = block->instrcts[instr_idx].size_use;

        if (regMap.find(token) == regMap.end()){
            regMap[token] = reg_idx;

            reg_idx++;
        }
        strcpy(block->instrcts[instr_idx].use[sz - 1],token);
    }

    block->num_instr++;
}

void compute_successors(const char *line,
                        Block *block,
                        Register_mapping &regMap,
                        size_t &reg_idx){

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

            block->instrcts[instr_idx].size_use++;
            size_t sz = block->instrcts[instr_idx].size_use;

            if (regMap.find(p) == regMap.end()){
                regMap[p] = reg_idx;

                reg_idx++;
            }
            strcpy(block->instrcts[instr_idx].use[sz - 1],p);

        }

        block->num_succ++;
    }
}

// Note to self: Function will be on the stack...only need 1
LINE_TYPE set_up_blocks(const char *line, Function &blocks,
                        size_t block_idx,
                        Register_mapping &regMap,
                        size_t &reg_idx){

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
    compute_use_def_instr(line,block,regMap,reg_idx);

    /*
     * If we see a branch at the end of a block, we need to store the successors
     *
     * Went with a hash table instead of tree just cuz (would've done tree if still in C)
     */
    if (strncmp(line,"br",2) != 0){
        compute_successors(line,block,regMap,reg_idx);
        return LINE_TYPE::BRANCH;
    }

    return LINE_TYPE::INTERMEDIATE;
}

void compute_in_out(Function &blocks, Register_mapping &regMap){
    int i, in_diff, out_diff;

    bitReg in_copy, out_copy, tmp;

    init_bits(&in_copy,NUM_REGISTERS);
    init_bits(&out_copy,NUM_REGISTERS);
    init_bits(&tmp,NUM_REGISTERS);

    for (std::pair<const size_t,Block> &block : blocks){
        Block *bl = &block.second;

        init_bits(&bl->in_block,NUM_REGISTERS);
        init_bits(&bl->out_block,NUM_REGISTERS);


    }

    do {

        in_diff = out_diff = FALSE_;

        for (std::pair<const size_t,Block> &block : blocks){

            Block *bl = &block.second;
            bitReg *in = &bl->in_block;
            bitReg *out = &bl->out_block;

            in_diff = memcmp(in->bits,in_copy.bits,in->reglines * sizeof(BITSIZE)) != FALSE_;
            out_diff = memcmp(out->bits,out_copy.bits,out->reglines * sizeof(BITSIZE)) != FALSE_;

            if (in_diff || out_diff){

            }
        }




    } while (in_diff || out_diff);

}

void delete_registers(){}

/*
 * Currently only works with 1 function.
 * TODO: make work with multiple functions. I already have the struct above
 */
void analyze_registers(FILE *fp){

    size_t len = 0, funcidx = 0, block_idx = 0, line_idx = 0, reg_idx = 0, i;
    char *line = NULL;
    int in_func = FALSE_, in_block = FALSE_;
    LINE_TYPE loc;
    Register_mapping map_regs;
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
        loc = set_up_blocks(line,block_map,block_idx,map_regs,reg_idx);
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

    /* Core liveness tracking. All this will have to change for multiple funcs */
    compute_use_def_block(block_map,map_regs);
    compute_in_out(block_map,map_regs);
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