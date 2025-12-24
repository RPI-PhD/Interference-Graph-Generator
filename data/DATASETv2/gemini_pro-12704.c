//GEMINI-pro DATASET v1.0 Category: Game ; Style: happy
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int x;
    int y;
} Point;

typedef struct {
    Point start;
    Point end;
} Line;

int main() {
    // Initialize the game board
    char board[10][10] = {
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}
    };

    // Initialize the player positions
    Point player1 = {0, 0};
    Point player2 = {9, 9};

    // Initialize the game state
    int game_state = 0; // 0 = player 1's turn, 1 = player 2's turn, 2 = draw, 3 = player 1 wins, 4 = player 2 wins

    // Game loop
    while (game_state == 0 || game_state == 1) {
        // Display the game board
        printf("\n");
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                printf("%c ", board[i][j]);
            }
            printf("\n");
        }

        // Get player 1's move
        printf("Player 1, enter your move (x, y): ");
        scanf("%d %d", &player1.x, &player1.y);

        // Check if player 1's move is valid
        if (player1.x < 0 || player1.x > 9 || player1.y < 0 || player1.y > 9 || board[player1.x][player1.y] != ' ') {
            printf("Invalid move!\n");
            continue;
        }

        // Place player 1's marker on the board
        board[player1.x][player1.y] = 'X';

        // Check if player 1 has won
        if (check_win(board, player1.x, player1.y)) {
            game_state = 3;
            break;
        }

        // Get player 2's move
        printf("Player 2, enter your move (x, y): ");
        scanf("%d %d", &player2.x, &player2.y);

        // Check if player 2's move is valid
        if (player2.x < 0 || player2.x > 9 || player2.y < 0 || player2.y > 9 || board[player2.x][player2.y] != ' ') {
            printf("Invalid move!\n");
            continue;
        }

        // Place player 2's marker on the board
        board[player2.x][player2.y] = 'O';

        // Check if player 2 has won
        if (check_win(board, player2.x, player2.y)) {
            game_state = 4;
            break;
        }

        // Check if the game is a draw
        if (check_draw(board)) {
            game_state = 2;
            break;
        }
    }

    // Display the final game board
    printf("\n");
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            printf("%c ", board[i][j]);
        }
        printf("\n");
    }

    // Display the winner
    switch (game_state) {
        case 2:
            printf("Draw!\n");
            break;
        case 3:
            printf("Player 1 wins!\n");
            break;
        case 4:
            printf("Player 2 wins!\n");
            break;
    }

    return 0;
}

int check_win(char board[10][10], int x, int y) {
    // Check if there are 5 markers in a row, column, or diagonal
    int count_row = 1;
    int count_column = 1;
    int count_diagonal1 = 1;
    int count_diagonal2 = 1;

    // Check the row
    for (int i = 1; i < 5; i++) {
        if (board[x][y - i] == board[x][y] && board[x][y - i] != ' ') {
            count_row++;
        }
        if (board[x][y + i] == board[x][y] && board[x][y + i] != ' ') {
            count_row++;
        }
    }

    // Check the column
    for (int i = 1; i < 5; i++) {
        if (board[x - i][y] == board[x][y] && board[x - i][y] != ' ') {
            count_column++;
        }
        if (board[x + i][y] == board[x][y] && board[x + i][y] != ' ') {
            count_column++;
        }
    }

    // Check the diagonal from top left to bottom right
    for (int i = 1; i < 5; i++) {
        if (board[x - i][y - i] == board[x][y] && board[x - i][y - i] != ' ') {
            count_diagonal1++;
        }
        if (board[x + i][y + i] == board[x][y] && board[x + i][y + i] != ' ') {
            count_diagonal1++;
        }
    }

    // Check the diagonal from top right to bottom left
    for (int i = 1; i < 5; i++) {
        if (board[x - i][y + i] == board[x][y] && board[x - i][y + i] != ' ') {
            count_diagonal2++;
        }
        if (board[x + i][y - i] == board[x][y] && board[x + i][y - i] != ' ') {
            count_diagonal2++;
        }
    }

    // Return true if there are 5 markers in a row, column, or diagonal
    return count_row >= 5 || count_column >= 5 || count_diagonal1 >= 5 || count_diagonal2 >= 5;
}

int check_draw(char board[10][10]) {
    // Check if there are any empty spaces on the board
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            if (board[i][j] == ' ') {
                return 0;
            }
        }
    }

    // Return true if there are no empty spaces on the board
    return 1;
}