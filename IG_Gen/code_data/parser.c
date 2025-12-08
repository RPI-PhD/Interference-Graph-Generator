#include "myshell_parser.h"
#include <stddef.h>
#include <stdlib.h>

bool token_creator(struct token_list *tl, const char *input, int current_token_size, int current_tl_size)
{
    tl->tokens = realloc(tl->tokens, current_tl_size * sizeof(char*));
    tl->types = realloc(tl->types, current_tl_size * sizeof(int));
    tl->tokens[current_tl_size - 1] = malloc(current_token_size + 1);
    int ii;
    for (ii = 0; ii < current_token_size; ii++)
    {
        tl->tokens[current_tl_size - 1][ii] = input[ii];
    }
    tl->tokens[current_tl_size - 1][current_token_size] = '\0';
    int value;
    if (input[1] == '\0')
    {
        switch (input[0])
        {
            case '<':
                value = 1;
                break;
            case '>':
                value = 2;
                break;
            case '&':
                value = 3;
                break;
            case '|':
                value = 4;
                break;
            case '\n':
                value = 5;
                break;
	        default:
	            value = 0;
	            break;
        }
    }
    else
    {
        value = 0;
    }
    tl->types[current_tl_size - 1] = value;
    return true;
}

struct token_list *lexer(const char *command_line)
{
    const char *next_char, *prev_char;
    prev_char = NULL;
    next_char = command_line;

    char *current_token = NULL;
    int current_tl_size, current_token_size;
    current_tl_size = 0;
    current_token_size = 1;

    struct token_list *tl = NULL;
    tl = malloc(sizeof(*tl));
    tl->tokens = malloc(current_tl_size * sizeof(char*));
    tl->types = malloc(current_tl_size * sizeof(int));
    while (*next_char != '\0')
    {
        switch (*next_char)
        {
            case '>':
            case '<':
            case '&':
            case '|':
            case '\n':
                if (prev_char != NULL)
                {
                    switch (*prev_char)
                    {
                        case '\t':
                        case ' ':
                            break;
                        default:
                            current_tl_size++;
                            token_creator(tl, current_token, current_token_size, current_tl_size);
                            free(current_token);
                            current_token = NULL;
                            current_token_size = 1;
                            break;
                    }
                }
                current_token = malloc(current_token_size + 1);
                current_token[0] = *next_char;
                current_token[1] = '\0';
                break;
            case ' ':
            case '\t':
                if (current_token != NULL)
                {
                    current_tl_size++;
                    token_creator(tl, current_token, current_token_size, current_tl_size);
                    free(current_token);
                    current_token = NULL;
                    current_token_size = 1;
                }
                break;
            default:
                if (prev_char != NULL)
                {
                    switch (*prev_char)
                    {
                        case '\n':
                        case '|':
                        case '>':
                        case '<':
                        case '&':
                            current_tl_size++;
                            token_creator(tl, current_token, current_token_size, current_tl_size);
                            free(current_token);
                            current_token = NULL;
                            current_token_size = 1;
                            break;
                        default:
                            break;
                    }
                }
                if (current_token == NULL)
                {
                    current_token = malloc(current_token_size + 1);
                    current_token[0] = *next_char;
                    current_token[1] = '\0';
                }
                else
                {
                    current_token = realloc(current_token, current_token_size + 1);
                    current_token[current_token_size - 1] = *next_char;
                    current_token[current_token_size] = '\0';
                }
                current_token_size++;
                break;
        }
        prev_char = next_char;
        next_char++;
    }
    tl->count = current_tl_size;
    free(current_token);
    return tl;
}

void token_list_free(struct token_list *tl)
{
    free(tl->types);
    for (int ii = 0; ii < tl->count; ii++)
    {
        free(tl->tokens[ii]);
    }
    free(tl->tokens);
    free(tl);
}

struct pipeline *pipeline_build(const char *command_line)
{
    // TODO: Implement this function
    struct token_list *tl = lexer(command_line);
    struct pipeline *pipe = NULL;

    int command_arg_index = 0;

    pipe = malloc(sizeof(*pipe));
    pipe->is_background = false;
    pipe->commands = NULL;

    struct pipeline_command *current_command = NULL;
    struct pipeline_command *prev_command = NULL;
    current_command = malloc(sizeof(*current_command));
    current_command->command_args[0] = NULL;
    current_command->redirect_in_path = NULL;
    current_command->redirect_out_path = NULL;
    current_command->next = NULL;

