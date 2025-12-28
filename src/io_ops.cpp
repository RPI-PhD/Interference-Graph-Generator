//
// Created by haven on 12/23/25.
//

#include "../include/io_ops.h"
#define COPY_BUFFER_SIZE    200

void parse_args(Flags* flags, const char *arg)
{
    if (arg == NULL || flags == NULL) return;
    if (*arg != '-') return;
    for (; *arg != '\0'; arg++)
    {
        switch (*arg)
        {
        case 'r':
            flags->recursive = TRUE_;
            break;
        case 'c':
            flags->coloring = TRUE_;
            break;
        default:
            break;
        }
    }
}

FILE *create_edgelist_file(char fl_name[]){
    FILE *fp;

    fp = fopen(fl_name,"w");
    setvbuf(fp, BUFFER, _IOFBF, BUF_SIZE);

    if (!fp){
        fprintf(stderr,"Could not generate edge list file for %s\n",fl_name);
        return NULL;
    }

    return fp;
}

void print_el_to_file(FILE* fp, Edge_list_funcs &el)
{

    char buffer[COPY_BUFFER_SIZE];
    int res_len;

    if (el.recursed) write_chars(fp, "# (Recursed)\n", 13); // fprintf(fp, "# (Recursed)\n");// else fprintf(fp, "# ");

//    fprintf(fp, "# Function: %s\n# |V| = %d [0, %d]\n# |E| = %d\n# CHI = %d\n# max_degree = %d\n# avg_degree = %f\n# Number of unexpanded functions: %d, listed last\n\n",
//     el.func_name, el.num_verts, el.num_verts-1, el.num_edges, el.chi, el.max_degree, el.avg_degree, el.num_funcs);

    IGG_SNPRINTF(res_len, buffer, COPY_BUFFER_SIZE,
                 "# Function: {}\n"
                 "# |V| = {} [0, {}]\n"
                 "# |E| = {}\n"
                 "# CHI = {}\n"
                 "# max_degree = {}\n"
                 "# avg_degree = {}\n"
                 "# Number of unexpanded functions: {}, listed last\n\n",
                 "# Function: %s\n"
                 "# |V| = %d [0, %d]\n"
                 "# |E| = %d\n"
                 "# CHI = %d\n"
                 "# max_degree = %d\n"
                 "# avg_degree = %f\n"
                 "# Number of unexpanded functions: %d, listed last\n\n",
                 el.func_name, el.num_verts, el.num_verts-1, el.num_edges, el.chi, el.max_degree, el.avg_degree, el.num_funcs);

    write_chars(fp, buffer, res_len);

    for (int i = 0; i < el.num_edges; ++i)
    {
        // fprintf(fp, "e %d %d\n", el.edges[i*2], el.edges[i*2+1]);

        IGG_SNPRINTF(res_len, buffer, COPY_BUFFER_SIZE,
                     "e {} {}\n",
                     "e %d %d\n",
                     el.edges[i*2], el.edges[i*2+1]);

        write_chars(fp, buffer, res_len);

    }

    for (int i = 0; i < el.num_funcs; ++i)
    {

        IGG_SNPRINTF(res_len, buffer, COPY_BUFFER_SIZE,
                     "{}",
                     "%s",
                     el.calls[i].func_id);

        write_chars(fp, buffer, res_len);

        // fprintf(fp, "%s", el.calls[i].func_id);

        for (int j = 0; j < el.calls[i].num_connections; ++j){

            IGG_SNPRINTF(res_len, buffer, COPY_BUFFER_SIZE,
                         " {}",
                         " %d",
                         el.calls[i].neighbors[j]);
            write_chars(fp, buffer, res_len);

            // fprintf(fp, " %d", el.calls[i].neighbors[j]);
        }

        write_chars(fp, "\n", 1);

        // fprintf(fp, "\n");
    }

    write_chars(fp, "\n", 1);
    // fprintf(fp, "\n");

}
