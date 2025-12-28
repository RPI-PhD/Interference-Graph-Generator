//
// Created by haven on 12/23/25.
//

#include "../include/graph_algs.h"
#include "../include/io_ops.h"
#include "../include/aligned_realloc.h"

void init_rhs(Recursion_helper_stack * rhs)
{
    rhs->cur_depth = -1;
    rhs->alloc_size = 4;
    rhs->helper = (Recursion_helper *)malloc(sizeof(Recursion_helper) * rhs->alloc_size);
}

void rhs_push(Recursion_helper_stack * rhs, Recursion_helper * rh)
{
    if (rhs->cur_depth+1 >= rhs->alloc_size)
    {
        rhs->alloc_size = rhs->alloc_size * 2;
        rhs->helper = (Recursion_helper *)realloc(rhs->helper, sizeof(Recursion_helper) * rhs->alloc_size);
    }
    rhs->cur_depth++;
    rhs->helper[rhs->cur_depth].offset = rh->offset;
    rhs->helper[rhs->cur_depth].neighbors = rh->neighbors;
    rhs->helper[rhs->cur_depth].num_neighbors = rh->num_neighbors;
}

void init_EL(Edge_list_funcs * el, char * name)
{
    el->func_name = (char*) malloc(strlen(name) + 1);
    strcpy(el->func_name, name);
    el->num_edges = 0;
    el->num_verts = 0;
    el->alloc_size = 8;
    el->edges = (unsigned int *)aligned_alloc(16, sizeof(unsigned int) * el->alloc_size);
    el->num_funcs = 0;
    el->func_alloc = 2;
    el->calls = (Func_vertex *)malloc(sizeof(Func_vertex) * el->func_alloc);
    el->recursed = 0;
    el->max_degree = 0;
    el->avg_degree = 0;
}

void copy_EL(Edge_list_funcs * dst, Edge_list_funcs * src)
{
    dst->func_name = (char*) malloc(strlen(src->func_name) + 1);
    strcpy(dst->func_name, src->func_name);
    dst->num_edges = src->num_edges;
    dst->num_verts = src->num_verts;
    dst->alloc_size = src->alloc_size;
    dst->edges = (unsigned int *)aligned_alloc(16, sizeof(unsigned int) * dst->alloc_size);
    memcpy(dst->edges, src->edges, sizeof(int) * dst->num_edges * 2);
    dst->num_funcs = 0;
    dst->func_alloc = 2;
    dst->calls = (Func_vertex *)malloc(sizeof(Func_vertex) * dst->func_alloc);
    dst->max_degree = src->max_degree;
    dst->chi = src->chi;
}

void add_edge(Edge_list_funcs * el, int u, int v)
{
    if (el->num_edges * 2 >= el->alloc_size - 2)
    {
        el->alloc_size = el->alloc_size * 2;
        el->edges = (unsigned int *)aligned_realloc_glibc(el->edges, sizeof(unsigned int) * el->alloc_size,
            16, sizeof(unsigned int) * el->alloc_size / 2);
    }
    el->edges[el->num_edges*2] = u;
    el->edges[el->num_edges*2+1] = v;
    el->num_edges++;
}

void add_func(Edge_list_funcs * el, char* func_id, int size)
{
    if (el->num_funcs >= el->func_alloc-1)
    {
        el->func_alloc = el->func_alloc * 2;
        el->calls = (Func_vertex *)realloc(el->calls, sizeof(Func_vertex) * el->func_alloc);
    }

    strcpy(el->calls[el->num_funcs].func_id, func_id);
    el->calls[el->num_funcs].num_connections = size;
    el->calls[el->num_funcs].neighbors = (int *)malloc(sizeof(int) * size);
    el->num_funcs++;
}

//void sort_EL_counting(Edge_list_funcs * el, unsigned int * edges)
//{
//    // IMPORTANT: this expects an array of unsigned INTS where [e[n], e[n+1]] represents an edge pair
//    // in order to sort this by src edge then dst edge, it needs to be cast to a long pointer before the call
//
//}

