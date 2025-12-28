#ifndef INTERFERENCE_GRAPH_GENERATOR_INIT_H
#define INTERFERENCE_GRAPH_GENERATOR_INIT_H

#include "helper_structs.h"
#include <fmt/core.h>



#if defined(__has_include) && __has_include(<fmt/format.h>)
    #include <fmt/format.h>

/*
 * Macro to allow for use of faster fmt library if on machine for string formatting
 *
 * - 1 to adhere to snprintf conventions
 *
*/
    #define IGG_SNPRINTF(RETURN_LEN, DST, BUF_SIZE, FMT_LITERAL, SN_LITERAL, ...) do { \
         fmt::format_to_n_result<char*> _RES = fmt::format_to_n((DST), (BUF_SIZE - 1), \
         (fmt::runtime(FMT_LITERAL)), __VA_ARGS__);                                    \
         (DST)[_RES.size] = '\0';                                                      \
         (RETURN_LEN) = (int)_RES.size;                                                \
    } while (0)

#else
    #error "FMT not found on machine; using standard string formatting"

    #define IGG_SNPRINTF(RETURN_LEN, DST, BUF_SIZE, FMT_LITERAL, SN_LITERAL, ...) do { \
          (RETURN_LEN) = snprintf((DST), (BUF_SIZE), (SN_LITERAL), __VA_ARGS__);       \
    } while (0)

#endif

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
