//GPT-4o-mini DATASET v1.0 Category: Metadata Extractor ; Style: lively
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define a structure to hold metadata
typedef struct {
    char title[100];
    char artist[100];
    char album[100];
    int year;
    float duration; // in seconds
} Metadata;

// Function to print the extracted metadata
void printMetadata(Metadata *meta) {
    printf("---- Metadata Information ----\n");
    printf("Title: %s\n", meta->title);
    printf("Artist: %s\n", meta->artist);
    printf("Album: %s\n", meta->album);
    printf("Year: %d\n", meta->year);
    printf("Duration: %.2f seconds\n", meta->duration);
    printf("-------------------------------\n");
}

// Function to simulate metadata extraction
void extractMetadata(const char *filename, Metadata *meta) {
    // Simulated extraction logic; In reality, you'd read actual file data
    strcpy(meta->title, "Mystery of C");
    strcpy(meta->artist, "C Programmer");
    strcpy(meta->album, "C Compilation");
    meta->year = 2023;
    meta->duration = 240.50; // 4 minutes and 30 seconds
}

// Function to simulate user interaction
void userInteraction() {
    char file[100];

    printf("Welcome to the C Metadata Extractor!\n");
    printf("===================================\n");
    printf("Please enter the filename whose metadata you want to extract: ");
    fgets(file, sizeof(file), stdin);
    file[strcspn(file, "\n")] = 0; // Remove newline character

    Metadata meta;
    printf("Extracting metadata from %s...\n", file);
    extractMetadata(file, &meta);
    printMetadata(&meta);
}

// Main function
int main() {
    printf("Starting the Metadata Extractor...\n");
    userInteraction();
    
    printf("Thank you for using the C Metadata Extractor!\n");
    printf("Goodbye! Keep exploring the music of C!\n");
    
    return 0;
}