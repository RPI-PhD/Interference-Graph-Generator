//Falcon-180B DATASET v1.0 Category: Text Summarizer ; Style: curious
#include <stdio.h>
#include <stdlib.h>

#define MAX_SENTENCE_LENGTH 1000
#define MAX_SENTENCES 1000
#define MIN_SENTENCE_LENGTH 10

typedef struct {
    char *sentence;
    int length;
} Sentence;

int main(int argc, char *argv[]) {
    FILE *input_file;
    char input_buffer[MAX_SENTENCE_LENGTH];
    int sentence_count = 0;
    int sentence_length = 0;
    int i = 0;
    Sentence sentences[MAX_SENTENCES];

    input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        printf("Error: Could not open file.\n");
        exit(1);
    }

    while (fgets(input_buffer, MAX_SENTENCE_LENGTH, input_file)!= NULL) {
        if (strlen(input_buffer) > MIN_SENTENCE_LENGTH) {
            sentences[sentence_count].sentence = (char *) malloc(strlen(input_buffer) + 1);
            strcpy(sentences[sentence_count].sentence, input_buffer);
            sentences[sentence_count].length = strlen(sentences[sentence_count].sentence);
            sentence_count++;
            if (sentence_count == MAX_SENTENCES) {
                break;
            }
        }
        sentence_length += strlen(input_buffer) + 1;
    }

    fclose(input_file);

    printf("Total number of sentences: %d\n", sentence_count);
    printf("Total number of words: %d\n", sentence_length);

    for (i = 0; i < sentence_count; i++) {
        printf("Sentence %d: %s\n", i + 1, sentences[i].sentence);
    }

    for (i = 0; i < sentence_count; i++) {
        free(sentences[i].sentence);
    }

    return 0;
}