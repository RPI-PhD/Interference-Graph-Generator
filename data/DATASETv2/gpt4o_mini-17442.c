//GPT-4o-mini DATASET v1.0 Category: Secure Password Generator ; Style: Cryptic
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define PASSWORD_LENGTH 16
#define UPPERCASE_COUNT 26
#define LOWERCASE_COUNT 26
#define DIGIT_COUNT 10
#define SPECIAL_COUNT 10

const char uppercase[UPPERCASE_COUNT] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const char lowercase[LOWERCASE_COUNT] = "abcdefghijklmnopqrstuvwxyz";
const char digits[DIGIT_COUNT] = "0123456789";
const char special[SPECIAL_COUNT] = "!@#$%^&*()";

void shuffle(char *array, int n) {
    srand(time(NULL));
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        char temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

void generate_password(char *password) {
    int counts[4] = {0}; // Counts for upper, lower, digit, special
    int types[4] = {UPPERCASE_COUNT, LOWERCASE_COUNT, DIGIT_COUNT, SPECIAL_COUNT};
    char *sets[4] = {uppercase, lowercase, digits, special};
    
    // Ensure at least one of each character type
    password[0] = uppercase[rand() % UPPERCASE_COUNT];
    password[1] = lowercase[rand() % LOWERCASE_COUNT];
    password[2] = digits[rand() % DIGIT_COUNT];
    password[3] = special[rand() % SPECIAL_COUNT];
    counts[0]++; counts[1]++; counts[2]++; counts[3]++;
    
    int total_length = PASSWORD_LENGTH - 4;

    // Fill the remaining characters randomly
    for (int i = 4; i < PASSWORD_LENGTH; i++) {
        int type = rand() % 4;
        password[i] = sets[type][rand() % types[type]];
        counts[type]++;
    }
    
    // Shuffle the generated password to ensure randomness
    shuffle(password, PASSWORD_LENGTH);
    password[PASSWORD_LENGTH] = '\0'; // Null terminate the string
}

void display_password(const char *password) {
    printf("Generated Secure Password: %s\n", password);
}

int main() {
    srand(time(NULL)); // Seed randomness
    char password[PASSWORD_LENGTH + 1]; // +1 for null termination
    generate_password(password);
    display_password(password);
    return 0;
}