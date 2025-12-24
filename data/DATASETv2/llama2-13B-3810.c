//LLAMA2-13B DATASET v1.0 Category: Database simulation ; Style: genius
// geniussimpledb.c

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define DATABASE_SIZE 1000
#define RECORD_SIZE 50

// Structure to store records
struct record {
    char name[20];
    char age[3];
    char gender[5];
};

// Function to insert records
void insert_records(struct record *records, int size) {
    int i;
    for (i = 0; i < size; i++) {
        srand(time(NULL));
        strcpy(records[i].name, "Person ");
        sprintf(records[i].age, "%d", (rand() % 100) + 1);
        strcpy(records[i].gender, (rand() % 2) ? "Male" : "Female");
    }
}

// Function to search records
struct record* search_records(struct record *records, int size, char* name) {
    int i;
    for (i = 0; i < size; i++) {
        if (strcmp(records[i].name, name) == 0) {
            return &records[i];
        }
    }
    return NULL;
}

// Function to update records
void update_records(struct record *records, int size, char* name, char* new_value) {
    int i;
    for (i = 0; i < size; i++) {
        if (strcmp(records[i].name, name) == 0) {
            strcpy(records[i].age, new_value);
            break;
        }
    }
}

// Function to delete records
void delete_records(struct record *records, int size, char* name) {
    int i;
    for (i = 0; i < size; i++) {
        if (strcmp(records[i].name, name) == 0) {
            memset(records[i].name, 0, strlen(records[i].name));
            memset(records[i].age, 0, strlen(records[i].age));
            memset(records[i].gender, 0, strlen(records[i].gender));
            break;
        }
    }
}

int main() {
    struct record records[DATABASE_SIZE];
    int size = DATABASE_SIZE;

    // Insert records
    insert_records(records, size);

    // Search records
    struct record* found_record = search_records(records, size, "Alice");
    if (found_record != NULL) {
        printf("Found record: %s %d %s\n", found_record->name, found_record->age, found_record->gender);
    } else {
        printf("Record not found\n");
    }

    // Update records
    update_records(records, size, "Alice", "25");

    // Search records again
    found_record = search_records(records, size, "Alice");
    if (found_record != NULL) {
        printf("Found record: %s %d %s\n", found_record->name, found_record->age, found_record->gender);
    } else {
        printf("Record not found\n");
    }

    // Delete records
    delete_records(records, size, "Alice");

    return 0;
}