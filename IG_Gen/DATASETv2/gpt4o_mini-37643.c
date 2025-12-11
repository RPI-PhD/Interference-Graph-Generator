//GPT-4o-mini DATASET v1.0 Category: Password Strength Checker ; Style: random
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MIN_LENGTH 8
#define MAX_LENGTH 20

// Function to check if the password meets the criteria
int isStrongPassword(const char *password) {
    int length = strlen(password);
    
    // Check the length of the password
    if (length < MIN_LENGTH || length > MAX_LENGTH) {
        return 0; // Length criteria not satisfied
    }

    int hasUpper = 0, hasLower = 0, hasDigit = 0, hasSpecial = 0;
    
    // Check for the presence of different character types
    for (int i = 0; i < length; i++) {
        if (isupper(password[i])) {
            hasUpper = 1;
        } else if (islower(password[i])) {
            hasLower = 1;
        } else if (isdigit(password[i])) {
            hasDigit = 1;
        } else if (ispunct(password[i])) {
            hasSpecial = 1;
        }
    }
    
    // Return 1 if all conditions are satisfied
    return hasUpper && hasLower && hasDigit && hasSpecial;
}

// Function to display the strength of the password
void displayStrength(const char *password) {
    if (isStrongPassword(password)) {
        printf("Password: \"%s\" is Strong!\n", password);
    } else {
        printf("Password: \"%s\" is Weak!\n", password);
    }
}

// Function to gather user input for the password
void getUserInput(char *buffer, int size) {
    printf("Enter your password (8-20 characters): ");
    fgets(buffer, size, stdin);

    // Remove newline character if present
    buffer[strcspn(buffer, "\n")] = 0;
}

int main() {
    char password[100];
    
    // Welcoming message
    printf("Welcome to the Password Strength Checker!\n");
    printf("Please follow the guidelines for a strong password.\n\n");
    
    // Get user input
    getUserInput(password, sizeof(password));
    
    // Display the password strength
    displayStrength(password);
    
    // The End
    printf("\nThank you for using the Password Strength Checker!\n");
    return 0;
}