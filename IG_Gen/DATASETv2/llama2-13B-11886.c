//LLAMA2-13B DATASET v1.0 Category: Word Count Tool ; Style: medieval
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_WORD_COUNT 100
#define MIN_WORD_LENGTH 3

struct kingdom {
    int word_count;
    int longest_word;
    char *words[MAX_WORD_COUNT];
};

void add_word(struct kingdom *kingdom, char *word);
void print_word_count(struct kingdom *kingdom);

int main() {
    struct kingdom kingdom;

    // Initialize the kingdom with some starting words
    add_word(&kingdom, "Hail");
    add_word(&kingdom, "Good");
    add_word(&kingdom, "Sir");
    add_word(&kingdom, "Knight");

    // Loop forever, adding new words and printing the current word count
    while (1) {
        char word[100];
        printf("Enter a word: ");
        fgets(word, 100, stdin);
        add_word(&kingdom, word);
        print_word_count(&kingdom);
    }

    return 0;
}

// Function to add a word to the kingdom
void add_word(struct kingdom *kingdom, char *word) {
    // Check if the word is too short
    if (strlen(word) < MIN_WORD_LENGTH) {
        printf("O thou hast entered a word too short, %s. Thy word shall not be counted.\n", word);
        return;
    }

    // Check if the word already exists in the kingdom
    for (int i = 0; i < kingdom->word_count; i++) {
        if (strcmp(word, kingdom->words[i]) == 0) {
            printf("Lo, thou hast entered a word already in the kingdom, %s. Thy word shall not be counted twice.\n", word);
            return;
        }
    }

    // Add the word to the kingdom and update the longest word
    kingdom->word_count++;
    kingdom->longest_word = strlen(word) > kingdom->longest_word ? strlen(word) : kingdom->longest_word;
    kingdom->words[kingdom->word_count - 1] = word;

    // Print a message to the knave
    printf("Thou hast added the word %s to the kingdom. The current word count is %d. The longest word is %s.\n", word, kingdom->word_count, kingdom->longest_word > 0 ? kingdom->words[0] : "");
}

// Function to print the current word count and longest word
void print_word_count(struct kingdom *kingdom) {
    printf("The current word count is %d. The longest word is %s.\n", kingdom->word_count, kingdom->longest_word > 0 ? kingdom->words[0] : "");
}