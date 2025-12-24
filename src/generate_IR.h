
#ifndef INTERFERENCE_GRAPH_GENERATE_IR_H
#define INTERFERENCE_GRAPH_GENERATE_IR_H

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_map>
#include <regex>
#include <iostream>
#include <climits>
#include <unistd.h>
#include <sys/stat.h>

#include "bitset_ops.h"
#include "state_machine.h"

/*
 * Useful structs containing node info to later construct edges
 */

#define TRUE_                   1
#define FALSE_                  0
#define MAX_USE_DEF             20
#define MAX_ID_NAME_LEN         50
#define BYTES_PER_FUNCTION      50
#define MAX_PREDECESSORS        10

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
 * Other methods
 */

void compute_use_def_block(Function &blocks,Register_mapping &regMap, int num_regs);

void compute_use_def_block_phis(Function &blocks,Register_mapping &regMap);

void compute_use_def_instr(const char *line,
                           Block *block,
                           Register_mapping &regMap,
                           int &reg_idx,
                           int is_phi);

void compute_successors(const char *line,
                        Block *block,
                        Register_mapping &regMap,
                        int &reg_idx);

LINE_TYPE set_up_blocks(char *&line, Function &blocks,
                        size_t block_idx,
                        Register_mapping &regMap,
                        int &reg_idx,
                        FILE *fp,
                        size_t &len);

// https://www.geeksforgeeks.org/compiler-design/liveliness-analysis-in-compiler-design/
void compute_in_out(Function &blocks, int num_regs);

void free_heap_alloc(Function &blocks);

void analyze_registers(FILE *fp, char fl_name[], int file_size, int recursive, int coloring);

#endif //INTERFERENCE_GRAPH_GENERATE_IR_H