#include <cstdio>
#include <cstdlib>
#include <string>
#include <cstring>
#include <unordered_set>
#include <regex>

/*
 * Useful structs containing node info to later construct edges
 */

#define TRUE_ 1
#define FALSE_ 0

typedef u_int64_t BITSIZE;

typedef struct {
    std::unordered_set<char*> def;
    std::unordered_set<char*> use;
    int use_count;
} Instruct;

typedef struct {
    size_t num_succ;
    int label;
    int *successors;
    Instruct *instrcts;
} Block;

typedef struct {
    size_t num_blocks;
    Block *blocks;
} Function;

typedef struct {
    size_t size;
    Function *funcs;
} IRFuncs;

typedef struct {
    size_t reglines;
    BITSIZE *bits;
} bitReg;

static std::unordered_set<char*> regHash;

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

void compute_use_def();

// Note to self: Function will be on the stack...only need 1
void set_up_blocks(const char *line, Function *blocks, int block_idx, int instruct_idx){

    if (blocks->num_blocks == 0){
        blocks->blocks = (Block*)calloc(1, sizeof(Block));
        blocks->num_blocks = 1;
    }

    if (block_idx >= blocks->num_blocks){

        blocks->blocks = (Block*)realloc(blocks->blocks,(block_idx + 1) * sizeof(Block));

        if (blocks->blocks == NULL){
            fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
            exit(EXIT_FAILURE);
        }

        blocks->blocks[block_idx].label = std::stoi(line);
    }

    char* eq = (char*)strchr(line, '=');

    char* rhs = (char*)line;
    if (eq) {
        rhs = eq + 1;
        while (*rhs == ' ' || *rhs == '\t') rhs++;
        blocks->blocks[block_idx].instrcts[instruct_idx].def.insert(rhs);
    }

    std::regex re("(%[A-Za-z0-9._]+)");
    std::cmatch match;
    //TODO: POPULATE USE
}

void delete_registers(regs *registers){

}

void analyze_registers(IRFuncs *data, FILE *fp){
    size_t len = 0, funcidx = 0;
    char *line = NULL;
    int in_func = FALSE_, in_block = FALSE_;

    while (getline(&line, &len, fp) != -1) {
        if (!in_func){
            if (strncmp(line,"define",6) != 0) {
                in_func = TRUE_;
            } else { continue; }
        }

        if (!in_block){
            if (strchr(line, ':') != NULL){
                in_block = TRUE_;
            } else { continue; }
        }

        // Check if we're on a line with a block label


        /* Interesting stuff in here */

        if (line[0] == '}'){
            funcidx++;
            in_func = FALSE_;
        }
    }

    fclose(fp);
    if (line)
        free(line);
}

int main(int argc, char **argv){
    if (argc != 2){
        fprintf(stderr,"Invalid number of arguments\n");
        return EXIT_FAILURE;
    }

    char *fl_name = argv[1];
    FILE *fp = fopen(fl_name,"r");

    if (fp == NULL){
        fprintf(stderr,"Could not open file %s\n",fl_name);
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}