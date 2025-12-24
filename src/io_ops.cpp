//
// Created by haven on 12/23/25.
//

#include "io_ops.h"

FILE *create_edgelist_file(char fl_name[]){
    FILE *fp;

    fp = fopen(fl_name,"w");

    if (!fp){
        fprintf(stderr,"Could not generate edge list file for %s\n",fl_name);
        return NULL;
    }

    return fp;
}

void print_el_to_file(FILE* fp, Edge_list_funcs &el)
{
    if (el.recursed) fprintf(fp, "# (Recursed)\n");// else fprintf(fp, "# ");
    fprintf(fp, "# Function: %s\n# |V| = %d [0, %d]\n# |E| = %d\n# CHI = %d\n# max_degree = %d\n# avg_degree = %f\n# Number of unexpanded functions: %d, listed last\n\n",
        el.func_name, el.num_verts, el.num_verts-1, el.num_edges, el.chi, el.max_degree, el.avg_degree, el.num_funcs);
    for (int i = 0; i < el.num_edges; ++i)
    {
        fprintf(fp, "e %d %d\n", el.edges[i*2], el.edges[i*2+1]);
    }
    for (int i = 0; i < el.num_funcs; ++i)
    {
        fprintf(fp, "%s", el.calls[i].func_id);
        for (int j = 0; j < el.calls[i].num_connections; ++j){
            fprintf(fp, " %d", el.calls[i].neighbors[j]);
        }
        fprintf(fp, "\n");
    }
    fprintf(fp, "\n");
}
