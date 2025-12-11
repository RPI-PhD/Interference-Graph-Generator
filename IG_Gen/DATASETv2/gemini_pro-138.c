//GEMINI-pro DATASET v1.0 Category: Huffman Coding Implementation ; Style: interoperable
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node {
    char character;
    int frequency;
    struct node *left, *right;
} node;

node *create_node(char character, int frequency) {
    node *new_node = (node *)malloc(sizeof(node));
    new_node->character = character;
    new_node->frequency = frequency;
    new_node->left = NULL;
    new_node->right = NULL;
    return new_node;
}

void insert_node(node **root, node *new_node) {
    if (*root == NULL) {
        *root = new_node;
        return;
    }
    if (new_node->frequency < (*root)->frequency) {
        insert_node(&(*root)->left, new_node);
    } else {
        insert_node(&(*root)->right, new_node);
    }
}

node *build_tree(char *string) {
    int frequencies[256] = {0};
    for (int i = 0; i < strlen(string); i++) {
        frequencies[string[i]]++;
    }
    node *root = NULL;
    for (int i = 0; i < 256; i++) {
        if (frequencies[i] > 0) {
            node *new_node = create_node(i, frequencies[i]);
            insert_node(&root, new_node);
        }
    }
    return root;
}

void print_code(node *root, char *code) {
    if (root == NULL) {
        return;
    }
    if (root->character != '\0') {
        printf("%c: %s\n", root->character, code);
    }
    print_code(root->left, strcat(code, "0"));
    print_code(root->right, strcat(code, "1"));
}

char *encode(node *root, char *string) {
    int code_length = 0;
    for (int i = 0; i < strlen(string); i++) {
        node *current_node = root;
        while (current_node->character != string[i]) {
            if (string[i] < current_node->character) {
                current_node = current_node->left;
            } else {
                current_node = current_node->right;
            }
        }
        code_length += current_node->frequency;
    }
    char *code = (char *)malloc(code_length + 1);
    code[code_length] = '\0';
    int code_index = 0;
    for (int i = 0; i < strlen(string); i++) {
        node *current_node = root;
        while (current_node->character != string[i]) {
            if (string[i] < current_node->character) {
                current_node = current_node->left;
                code[code_index++] = '0';
            } else {
                current_node = current_node->right;
                code[code_index++] = '1';
            }
        }
    }
    return code;
}

char *decode(node *root, char *code) {
    int code_length = strlen(code);
    char *decoded_string = (char *)malloc(code_length + 1);
    decoded_string[code_length] = '\0';
    int decoded_index = 0;
    node *current_node = root;
    for (int i = 0; i < code_length; i++) {
        if (code[i] == '0') {
            current_node = current_node->left;
        } else {
            current_node = current_node->right;
        }
        if (current_node->character != '\0') {
            decoded_string[decoded_index++] = current_node->character;
            current_node = root;
        }
    }
    return decoded_string;
}

int main() {
    char *string = "this is an example of huffman coding";
    node *root = build_tree(string);
    char *code = "";
    print_code(root, code);
    char *encoded_string = encode(root, string);
    char *decoded_string = decode(root, encoded_string);
    printf("Original string: %s\n", string);
    printf("Encoded string: %s\n", encoded_string);
    printf("Decoded string: %s\n", decoded_string);
    return 0;
}