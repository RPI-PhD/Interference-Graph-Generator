#ifndef INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H
#define INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H

#include "graph_algs.h"

#define BUF_SIZE 0x0000

static char BUFFER[BUF_SIZE];
static size_t write_siz = 0;


typedef struct
{
    int recursive;
    int coloring;
} Flags;

void parse_args(Flags* flags, const char *arg);

FILE *create_edgelist_file(char fl_name[]);

void print_el_to_file(FILE* fp, Edge_list_funcs &el);

static inline void flushBuffer(FILE *fp){
    if (write_siz) {
        fwrite(BUFFER, write_siz, 1, fp);
        write_siz = 0;
    }
}

static inline void write_chars(FILE *fp, const char *wstring, size_t len_str){

    while (len_str){
        size_t space = BUF_SIZE - write_siz;

        if (space == 0){
            flushBuffer(fp);
            space = BUF_SIZE;
        }

        size_t fit = (space < len_str) ? space : len_str;

        memcpy(BUFFER + write_siz, wstring, fit);
        write_siz += fit;
        wstring += fit;
        len_str -= fit;
    }

}

#endif //INTERFERENCE_GRAPH_GENERATOR_IO_OPS_H