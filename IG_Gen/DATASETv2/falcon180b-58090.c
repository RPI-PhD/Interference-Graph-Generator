//Falcon-180B DATASET v1.0 Category: Log analysis ; Style: thoughtful
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_TOKENS 1000
#define MAX_TOKEN_LEN 100

typedef struct {
    char *name;
    int count;
} Token;

void add_token(Token *tokens, int num_tokens, char *name) {
    for (int i = 0; i < num_tokens; i++) {
        if (strcmp(tokens[i].name, name) == 0) {
            tokens[i].count++;
            return;
        }
    }
    Token new_token;
    strcpy(new_token.name, name);
    new_token.count = 1;
    tokens[num_tokens++] = new_token;
}

void print_tokens(Token *tokens, int num_tokens) {
    for (int i = 0; i < num_tokens; i++) {
        printf("%s: %d\n", tokens[i].name, tokens[i].count);
    }
}

int main() {
    FILE *file;
    char line[MAX_TOKEN_LEN];
    char token[MAX_TOKEN_LEN];
    Token tokens[MAX_TOKENS];
    int num_tokens = 0;

    file = fopen("logfile.txt", "r");

    if (file == NULL) {
        printf("Error opening file\n");
        exit(1);
    }

    while (fgets(line, MAX_TOKEN_LEN, file)!= NULL) {
        int len = strlen(line);
        char *ptr = line;
        while (len > 0) {
            char c = tolower(*ptr);
            if (isalpha(c)) {
                strncpy(token, ptr, MAX_TOKEN_LEN);
                token[strcspn(token, " \t\n\r")] = '\0';
                add_token(tokens, num_tokens, token);
            }
            ptr++;
            len--;
        }
    }

    fclose(file);

    print_tokens(tokens, num_tokens);

    return 0;
}