    for (int ii = 0; ii < tl->count; ii++)
    {
        if ((ii == 0) && (tl->types[0] != 0) && (tl->types[0] != 3))
        {
            // syntax error (operator as first token)
            token_list_free(tl);
            pipeline_free(pipe);
            return NULL;
        }
        else
        {
            switch (tl->types[ii])
            {
                case 0:
                    current_command->command_args[command_arg_index] = tl->tokens[ii];
                    current_command->command_args[++command_arg_index] = NULL;
                    break;
                case 3:
                    pipe->is_background = true;
                    free(tl->tokens[ii]);
                    break;
                case 1:
                    if ((pipe->commands == NULL) && (tl->types[ii + 1] == 0) && ((ii == tl->count - 2) || ((tl->types[ii + 2] != 0))))
                    {
                        // GOOD
                        current_command->redirect_in_path = tl->tokens[ii + 1];
                        free(tl->tokens[ii]);
                        ii++;
                    }
                    else
                    {
                        // syntax error
                        token_list_free(tl);
                        pipeline_free(pipe);
                        return NULL;
                    }
                    break;
                case 2:
                    if (((ii == tl->count - 2) || ((ii == tl->count - 3) && (tl->types[ii + 2] == 3))) && (tl->types[ii + 1] == 0))
                    {
                        // GOOD
                        free(tl->tokens[ii]);
                        current_command->redirect_out_path = tl->tokens[ii + 1];
                        if (prev_command == NULL)
                        {
                            pipe->commands = current_command;
                        }
                        else
                        {
                            prev_command->next = current_command;
                        }
                        prev_command = current_command;
                        command_arg_index = 0;
                        current_command = malloc(sizeof(*current_command));
                        current_command->command_args[0] = NULL;
                        current_command->redirect_in_path = NULL;
                        current_command->redirect_out_path = NULL;
                        current_command->next = NULL;
                        if (ii + 2 < tl->count && tl->types[ii + 2] == 3)
                        {
                            pipe->is_background = true;
                            free(tl->tokens[ii + 2]);
                            ii+=2;
                        }
                        ii++;
                    }
                    else
                    {
                        // syntax error
                        token_list_free(tl);
                        pipeline_free(pipe);
                        return NULL;
                    }
                    break;
                case 4:
                    if ((ii != tl->count - 1) && (tl->types[ii - 1] == 0) && (tl->types[ii + 1] == 0))
                    {
                        // GOOD
                        free(tl->tokens[ii]);
                        if (prev_command == NULL)
                        {
                            pipe->commands = current_command;
                        }
                        else
                        {
                            prev_command->next = current_command;
                        }
                        prev_command = current_command;
                        command_arg_index = 0;
                        current_command = malloc(sizeof(*current_command));
                        current_command->command_args[0] = NULL;
                        current_command->redirect_in_path = NULL;
                        current_command->redirect_out_path = NULL;
                        current_command->next = NULL;
                    }
                    else
                    {
                        // syntax error
                        token_list_free(tl);
                        pipeline_free(pipe);
                        return NULL;
                    }
                    break;
                default:
                    // somehow you've managed to create a token that doesn't have one of the defined types
                    // now go away
                    token_list_free(tl);
                    pipeline_free(pipe);
                    return NULL;
            }
        }
    }
    if (current_command->command_args[0] != NULL)
    {
        if (prev_command == NULL)
        {
            pipe->commands = current_command;
        }
        else
        {
            prev_command->next = current_command;
        }
    }
    else
    {
        free(current_command);
    }
    free(tl->types);
    free(tl->tokens);
    free(tl);
    return pipe;
}

void pipeline_free(struct pipeline *pipeline)
{
    // TODO: Implement this function
    while (pipeline->commands != NULL)
    {
        int ii = 0;
        while (pipeline->commands->command_args[ii] != NULL)
        {
            free(pipeline->commands->command_args[ii]);
            ii++;
        }
        if (pipeline->commands->redirect_out_path != NULL)
        {
            free(pipeline->commands->redirect_out_path);
        }
        if (pipeline->commands->redirect_in_path != NULL)
        {
            free(pipeline->commands->redirect_in_path);
        }
        struct pipeline_command* dummy = pipeline->commands;
        pipeline->commands = pipeline->commands->next;
        free(dummy);
    }
    free(pipeline);
}