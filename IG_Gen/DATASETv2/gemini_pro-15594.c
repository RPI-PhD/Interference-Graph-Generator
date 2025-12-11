//GEMINI-pro DATASET v1.0 Category: Bingo Simulator ; Style: multivariable
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Define the bingo card size
#define CARD_SIZE 5

// Define the number of bingo cards to generate
#define NUM_CARDS 10

// Define the range of numbers to use for the bingo balls
#define MIN_BALL 1
#define MAX_BALL 75

// Create a struct to represent a bingo card
typedef struct bingo_card {
    int numbers[CARD_SIZE][CARD_SIZE];
    int marked[CARD_SIZE][CARD_SIZE];
} bingo_card;

// Create a function to generate a random bingo card
bingo_card generate_card() {
    bingo_card card;

    // Initialize the card with all zeros
    for (int i = 0; i < CARD_SIZE; i++) {
        for (int j = 0; j < CARD_SIZE; j++) {
            card.numbers[i][j] = 0;
            card.marked[i][j] = 0;
        }
    }

    // Generate a random number for each cell on the card
    for (int i = 0; i < CARD_SIZE; i++) {
        for (int j = 0; j < CARD_SIZE; j++) {
            card.numbers[i][j] = MIN_BALL + rand() % (MAX_BALL - MIN_BALL + 1);
        }
    }

    return card;
}

// Create a function to mark a number on a bingo card
void mark_number(bingo_card *card, int number) {
    for (int i = 0; i < CARD_SIZE; i++) {
        for (int j = 0; j < CARD_SIZE; j++) {
            if (card->numbers[i][j] == number) {
                card->marked[i][j] = 1;
            }
        }
    }
}

// Create a function to check if a bingo card has won
int check_for_win(bingo_card *card) {
    // Check for a horizontal win
    for (int i = 0; i < CARD_SIZE; i++) {
        int count = 0;
        for (int j = 0; j < CARD_SIZE; j++) {
            if (card->marked[i][j] == 1) {
                count++;
            }
        }
        if (count == CARD_SIZE) {
            return 1;
        }
    }

    // Check for a vertical win
    for (int j = 0; j < CARD_SIZE; j++) {
        int count = 0;
        for (int i = 0; i < CARD_SIZE; i++) {
            if (card->marked[i][j] == 1) {
                count++;
            }
        }
        if (count == CARD_SIZE) {
            return 1;
        }
    }

    // Check for a diagonal win
    int count1 = 0;
    for (int i = 0; i < CARD_SIZE; i++) {
        if (card->marked[i][i] == 1) {
            count1++;
        }
    }
    if (count1 == CARD_SIZE) {
        return 1;
    }

    int count2 = 0;
    for (int i = 0; i < CARD_SIZE; i++) {
        if (card->marked[i][CARD_SIZE - 1 - i] == 1) {
            count2++;
        }
    }
    if (count2 == CARD_SIZE) {
        return 1;
    }

    // No win yet
    return 0;
}

// Create a function to play a game of bingo
void play_bingo() {
    // Generate the bingo cards
    bingo_card cards[NUM_CARDS];
    for (int i = 0; i < NUM_CARDS; i++) {
        cards[i] = generate_card();
    }

    // Generate the bingo balls
    int balls[MAX_BALL - MIN_BALL + 1];
    for (int i = 0; i < MAX_BALL - MIN_BALL + 1; i++) {
        balls[i] = MIN_BALL + i;
    }

    // Shuffle the bingo balls
    for (int i = 0; i < MAX_BALL - MIN_BALL + 1; i++) {
        int j = rand() % (MAX_BALL - MIN_BALL + 1);
        int temp = balls[i];
        balls[i] = balls[j];
        balls[j] = temp;
    }

    // Play the game
    int ball_index = 0;
    while (ball_index < MAX_BALL - MIN_BALL + 1) {
        // Get the next bingo ball
        int ball = balls[ball_index];
        ball_index++;

        // Mark the number on each bingo card
        for (int i = 0; i < NUM_CARDS; i++) {
            mark_number(&cards[i], ball);
        }

        // Check if any of the bingo cards have won
        for (int i = 0; i < NUM_CARDS; i++) {
            if (check_for_win(&cards[i])) {
                // Print the winning card
                printf("Card %d has won!\n", i + 1);
                for (int j = 0; j < CARD_SIZE; j++) {
                    for (int k = 0; k < CARD_SIZE; k++) {
                        printf("%d ", cards[i].numbers[j][k]);
                    }
                    printf("\n");
                }

                // Exit the game
                return;
            }
        }
    }

    // No winners
    printf("No winners!\n");
}

// Main function
int main() {
    // Seed the random number generator
    srand(time(NULL));

    // Play the game
    play_bingo();

    return 0;
}