//
// Created by haven on 12/24/25.
//

#ifndef INTERFERENCE_GRAPH_GENERATOR_HELPER_STRUCTS_H
#define INTERFERENCE_GRAPH_GENERATOR_HELPER_STRUCTS_H

#include "master.h"
#include "bitset_ops.h"

#define TRUE_                   1
#define FALSE_                  0
#define MAX_USE_DEF             20
#define MAX_ID_NAME_LEN         50
#define BYTES_PER_FUNCTION      50
#define MAX_PREDECESSORS        10
#define MAX_NUM_BLOCKS          512
#define MAX_NUM_REGS            2048


/*
 * Useful structs containing node info to later construct edges
 */

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

// Keep around for now just in case we want to profile
// typedef std::unordered_map<size_t, Block> Function;
// typedef std::unordered_map<std::string, int> Register_mapping;

typedef ankerl::unordered_dense::map<size_t, Block> Function;
typedef ankerl::unordered_dense::map<std::string, int> Register_mapping;

typedef struct {
    size_t func_size;

    Function *funcs;
    Register_mapping *regs;
    char *func_names;

} IRFuncs;

#endif //INTERFERENCE_GRAPH_GENERATOR_HELPER_STRUCTS_H