void swap(unsigned long* a, unsigned long* b)
{
    unsigned long t = *a;
    *a = *b;
    *b = t;
}

int partition(unsigned long arr[], int l, int h)
{
    unsigned long x = arr[h];
    int i = (l - 1);

    for (int j = l; j <= h - 1; j++) {
        if (arr[j] <= x) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[h]);
    return (i + 1);
}

void sort_EL_quick(Edge_list_funcs * el, unsigned int * edges)
{
    // IMPORTANT: this expects an array of unsigned INTS where [e[n], e[n+1]] represents an edge pair
    // in order to sort this by src edge then dst edge, it needs to be cast to a long pointer before the call
    // adapted from g4g https://www.geeksforgeeks.org/dsa/iterative-quick-sort/
    unsigned long * combined_edges = (unsigned long *) edges;
    int low = 0;
    int high = el->num_edges - 1;
    if (low == high) return;
    int * stack = (int*)malloc(el->num_edges * sizeof(int));
    int stack_idx = -1;

    stack[++stack_idx] = low;
    stack[++stack_idx] = high;
    while (stack_idx >= 0)
    {
        high = stack[stack_idx--];
        low = stack[stack_idx--];
        int p = partition(combined_edges, low, high);
        if (p - 1 > low) {
            stack[++stack_idx] = low;
            stack[++stack_idx] = p - 1;
        }
        if (p + 1 < high) {
            stack[++stack_idx] = p + 1;
            stack[++stack_idx] = high;
        }
    }
    free(stack);
}

void init_CSR(CSR * csr, Edge_list_funcs * el)
{
    //expects a sorted edgelist nah nvm
    csr->edges = el->num_edges;
    csr->verts = el->num_verts;
    csr->max_degree = 0;
    csr->chi = 0;
    csr->adjlist = (unsigned int *) malloc(sizeof(unsigned int) * el->num_edges * 2);
    csr->offsets = (unsigned int *) malloc(sizeof(unsigned int) * (el->num_verts + 1));
    csr->colors = (unsigned int *) calloc(el->num_verts, sizeof(unsigned int));
    unsigned int *deg = (unsigned int *) calloc(csr->verts, sizeof(unsigned int));

    for (int i = 0; i < el->num_edges * 2; i++)
    {
        deg[el->edges[i]]++;
    }
    csr->offsets[0] = 0;
    for (int i = 1; i <= csr->verts; i++)
    {
        csr->offsets[i] = deg[i-1] + csr->offsets[i-1];
        csr->max_degree = deg[i-1] > csr->max_degree ? deg[i-1] : csr->max_degree;
    }
    csr->avg_degree = (float)csr->edges / (float)csr->verts;
    el->avg_degree = csr->avg_degree;
    el->max_degree = csr->max_degree;

    memcpy(deg, csr->offsets, sizeof(unsigned int) * csr->verts);
    for (int i = 0; i < el->num_edges; i++)
    {
        csr->adjlist[deg[el->edges[i * 2]]++] = el->edges[i * 2 + 1];
        csr->adjlist[deg[el->edges[i * 2 + 1]]++] = el->edges[i * 2];
    }
    free(deg);
}

void free_CSR(CSR * csr)
{
    free(csr->adjlist);
    free(csr->offsets);
    free(csr->colors);
}

void color_CSR(CSR *csr)
{
    short * seen = (short *) calloc(csr->verts + 1, sizeof(short));
    for (int i = 0; i < csr->verts; i++)
    {
        int my_offset = csr->offsets[i];
        int next_offset = csr->offsets[i+1];
        for (int j = my_offset; j < next_offset; j++)
        {
            seen[csr->colors[csr->adjlist[j]]] = 1;
        }
        for (int j = 0; j < csr->verts + 1; j++)
        {
            if (csr->colors[i] == 0 && seen[j] == 0)
            {
                csr->colors[i] = j;
                csr->chi = csr->chi > j ? csr->chi : j;
            }
            seen[j] = 0;
        }
    }
    free(seen);
}

