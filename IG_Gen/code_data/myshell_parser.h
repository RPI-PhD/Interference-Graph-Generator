#ifndef MYSHELL_PARSER_H
#define MYSHELL_PARSER_H
#include <stdbool.h>
#include <stdlib.h>

#define MAX_LINE_LENGTH 512
#define MAX_ARGV_LENGTH (MAX_LINE_LENGTH / 2 + 1)

struct pipeline_command {
    char *command_args[MAX_ARGV_LENGTH]; // arg[0] is command, rest are arguments
    char *redirect_in_path;  // NULL or Name of file to redirect in from
    char *redirect_out_path; // NULL or Name of a file to redirect out to
    struct pipeline_command *next; // next command in the pipeline. NULL if done
};

struct pipeline {
    struct pipeline_command *commands; // first command
    bool is_background; // TRUE if should execute in background
};

struct token_list {
    char** tokens; // actual list of the token text inputs
    int* types; // list of the type of tokens index equal to the token text it corresponds to
    // types: 0 - word, 1 - <, 2 - >, 3 - &, 4 - |, 5 - \n
    int count;
};

bool token_creator(struct token_list *tl, const char *input, int current_token_size, int current_tl_size);

void token_list_free(struct token_list *tl);

struct token_list *lexer(const char *command_line);

void pipeline_free(struct pipeline *pipeline);

struct pipeline *pipeline_build(const char *command_line);

#endif /* MYSHELL_PARSER_H */