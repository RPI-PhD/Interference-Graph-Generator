//Falcon-180B DATASET v1.0 Category: Memory Game ; Style: portable
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_ROWS 10
#define MAX_COLS 10
#define NUM_PAIRS 5
#define NUM_ATTEMPTS 3

struct {
    int row;
    int col;
    char symbol;
} card[NUM_PAIRS];

void init_cards() {
    int i;
    for (i = 0; i < NUM_PAIRS; i++) {
        card[i].row = rand() % MAX_ROWS;
        card[i].col = rand() % MAX_COLS;
        card[i].symbol = 'A' + i;
    }
}

void print_board() {
    int i, j;
    for (i = 0; i < MAX_ROWS; i++) {
        for (j = 0; j < MAX_COLS; j++) {
            if (i == card[0].row && j == card[0].col) {
                printf(" %c ", card[0].symbol);
            } else if (i == card[1].row && j == card[1].col) {
                printf(" %c ", card[1].symbol);
            } else if (i == card[2].row && j == card[2].col) {
                printf(" %c ", card[2].symbol);
            } else if (i == card[3].row && j == card[3].col) {
                printf(" %c ", card[3].symbol);
            } else if (i == card[4].row && j == card[4].col) {
                printf(" %c ", card[4].symbol);
            } else {
                printf(" - ");
            }
        }
        printf("\n");
    }
}

int main() {
    srand(time(0));
    init_cards();
    int i, j, k, attempts, matches = 0;
    for (k = 0; k < NUM_ATTEMPTS; k++) {
        attempts = 0;
        printf("Attempt %d:\n", k + 1);
        print_board();
        while (attempts < NUM_ATTEMPTS) {
            printf("Enter row and column: ");
            scanf("%d%d", &i, &j);
            if (i < MAX_ROWS && j < MAX_COLS) {
                if (i == card[0].row && j == card[0].col) {
                    printf("Correct!\n");
                    matches++;
                } else if (i == card[1].row && j == card[1].col) {
                    printf("Correct!\n");
                    matches++;
                } else if (i == card[2].row && j == card[2].col) {
                    printf("Correct!\n");
                    matches++;
                } else if (i == card[3].row && j == card[3].col) {
                    printf("Correct!\n");
                    matches++;
                } else if (i == card[4].row && j == card[4].col) {
                    printf("Correct!\n");
                    matches++;
                } else {
                    printf("Incorrect.\n");
                }
                attempts++;
            } else {
                printf("Invalid input.\n");
            }
        }
        if (matches == NUM_PAIRS) {
            printf("Congratulations! You won in %d attempts.\n", k + 1);
            break;
        } else {
            printf("Try again.\n");
        }
    }
    return 0;
}