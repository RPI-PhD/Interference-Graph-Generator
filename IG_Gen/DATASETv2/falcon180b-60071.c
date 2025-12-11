//Falcon-180B DATASET v1.0 Category: HTML beautifier ; Style: unmistakable
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TOKENS 1000
#define MAX_TOKEN_LENGTH 100

typedef struct {
    char *value;
    int length;
} token_t;

void add_token(token_t *tokens, int *token_count, char *value, int length) {
    if (*token_count >= MAX_TOKENS) {
        printf("Error: Too many tokens\n");
        exit(1);
    }

    tokens[*token_count].value = malloc(length + 1);
    strncpy(tokens[*token_count].value, value, length);
    tokens[*token_count].length = length;

    (*token_count)++;
}

void print_tokens(token_t *tokens, int token_count) {
    for (int i = 0; i < token_count; i++) {
        printf("%s (%d)\n", tokens[i].value, tokens[i].length);
    }
}

int main() {
    FILE *input_file = fopen("input.html", "r");
    if (input_file == NULL) {
        printf("Error: Could not open input file\n");
        exit(1);
    }

    char input_buffer[MAX_TOKEN_LENGTH];
    int input_buffer_length = 0;

    int token_count = 0;
    token_t tokens[MAX_TOKENS];

    while (fgets(input_buffer + input_buffer_length, MAX_TOKEN_LENGTH - input_buffer_length, input_file)!= NULL) {
        input_buffer_length += strlen(input_buffer);

        char *token_start = input_buffer;
        while (token_start < input_buffer + input_buffer_length) {
            if (*token_start == '<') {
                char *tag_start = token_start;
                while (tag_start < input_buffer + input_buffer_length && *tag_start!= '>') {
                    tag_start++;
                }

                if (tag_start < input_buffer + input_buffer_length) {
                    *tag_start = '\0';
                    add_token(tokens, &token_count, tag_start + 1, strlen(tag_start + 1));
                }

                token_start = tag_start + 1;
            } else if (*token_start == '>') {
                char *tag_end = token_start;
                while (tag_end > input_buffer && *(tag_end - 1)!= '<') {
                    tag_end--;
                }

                if (tag_end > input_buffer) {
                    *tag_end = '\0';
                    add_token(tokens, &token_count, tag_end + 1, strlen(tag_end + 1));
                }

                token_start = tag_end + 1;
            } else {
                token_start++;
            }
        }
    }

    fclose(input_file);

    print_tokens(tokens, token_count);

    return 0;
}