//GPT-4o-mini DATASET v1.0 Category: Spam Detection System ; Style: complex
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_MESSAGES 100
#define MAX_LENGTH 256

typedef struct {
    char messages[MAX_MESSAGES][MAX_LENGTH];
    int count;
} SpamDatabase;

SpamDatabase spamDb;

// Function to initialize the spam database with common spam patterns
void initializeSpamDatabase() {
    strcpy(spamDb.messages[0], "free money");
    strcpy(spamDb.messages[1], "win a lottery");
    strcpy(spamDb.messages[2], "click this link");
    strcpy(spamDb.messages[3], "urgent response needed");
    strcpy(spamDb.messages[4], "you have won");
    spamDb.count = 5;
}

// Function to check for spam in a given message
bool isSpam(const char *message) {
    for (int i = 0; i < spamDb.count; i++) {
        if (strstr(message, spamDb.messages[i]) != NULL) {
            return true; // Found a spam pattern
        }
    }
    return false; // No spam found
}

// Function to log non-spam messages into a file
void logMessage(const char *message) {
    FILE *file = fopen("non_spam_messages.log", "a");
    if (file != NULL) {
        fprintf(file, "%s\n", message);
        fclose(file);
    } else {
        perror("Failed to open log file");
    }
}

// Function to process user input messages
void processMessages() {
    char inputMessage[MAX_LENGTH];
    printf("Enter your messages (Type 'EXIT' to quit):\n");

    while (true) {
        printf("> ");
        fgets(inputMessage, sizeof(inputMessage), stdin);
        inputMessage[strcspn(inputMessage, "\n")] = 0; // Remove newline

        if (strcmp(inputMessage, "EXIT") == 0) {
            break; // Exit on user command
        }

        if (isSpam(inputMessage)) {
            printf("Spam detected: \"%s\"\n", inputMessage);
        } else {
            printf("Non-spam message: \"%s\"\n", inputMessage);
            logMessage(inputMessage);
        }
    }
}

// Main function to execute the spam detection system
int main() {
    printf("Welcome to the Spam Detection System!\n");

    // Initialize spam patterns in the database
    initializeSpamDatabase();

    // Keep processing messages from the user
    processMessages();

    printf("Exiting the Spam Detection System. Goodbye!\n");
    return EXIT_SUCCESS;
}