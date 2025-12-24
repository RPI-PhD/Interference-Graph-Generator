#ifndef INTERFERENCE_GRAPH_GENERATE_IR_H
#define INTERFERENCE_GRAPH_GENERATE_IR_H

#include "init.h"
#include "state_machine.h"
#include "graph_algs.h"

/*
 * Other methods
 */

void compute_use_def_block(Function &blocks, const Register_mapping &regMap, const int num_regs);

void compute_use_def_block_phis(Function &blocks,Register_mapping &regMap);

// https://www.geeksforgeeks.org/compiler-design/liveliness-analysis-in-compiler-design/
void compute_in_out(Function &blocks, int num_regs);

void free_heap_alloc(Function &blocks);

void analyze_registers(FILE *fp, char fl_name[], int file_size, int recursive, int coloring);

#endif //INTERFERENCE_GRAPH_GENERATE_IR_H