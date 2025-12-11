//GPT-4o-mini DATASET v1.0 Category: User Input Sanitizer ; Style: shape shifting
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Define maximum buffer sizes
#define MAX_INPUT_SIZE 256
#define MAX_OUTPUT_SIZE 128

// Function to sanitize input
void sanitize_input(const char *input, char *output) {
    int i, j = 0;
    char temp[MAX_INPUT_SIZE];

    // Filter out non-alphanumeric and whitespace characters
    for (i = 0; input[i] != '\0' && j < MAX_OUTPUT_SIZE - 1; i++) {
        if (isalnum(input[i]) || isspace(input[i])) {
            temp[j++] = input[i];
        }
    }

    temp[j] = '\0'; // Null-terminate the temporary string

    // Only allow characters if they don't exceed the output limit
    strncpy(output, temp, MAX_OUTPUT_SIZE - 1);
    output[MAX_OUTPUT_SIZE - 1] = '\0'; // Ensure null-termination
}

// Function to mimic a shape-shifting creature's behavior (simple random behavior)
void creature_shape_shift(int iteration) {
    const char *shapes[] = { "Circle", "Square", "Triangle", "Hexagon", "Pentagon" };
    int num_shapes = sizeof(shapes) / sizeof(shapes[0]);

    printf("The creature shifts shape %d times... \n", iteration);
    for (int i = 0; i < iteration; i++) {
        int random_index = rand() % num_shapes;
        printf("Shape Shifting: %s\n", shapes[random_index]);
    }
}

int main() {
    char raw_input[MAX_INPUT_SIZE];
    char sanitized_output[MAX_OUTPUT_SIZE];

    printf("Welcome to the Shape Shifting Input Sanitizer!\n");
    printf("Please enter a sentence (max %d characters): ", MAX_INPUT_SIZE - 1);

    // Get user input
    if (fgets(raw_input, sizeof(raw_input), stdin) != NULL) {
        // Remove trailing newline character if it exists
        raw_input[strcspn(raw_input, "\n")] = 0;

        // Sanitize the user input
        sanitize_input(raw_input, sanitized_output);

        printf("Sanitized output: \"%s\"\n", sanitized_output);

        // Make the creature shape-shift based on the length of sanitized output
        int shift_count = strlen(sanitized_output) % 5 + 1; // Shift 1 to 5 times
        creature_shape_shift(shift_count);
    }

    printf("All done! Keep your input safe!\n");
    return 0;
}