void verify_colors(CSR * csr, Edge_list_funcs * el)
{
    for (int i = 0; i < csr->edges; i++)
    {
        if (csr->colors[el->edges[i*2]] == csr->colors[el->edges[i*2+1]])
            printf("FAILURE\n");
    }
}

void generate_edge_list(Function &blocks,
                        Register_mapping regmap,
                        Edge_list_funcs * el){
    int i, r, regnum_d, regnum_u;
    size_t d, u;
    Block *bl;
    bitReg *out;
    Instruct I;
    char* def, *use;

    int num_regs = regmap.size();
    bitReg Live;
    init_bits(&Live, num_regs);

    for (Function::value_type &block : blocks){

        bl = &block.second;
        out = &bl->out_block;

        for (i = 0; i < out->reglines; ++i)
            Live.bits[i] = out->bits[i];

        for (i = bl->num_instr - 1; i >= 0; --i){
            I = bl->instrcts[i];


            for (d = 0; d < I.size_def; ++d){

                def = I.def[d];
                regnum_d = regmap[def];

                for (r = 0; r < num_regs; ++r){
                    if(bit_is_active(&Live,r) && r != regnum_d){
                        add_edge(el, r, regnum_d);
                    }
                }

                if (I.func_name != nullptr)
                {

                    int count = 0;
                    for (r = 0; r < num_regs; ++r){
                        if(bit_is_active(&Live,r) && r != regnum_d){
                            count++;
                        }
                    }
                    add_func(el, I.func_name, count);
                    int idx = 0;
                    for (r = 0; r < num_regs; ++r){
                        if(bit_is_active(&Live,r) && r != regnum_d){
                            el->calls[el->num_funcs-1].neighbors[idx] = r;
                            idx++;
                        }
                    }

                }

            }


            // live := use(I) ∪ (live − def(I))
            for (d = 0; d < I.size_def; ++d){
                def = I.def[d];
                regnum_d = regmap[def];
                kill_reg(&Live,regnum_d);

            }

            for (u = 0; u < I.size_use; ++u){
                use = I.use[u];
                regnum_u = regmap[use];
                set_reg_live(&Live,regnum_u);
            }

        }

    }

    free(Live.bits);
}

int find_func(Edge_list_funcs * el_list, char* query, int num_funcs)
{
    for (int i = 0; i < num_funcs; ++i)
    {
        if (strcmp(el_list[i].func_name, query) == 0) return i;
    }
    return -1;
}

void recursively_populate(Edge_list_funcs * el_list, Edge_list_funcs * el, int prev_idx, int func_idx,
    int * vidx_offset, int num_funcs, Recursion_helper_stack * rhs, FILE* fp)
{
    int myoffset = *vidx_offset;
    // step 1: print current funcs edges
    for (int i = 0; i < el_list[func_idx].num_edges; i++)
    {
        int u = el_list[func_idx].edges[i*2]+myoffset;
        int v = el_list[func_idx].edges[i*2+1]+myoffset;
        if (rhs->cur_depth != -1)
        {
            add_edge(el, u, v);
        }
    }
    // step 2: deal with parents interferences
    *vidx_offset += el_list[func_idx].num_verts;
    //for each u in func neighbors of entire parent call chain
    for (int stackidx = 0; stackidx < rhs->cur_depth+1; stackidx++)
    {
        for (int u = 0; u < rhs->helper[stackidx].num_neighbors; u++)
        {
            int u_offset = rhs->helper[stackidx].neighbors[u] + rhs->helper[stackidx].offset;
            for (int v = myoffset; v < myoffset+el_list[func_idx].num_verts; ++v)
            {
                add_edge(el, u_offset, v);
            }
        }
    }

    // step 3: iterate through func calls
    for (int i = 0; i < el_list[func_idx].num_funcs; i++)
    {
        int next = find_func(el_list, el_list[func_idx].calls[i].func_id, num_funcs);

        if (next == -1 || func_idx == prev_idx)
        {
            // if the function's graph isn't known (i.e. dlls), all we can do is drop the label and its interferences
            add_func(el, el_list[func_idx].calls[i].func_id, el_list[func_idx].calls[i].num_connections);
            for (int j = 0; j < el_list[func_idx].calls[i].num_connections; ++j){
                el->calls[el->num_funcs-1].neighbors[j] = el_list[func_idx].calls[i].neighbors[j] + myoffset;
            }
        }
        else
        {
            Recursion_helper rs;
            rs.neighbors = el_list[func_idx].calls[i].neighbors;
            rs.num_neighbors = el_list[func_idx].calls[i].num_connections;
            rs.offset = myoffset;
            rhs_push(rhs, &rs);

            recursively_populate(el_list, el, func_idx, next, vidx_offset, num_funcs, rhs, fp);
        }
    }
    if (rhs->cur_depth >= 0) rhs->cur_depth--;
}

