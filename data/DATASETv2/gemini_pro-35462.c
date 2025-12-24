//GEMINI-pro DATASET v1.0 Category: Bingo Simulator ; Style: excited
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Constants
#define MAX_NUMBERS 90
#define MAX_CARDS 100
#define MAX_ROWS 3
#define MAX_COLS 5

// Data structures
typedef struct {
    int numbers[MAX_NUMBERS];
    int marked[MAX_NUMBERS];
} BingoCard;

typedef struct {
    BingoCard cards[MAX_CARDS];
    int num_cards;
} BingoGame;

// Function prototypes
void print_card(BingoCard *card);
void print_game(BingoGame *game);
void mark_number(BingoCard *card, int number);
int check_card(BingoCard *card);
int check_game(BingoGame *game);

// Main function
int main() {
    // Initialize the random number generator
    srand(time(NULL));

    // Create a new bingo game
    BingoGame game;
    game.num_cards = 0;

    // Generate 100 random bingo cards
    for (int i = 0; i < 100; i++) {
        // Generate a new bingo card
        BingoCard card;

        // Fill the card with random numbers
        for (int j = 0; j < MAX_NUMBERS; j++) {
            card.numbers[j] = rand() % MAX_NUMBERS + 1;
        }

        // Mark all numbers as unmarked
        for (int j = 0; j < MAX_NUMBERS; j++) {
            card.marked[j] = 0;
        }

        // Add the card to the game
        game.cards[game.num_cards] = card;
        game.num_cards++;
    }

    // Print the bingo game
    print_game(&game);

    // Draw numbers until someone wins
    int winning_card = -1;
    while (winning_card == -1) {
        // Draw a random number
        int number = rand() % MAX_NUMBERS + 1;

        // Mark the number on all cards
        for (int i = 0; i < game.num_cards; i++) {
            mark_number(&game.cards[i], number);
        }

        // Check if any cards have won
        for (int i = 0; i < game.num_cards; i++) {
            if (check_card(&game.cards[i])) {
                winning_card = i;
                break;
            }
        }

        // Print the bingo game
        print_game(&game);
    }

    // Print the winning card
    printf("Winning card:\n");
    print_card(&game.cards[winning_card]);

    return 0;
}

// Function to print a bingo card
void print_card(BingoCard *card) {
    for (int i = 0; i < MAX_ROWS; i++) {
        for (int j = 0; j < MAX_COLS; j++) {
            printf("%2d ", card->numbers[i * MAX_COLS + j]);
        }
        printf("\n");
    }
}

// Function to print a bingo game
void print_game(BingoGame *game) {
    for (int i = 0; i < game->num_cards; i++) {
        printf("Card %d:\n", i + 1);
        print_card(&game->cards[i]);
        printf("\n");
    }
}

// Function to mark a number on a bingo card
void mark_number(BingoCard *card, int number) {
    for (int i = 0; i < MAX_NUMBERS; i++) {
        if (card->numbers[i] == number) {
            card->marked[i] = 1;
            break;
        }
    }
}

// Function to check if a bingo card has won
int check_card(BingoCard *card) {
    // Check rows
    for (int i = 0; i < MAX_ROWS; i++) {
        int count = 0;
        for (int j = 0; j < MAX_COLS; j++) {
            if (card->marked[i * MAX_COLS + j]) {
                count++;
            }
        }
        if (count == MAX_COLS) {
            return 1;
        }
    }

    // Check columns
    for (int i = 0; i < MAX_COLS; i++) {
        int count = 0;
        for (int j = 0; j < MAX_ROWS; j++) {
            if (card->marked[j * MAX_COLS + i]) {
                count++;
            }
        }
        if (count == MAX_ROWS) {
            return 1;
        }
    }

    // Check diagonals
    int count1 = 0;
    int count2 = 0;
    for (int i = 0; i < MAX_ROWS; i++) {
        if (card->marked[i * MAX_COLS + i]) {
            count1++;
        }
        if (card->marked[i * MAX_COLS + (MAX_COLS - 1 - i)]) {
            count2++;
        }
    }
    if (count1 == MAX_ROWS || count2 == MAX_ROWS) {
        return 1;
    }

    return 0;
}

// Function to check if a bingo game has been won
int check_game(BingoGame *game) {
    for (int i = 0; i < game->num_cards; i++) {
        if (check_card(&game->cards[i])) {
            return 1;
        }
    }

    return 0;
}