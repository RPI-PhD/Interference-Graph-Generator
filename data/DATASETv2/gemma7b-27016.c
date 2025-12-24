//Gemma-7B DATASET v1.0 Category: Procedurally Generated Maze ; Style: enthusiastic
#include <stdio.h>
#include <stdlib.h>

#define MAZE_SIZE 10

typedef struct Node {
    int x, y;
    struct Node* next;
} Node;

void createMaze(Node** head) {
    int i, j, r, c;
    *head = NULL;

    for (r = 0; r < MAZE_SIZE; r++) {
        for (c = 0; c < MAZE_SIZE; c++) {
            Node* newNode = malloc(sizeof(Node));
            newNode->x = r;
            newNode->y = c;
            newNode->next = NULL;

            if (*head == NULL) {
                *head = newNode;
            } else {
                (*head)->next = newNode;
                *head = newNode;
            }
        }
    }
}

void printMaze(Node* head) {
    int i, j;
    for (i = 0; i < MAZE_SIZE; i++) {
        for (j = 0; j < MAZE_SIZE; j++) {
            Node* current = head;
            while (current) {
                if (current->x == i && current->y == j) {
                    printf("O ");
                } else {
                    printf(". ");
                }
            }
        }
        printf("\n");
    }
}

int main() {
    Node* head = NULL;
    createMaze(&head);
    printMaze(head);

    return 0;
}