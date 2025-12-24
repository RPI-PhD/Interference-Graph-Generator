#ifndef INTERFERENCE_GRAPH_GENERATOR_GRAPH_ALGS_H
#define INTERFERENCE_GRAPH_GENERATOR_GRAPH_ALGS_H

#include "master.h"
#include "init.h"


typedef struct
{
    char func_id[256];
    int num_connections;
    int *neighbors;
} Func_vertex;

typedef struct
{
    char * func_name;
    int num_verts;
    int num_edges;
    int alloc_size;
    unsigned int max_degree;
    float avg_degree;
    int chi;
    unsigned int * edges; // n = src, n+1 = dst
    int num_funcs;
    int func_alloc;
    int recursed; // flag
    Func_vertex *calls;
} Edge_list_funcs;

typedef struct
{
    int edges;
    int verts;
    unsigned int max_degree;
    float avg_degree;
    int chi;
    unsigned int * adjlist;
    unsigned int * offsets;
    unsigned int * colors;
} CSR;

typedef struct
{
    int * neighbors;
    int offset;
    int num_neighbors;
} Recursion_helper;

typedef struct
{
    Recursion_helper *helper;
    int alloc_size;
    int cur_depth;
} Recursion_helper_stack;

void init_rhs(Recursion_helper_stack * rhs);

void rhs_push(Recursion_helper_stack * rhs, Recursion_helper * rh);

void init_EL(Edge_list_funcs * el, char * name);

void copy_EL(Edge_list_funcs * dst, Edge_list_funcs * src);

void add_edge(Edge_list_funcs * el, int u, int v);

void add_func(Edge_list_funcs * el, char* func_id, int size);

//void sort_EL_counting(Edge_list_funcs * el, unsigned int * edges)
//{
//    // IMPORTANT: this expects an array of unsigned INTS where [e[n], e[n+1]] represents an edge pair
//    // in order to sort this by src edge then dst edge, it needs to be cast to a long pointer before the call
//
//}

void swap(unsigned long* a, unsigned long* b);

int partition(unsigned long arr[], int l, int h);

void sort_EL_quick(Edge_list_funcs * el, unsigned int * edges);

void init_CSR(CSR * csr, Edge_list_funcs * el);

void free_CSR(CSR * csr);

void color_CSR(CSR *csr);

void verify_colors(CSR * csr, Edge_list_funcs * el);

/*  https://www2.cs.arizona.edu/~collberg/Teaching/553/2011/Handouts/Handout-23.pdf

    FOR all basic blocks b in the program DO
        live := out[b];
        FOR all instructions I ∈ b, in reverse order DO
            FOR all d ∈ def(I) DO
                FOR all l ∈ live ∪ def(I) DO
                    add the interference graph edge hl, di;
            live := use(I) ∪ (live − def(I));
 */
void generate_edge_list(Function &blocks,
                        Register_mapping regmap,
                        Edge_list_funcs * el);

int find_func(Edge_list_funcs * el_list, char* query, int num_funcs);

void recursively_populate(Edge_list_funcs * el_list, Edge_list_funcs * el, int prev_idx, int func_idx,
    int * vidx_offset, int num_funcs, Recursion_helper_stack * rhs, FILE* fp);

void generate_all_edge_lists(IRFuncs &funcs, char* fl_name, int recursive, int coloring);

void cleanup(Edge_list_funcs * el_list, Recursion_helper_stack * rhs, int numfuncs);

#endif //INTERFERENCE_GRAPH_GENERATOR_GRAPH_ALGS_H