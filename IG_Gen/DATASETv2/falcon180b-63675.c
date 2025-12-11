//Falcon-180B DATASET v1.0 Category: Text Summarizer ; Style: active
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_SENTENCE_LENGTH 1000
#define MAX_SENTENCES 1000
#define MIN_SENTENCE_LENGTH 5

struct sentence {
    char text[MAX_SENTENCE_LENGTH];
    int length;
};

int sentence_count = 0;
struct sentence sentences[MAX_SENTENCES];

void add_sentence(char* text) {
    if (sentence_count >= MAX_SENTENCES) {
        printf("Error: maximum sentence limit reached\n");
        return;
    }
    int length = strlen(text);
    if (length < MIN_SENTENCE_LENGTH) {
        printf("Error: sentence too short\n");
        return;
    }
    strcpy(sentences[sentence_count].text, text);
    sentences[sentence_count].length = length;
    sentence_count++;
}

void summarize_text() {
    if (sentence_count == 0) {
        printf("No sentences found in text\n");
        return;
    }
    int total_length = 0;
    for (int i = 0; i < sentence_count; i++) {
        total_length += sentences[i].length;
    }
    int max_summary_length = total_length / 3;
    if (max_summary_length < MIN_SENTENCE_LENGTH) {
        max_summary_length = MIN_SENTENCE_LENGTH;
    }
    char summary[max_summary_length + 1];
    summary[0] = '\0';
    int summary_length = 0;
    for (int i = 0; i < sentence_count; i++) {
        if (summary_length >= max_summary_length) {
            break;
        }
        int j = 0;
        while (j < sentences[i].length && summary_length < max_summary_length) {
            if (isalpha(sentences[i].text[j])) {
                summary[summary_length++] = tolower(sentences[i].text[j]);
            }
            j++;
        }
    }
    printf("Summary:\n%s\n", summary);
}

int main() {
    char input[MAX_SENTENCE_LENGTH];
    while (fgets(input, MAX_SENTENCE_LENGTH, stdin)!= NULL) {
        input[strcspn(input, "\n")] = '\0';
        if (strlen(input) > 0) {
            add_sentence(input);
        }
    }
    summarize_text();
    return 0;
}