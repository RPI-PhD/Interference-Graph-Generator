//GPT-4o-mini DATASET v1.0 Category: String manipulation ; Style: synchronous
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_INPUT_LENGTH 100
#define REVERSED_LENGTH 200

void reverseString(const char *source, char *destination) {
    int length = strlen(source);
    for (int i = 0; i < length; i++) {
        destination[i] = source[length - i - 1];
    }
    destination[length] = '\0'; // Null-terminate the reversed string
}

void toUpperCase(const char *source, char *destination) {
    int length = strlen(source);
    for (int i = 0; i < length; i++) {
        destination[i] = toupper(source[i]);
    }
    destination[length] = '\0'; // Null-terminate the uppercased string
}

void toLowerCase(const char *source, char *destination) {
    int length = strlen(source);
    for (int i = 0; i < length; i++) {
        destination[i] = tolower(source[i]);
    }
    destination[length] = '\0'; // Null-terminate the lowercased string
}

void removeSpaces(const char *source, char *destination) {
    int j = 0;
    for (int i = 0; source[i] != '\0'; i++) {
        if (source[i] != ' ') {
            destination[j++] = source[i];
        }
    }
    destination[j] = '\0'; // Null-terminate the string without spaces
}

void concatenateStrings(const char *str1, const char *str2, char *result) {
    strcpy(result, str1);
    strcat(result, str2);
}

int main() {
    char input[MAX_INPUT_LENGTH];
    char reversed[REVERSED_LENGTH];
    char upper[MAX_INPUT_LENGTH];
    char lower[MAX_INPUT_LENGTH];
    char noSpaces[MAX_INPUT_LENGTH];
    char concatenated[REVERSED_LENGTH];
    
    printf("Enter a string (max %d characters): ", MAX_INPUT_LENGTH - 1);
    fgets(input, sizeof(input), stdin);

    // Strip newline character if present
    input[strcspn(input, "\n")] = '\0';
    
    // Reverse the string
    reverseString(input, reversed);
    printf("Reversed String: %s\n", reversed);

    // Convert to uppercase
    toUpperCase(input, upper);
    printf("Uppercased String: %s\n", upper);

    // Convert to lowercase
    toLowerCase(input, lower);
    printf("Lowercased String: %s\n", lower);

    // Remove spaces
    removeSpaces(input, noSpaces);
    printf("String without spaces: %s\n", noSpaces);

    // Concatenate original string with its reversed version
    concatenateStrings(input, reversed, concatenated);
    printf("Concatenated with Reversed: %s\n", concatenated);
    
    // Additional manipulation - counting vowels
    int vowelCount = 0;
    for (int i = 0; input[i] != '\0'; i++) {
        char currentChar = tolower(input[i]);
        if (currentChar == 'a' || currentChar == 'e' || currentChar == 'i' ||
            currentChar == 'o' || currentChar == 'u') {
            vowelCount++;
        }
    }
    printf("Number of vowels in the input string: %d\n", vowelCount);

    // Additional manipulation - checking for palindrome
    if (strcmp(input, reversed) == 0) {
        printf("The input string is a palindrome.\n");
    } else {
        printf("The input string is not a palindrome.\n");
    }

    // Memory cleanup (not strictly necessary as we are not using dynamic memory in this example)
    // free(reversed);
    // free(upper);
    // free(lower);
    // free(noSpaces);
    
    return 0;
}