void generate_all_edge_lists(IRFuncs &funcs, char* fl_name, int recursive, int coloring)
{
    FILE* fp = NULL;
    Edge_list_funcs * el = (Edge_list_funcs*) malloc(sizeof(Edge_list_funcs) * funcs.func_size);
    Edge_list_funcs * el_recursed = (Edge_list_funcs*) malloc(sizeof(Edge_list_funcs) * funcs.func_size);

    for (size_t ii = 0; ii < funcs.func_size; ++ii)
    {
        char * funcname = funcs.func_names + ii * PATH_MAX;
        init_EL(el + ii, funcname);
        (el + ii)->num_verts = funcs.regs[ii].size();
        if (ii == 0)
        {
            strcat(fl_name, ".txt");
            fp = create_edgelist_file(fl_name);
        }
        generate_edge_list(funcs.funcs[ii], funcs.regs[ii], el + ii);
        if (coloring)
        {
            CSR csr;
            init_CSR(&csr, &el[ii]);
            color_CSR(&csr);
            el[ii].chi = csr.chi;
            verify_colors(&csr, &el[ii]);
            free_CSR(&csr);
        }
        else
        {
            el[ii].avg_degree = (float) el[ii].num_edges / (float) el[ii].num_verts;
            el[ii].chi = 0;
        }
        print_el_to_file(fp, el[ii]);
    }
    if (fp == NULL)
    {
        strcat(fl_name, ".txt");
        free(el);
        free(el_recursed);
        return;
    }
    if (recursive)
    {
        Recursion_helper_stack * rhs = (Recursion_helper_stack *) malloc(sizeof(Recursion_helper_stack));
        int idx_offset = 0;
        init_rhs(rhs);

        for (int ii = 0; ii < (int)funcs.func_size; ii++)
        {
            copy_EL(&el_recursed[ii], &el[ii]);
            el_recursed[ii].recursed = 1;
            recursively_populate(el, &el_recursed[ii], -1 , ii, &idx_offset, funcs.func_size, rhs, fp);
            el_recursed[ii].num_verts = idx_offset;
            if (coloring)
            {
                CSR csr;
                init_CSR(&csr, &el_recursed[ii]);
                color_CSR(&csr);
                el_recursed[ii].chi = csr.chi;
                verify_colors(&csr, &el_recursed[ii]);
                free_CSR(&csr);
            }
            else
            {
                el_recursed[ii].avg_degree = (float) el_recursed[ii].num_edges / (float) el_recursed[ii].num_verts;
                el_recursed[ii].chi = 0;
            }
            print_el_to_file(fp, el_recursed[ii]);
            idx_offset = 0;
        }
        cleanup(el_recursed, rhs, funcs.func_size);
    }
    else free(el_recursed);

    flushBuffer(fp);
    fclose(fp);

    cleanup(el, NULL, funcs.func_size);
}

void cleanup(Edge_list_funcs * el_list, Recursion_helper_stack * rhs, int numfuncs)
{
    for (int i = 0; i < numfuncs; i++)
    {
        for (int j = 0; j < el_list[i].num_funcs; j++)
        {
            free(el_list[i].calls[j].neighbors);
        }
        free(el_list[i].calls);
        free(el_list[i].edges);
        free(el_list[i].func_name);
    }
    free(el_list);
    if (rhs == NULL) return;
    free(rhs->helper);
    free(rhs);
}

