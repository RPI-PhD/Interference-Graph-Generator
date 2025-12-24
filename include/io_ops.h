#ifndef INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H
#define INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H

#include "graph_algs.h"

typedef struct
{
    int recursive;
    int coloring;
} Flags;

void parse_args(Flags* flags, const char *arg);

FILE *create_edgelist_file(char fl_name[]);

void print_el_to_file(FILE* fp, Edge_list_funcs &el);

#endif //INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H