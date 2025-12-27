#include "../include/generate_IR.h"
#include "../include/io_ops.h"

int main(int argc, char **argv){

    char *fl_name;
    FILE *fp;
    char graph_file_ttl[PATH_MAX];
    size_t len_ll, size_noll;

    if (argc < 2){
        fprintf(stderr,"Invalid number of arguments\n");
        return EXIT_FAILURE;
    }

    Flags * flags = (Flags *) calloc(1, sizeof(Flags));

    for (int ii = 0; ii < argc; ii++)
    {
        parse_args(flags, argv[ii]);
    }

    fl_name = argv[1];

    fp = fopen(fl_name,"r");

    if (fp == NULL){
        fprintf(stderr,"Could not open file %s\n",fl_name);
        return EXIT_FAILURE;
    }

    struct stat st;
    stat(fl_name, &st);
    int size = st.st_size;

    char * last = strrchr(fl_name,'/');
    *last = 'a';
    char * second_last = strrchr(fl_name,'/');
    *last = '/';
    int pathname_len = second_last - fl_name;

    len_ll = 3; // ".ll"
    size_noll = strlen(last) - len_ll - 1;

    strncpy(graph_file_ttl,fl_name,pathname_len);
    graph_file_ttl[pathname_len] = '\0';
    strcat(graph_file_ttl,"/output_graph/");
    strncat(graph_file_ttl,last+1,size_noll);

    analyze_registers(fp,graph_file_ttl ,size, flags->recursive, flags->coloring);

    free(flags);


    return EXIT_SUCCESS;

}