//GEMINI-pro DATASET v1.0 Category: Chess engine ; Style: lively
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BOARD_SIZE 8

typedef struct {
    int x;
    int y;
} Position;

typedef struct {
    char type;
    char color;
    Position position;
} Piece;

Piece board[BOARD_SIZE][BOARD_SIZE];

void printBoard() {
    for (int i = 0; i < BOARD_SIZE; i++) {
        for (int j = 0; j < BOARD_SIZE; j++) {
            printf("%c ", board[i][j].type);
        }
        printf("\n");
    }
}

int main() {
    // Initialize the board
    for (int i = 0; i < BOARD_SIZE; i++) {
        for (int j = 0; j < BOARD_SIZE; j++) {
            board[i][j].type = ' ';
            board[i][j].color = ' ';
            board[i][j].position.x = i;
            board[i][j].position.y = j;
        }
    }

    // Place the pieces on the board
    board[0][0].type = '♜';
    board[0][1].type = '♞';
    board[0][2].type = '♝';
    board[0][3].type = '♛';
    board[0][4].type = '♚';
    board[0][5].type = '♝';
    board[0][6].type = '♞';
    board[0][7].type = '♜';
    for (int i = 0; i < BOARD_SIZE; i++) {
        board[1][i].type = '♟';
    }
    for (int i = 0; i < BOARD_SIZE; i++) {
        board[6][i].type = '♙';
    }
    board[7][0].type = '♖';
    board[7][1].type = '♘';
    board[7][2].type = '♗';
    board[7][3].type = '♕';
    board[7][4].type = '♔';
    board[7][5].type = '♗';
    board[7][6].type = '♘';
    board[7][7].type = '♖';

    // Print the board
    printBoard();

    return 0;
}