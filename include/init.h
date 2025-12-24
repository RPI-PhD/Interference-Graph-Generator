#ifndef INTERFERENCE_GRAPH_GENERATOR_INIT_H
#define INTERFERENCE_GRAPH_GENERATOR_INIT_H

#include "helper_structs.h"

typedef enum {
    BRANCH,
    INTERMEDIATE
} LINE_TYPE;

inline const char *skip_whitespace(const char *p){
    for (; *p == ' ' || *p == '\t'; ++p);
    return p;
}

LINE_TYPE set_up_blocks(char *&line, Function &blocks,
                        size_t block_idx,
                        Register_mapping &regMap,
                        int &reg_idx,
                        FILE *fp,
                        size_t &len);

void compute_use_def_instr(const char *line,
                           Block *block,
                           Register_mapping &regMap,
                           int &reg_idx,
                           int is_phi);

void compute_successors(const char *line,
                        Block *block,
                        Register_mapping &regMap,
                        int &reg_idx);

static inline LINE_TYPE handle_switch(char *&line,
                            Block *block,
                            Register_mapping &regMap,
                            int &reg_idx,
                            FILE *fp,
                            size_t &len){

    block->num_succ = 0;
    block->succ_len = 4;

    block->successors = (int*)malloc(block->succ_len * sizeof(int));

    while (line[2] != ']'){

        compute_successors(line,block,regMap,reg_idx);
        getline(&line, &len, fp);

    }

    return LINE_TYPE::BRANCH;

}

static inline LINE_TYPE handle_br(const char *line,
                            Block *block,
                            Register_mapping &regMap,
                            int &reg_idx){
    block->num_succ = 0;
    block->succ_len = 2;

    block->successors = (int*)malloc(block->succ_len * sizeof(int));

    compute_successors(line,block,regMap,reg_idx);
    return LINE_TYPE::BRANCH;
}

#endif
