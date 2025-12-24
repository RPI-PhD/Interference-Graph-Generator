//GPT-4o-mini DATASET v1.0 Category: Error handling ; Style: Ken Thompson
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER 256

typedef struct {
    int line_number;
    char error_message[MAX_BUFFER];
} Error;

void log_error(Error *error) {
    fprintf(stderr, "Error at line %d: %s\n", error->line_number, error->error_message);
}

void read_file(const char *filename) {
    FILE *file = fopen(filename, "r");
    Error error_details;

    if (file == NULL) {
        error_details.line_number = __LINE__;
        snprintf(error_details.error_message, sizeof(error_details.error_message), 
                 "Failed to open file: %s", filename);
        log_error(&error_details);
        exit(EXIT_FAILURE);
    }

    char buffer[MAX_BUFFER];
    int line_count = 0;

    while (fgets(buffer, sizeof(buffer), file)) {
        line_count++;
        // Simulate some processing and potential errors
        if (strstr(buffer, "error") != NULL) {
            error_details.line_number = line_count;
            snprintf(error_details.error_message, sizeof(error_details.error_message), 
                     "Found 'error' in line: %s", buffer);
            log_error(&error_details);
        } else if (buffer[0] == '\0') {
            error_details.line_number = line_count;
            snprintf(error_details.error_message, sizeof(error_details.error_message), 
                     "Empty line encountered.");
            log_error(&error_details);
        }
    }

    if (feof(file) == 0) {
        error_details.line_number = __LINE__;
        snprintf(error_details.error_message, sizeof(error_details.error_message), 
                 "End of file not reached properly.");
        log_error(&error_details);
    }

    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        Error error_details;
        error_details.line_number = __LINE__;
        snprintf(error_details.error_message, sizeof(error_details.error_message), 
                 "Usage: %s <filename>", argv[0]);
        log_error(&error_details);
        exit(EXIT_FAILURE);
    }

    read_file(argv[1]);

    printf("Finished processing the file successfully.\n");
    return EXIT_SUCCESS;
}