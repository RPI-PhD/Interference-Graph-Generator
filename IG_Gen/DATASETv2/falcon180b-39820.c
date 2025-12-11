//Falcon-180B DATASET v1.0 Category: Password Strength Checker ; Style: synchronous
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MIN_PASSWORD_LENGTH 8
#define MAX_PASSWORD_LENGTH 32
#define MAX_PASSWORD_ATTEMPTS 3

int is_valid_password(const char *password);

int main() {
    char password[MAX_PASSWORD_LENGTH];
    int attempts = 0;

    while (attempts < MAX_PASSWORD_ATTEMPTS) {
        printf("Enter a password (between %d and %d characters):\n", MIN_PASSWORD_LENGTH, MAX_PASSWORD_LENGTH);
        fgets(password, MAX_PASSWORD_LENGTH, stdin);

        if (is_valid_password(password)) {
            printf("Password is valid.\n");
            break;
        } else {
            printf("Password is not valid.\n");
            attempts++;
        }
    }

    return 0;
}

int is_valid_password(const char *password) {
    int length = strlen(password);
    int has_uppercase = 0;
    int has_lowercase = 0;
    int has_digit = 0;
    int has_special_char = 0;

    if (length < MIN_PASSWORD_LENGTH || length > MAX_PASSWORD_LENGTH) {
        return 0;
    }

    for (int i = 0; i < length; i++) {
        char c = tolower(password[i]);

        if (isalpha(c)) {
            if (isupper(c)) {
                has_uppercase = 1;
            } else {
                has_lowercase = 1;
            }
        } else if (isdigit(c)) {
            has_digit = 1;
        } else if (!isalnum(c)) {
            has_special_char = 1;
        }
    }

    if (has_uppercase && has_lowercase && has_digit && has_special_char) {
        return 1;
    } else {
        return 0;
    }
}