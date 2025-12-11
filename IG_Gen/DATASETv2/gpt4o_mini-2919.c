//GPT-4o-mini DATASET v1.0 Category: Log analysis ; Style: happy
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Function to log messages to a file
void logMessage(const char *filename, const char *message) {
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        perror("Failed to open log file");
        return;
    }
    time_t now;
    time(&now);
    fprintf(file, "[%s] %s\n", ctime(&now), message);
    fclose(file);
}

// Function to analyze log file contents
void analyzeLogs(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Failed to open log file");
        return;
    }

    char line[256];
    int totalMessages = 0;
    int happyMessages = 0;

    printf("Analyzing log file: %s\n", filename);
    while (fgets(line, sizeof(line), file)) {
        totalMessages++;
        if (strstr(line, "happy")) {
            happyMessages++;
            printf("Found a happy message! : %s", line);
        }
    }

    fclose(file);
    printf("\nTotal messages: %d\n", totalMessages);
    printf("Happy messages: %d\n", happyMessages);
    printf("Percentage of happy messages: %.2f%%\n",
           (totalMessages > 0) ? (happyMessages / (float)totalMessages) * 100 : 0.0);
}

// Function to generate some happy log messages
void generateHappyLogs(const char *filename, int numberOfMessages) {
    const char *messages[] = {
        "Life is beautiful! Let's spread happiness!",
        "Every day is a new opportunity! Be happy!",
        "Smiles are contagious, pass it on!",
        "You are amazing, keep shining!",
        "Happiness is a choice, choose it every day!",
        "Joy is the simplest form of gratitude!",
        "Think positive, be positive!",
        "Create your own sunshine!",
        "Make today so awesome that yesterday gets jealous!",
        "Happiness is not by chance, but by choice!"
    };

    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        perror("Failed to open log file");
        return;
    }

    for (int i = 0; i < numberOfMessages; i++) {
        const char *message = messages[i % (sizeof(messages) / sizeof(messages[0]))];
        logMessage(filename, message);
    }

    fclose(file);
}

int main() {
    const char *logFilename = "happy_log.txt";

    // Generate happy log messages
    printf("Generating happy log messages...\n");
    generateHappyLogs(logFilename, 20);
    
    // Analyze the logs
    printf("\nNow let's analyze the logs!\n");
    analyzeLogs(logFilename);

    return 0;
}