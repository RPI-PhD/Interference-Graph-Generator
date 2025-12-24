//
// Created by haven on 12/23/25.
//

#ifndef INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H
#define INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H
#include <stdio.h>
#include "graph_algs.h"


FILE *create_edgelist_file(char fl_name[]);

void print_el_to_file(FILE* fp, Edge_list_funcs &el);

#endif //INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H