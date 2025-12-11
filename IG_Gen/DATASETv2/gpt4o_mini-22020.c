//GPT-4o-mini DATASET v1.0 Category: Log analysis ; Style: configurable
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_LINE_LENGTH 256
#define MAX_LOG_ENTRIES 1000

typedef struct {
    char timestamp[20];
    char severity[10];
    char message[MAX_LINE_LENGTH];
} LogEntry;

LogEntry logEntries[MAX_LOG_ENTRIES];
int logEntryCount = 0;

// Function to parse a single log line
bool parseLogLine(char* line, LogEntry* entry) {
    char* token = strtok(line, " ");
    if (token != NULL) {
        strncpy(entry->timestamp, token, sizeof(entry->timestamp));
    } else {
        return false;
    }

    token = strtok(NULL, " ");
    if (token != NULL) {
        strncpy(entry->severity, token, sizeof(entry->severity));
    } else {
        return false;
    }

    token = strtok(NULL, "\n");
    if (token != NULL) {
        strncpy(entry->message, token, sizeof(entry->message));
    } else {
        return false;
    }
    return true;
}

// Function to read log file and store entries
void readLogFile(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        perror("Unable to open log file");
        exit(EXIT_FAILURE);
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), file) != NULL) {
        LogEntry entry;
        if (parseLogLine(line, &entry)) {
            logEntries[logEntryCount++] = entry;
            if (logEntryCount >= MAX_LOG_ENTRIES) {
                printf("Error: Maximum log entries reached\n");
                break;
            }
        } else {
            printf("Error parsing line: %s", line);
        }
    }
    fclose(file);
}

// Function to filter logs by severity
void filterLogBySeverity(const char* severity) {
    printf("\nFiltered Logs by Severity [%s]:\n", severity);
    for (int i = 0; i < logEntryCount; i++) {
        if (strcmp(logEntries[i].severity, severity) == 0) {
            printf("%s - %s: %s\n", logEntries[i].timestamp, logEntries[i].severity, logEntries[i].message);
        }
    }
}

// Function to display all logs
void displayAllLogs() {
    printf("\nAll Logs:\n");
    for (int i = 0; i < logEntryCount; i++) {
        printf("%s - %s: %s\n", logEntries[i].timestamp, logEntries[i].severity, logEntries[i].message);
    }
}

// Function to customize log analysis options
void logAnalyzer() {
    int choice;
    char severity[10];
    do {
        printf("\nLog Analyzer Menu:\n");
        printf("1. Display All Logs\n");
        printf("2. Filter Logs by Severity\n");
        printf("3. Exit\n");
        printf("Choose an option: ");
        scanf("%d", &choice);
        getchar(); // to consume newline character

        switch (choice) {
            case 1:
                displayAllLogs();
                break;
            case 2:
                printf("Enter severity (ERROR, WARN, INFO): ");
                fgets(severity, sizeof(severity), stdin);
                strtok(severity, "\n"); // remove newline
                filterLogBySeverity(severity);
                break;
            case 3:
                printf("Exiting Log Analyzer.\n");
                break;
            default:
                printf("Invalid option. Try again!\n");
        }
    } while (choice != 3);
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <logfile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    readLogFile(argv[1]);
    logAnalyzer();

    return EXIT_SUCCESS;
}