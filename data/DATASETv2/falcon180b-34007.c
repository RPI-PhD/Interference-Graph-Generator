//Falcon-180B DATASET v1.0 Category: Educational ; Style: expert-level
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_WORDS 1000
#define MAX_WORD_LENGTH 50

typedef struct {
    char word[MAX_WORD_LENGTH];
    int count;
} WordFrequency;

int compareStrings(const void *a, const void *b) {
    return strcmp(*(char **)a, *(char **)b);
}

int main() {
    FILE *file;
    char line[1024];
    char *word;
    WordFrequency frequencies[MAX_WORDS] = {{0}};
    int numWords = 0;

    // Open file for reading
    file = fopen("example.txt", "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }

    // Read file line by line
    while (fgets(line, sizeof(line), file)!= NULL) {
        // Convert line to lowercase
        for (int i = 0; line[i]!= '\0'; i++) {
            line[i] = tolower(line[i]);
        }

        // Tokenize line into words
        word = strtok(line, ",.?!;:");
        while (word!= NULL) {
            // Check if word is already in array
            int index = 0;
            while (index < numWords && strcmp(frequencies[index].word, word)!= 0) {
                index++;
            }

            // If word is not in array, add it
            if (index == numWords) {
                strcpy(frequencies[numWords].word, word);
                frequencies[numWords].count = 1;
                numWords++;
            } else {
                frequencies[index].count++;
            }

            // Get next word
            word = strtok(NULL, ",.?!;:");
        }
    }

    // Close file
    fclose(file);

    // Sort array by word frequency
    qsort(frequencies, numWords, sizeof(WordFrequency), compareStrings);

    // Print results
    for (int i = 0; i < numWords; i++) {
        printf("%s: %d\n", frequencies[i].word, frequencies[i].count);
    }

    return 0;
}