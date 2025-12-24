//LLAMA2-13B DATASET v1.0 Category: Database simulation ; Style: introspective
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 20
#define MAX_AGE 100

// Structure to hold a person's name, age, and address
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
    char address[50];
} person_t;

// Function to read in a person's information from the user
void read_person(person_t *person) {
    printf("Enter name: ");
    fgets(person->name, MAX_NAME_LENGTH, stdin);
    printf("Enter age: ");
    scanf("%d", &person->age);
    printf("Enter address: ");
    fgets(person->address, 50, stdin);
}

// Function to display a person's information
void display_person(person_t person) {
    printf("Name: %s\n", person.name);
    printf("Age: %d\n", person.age);
    printf("Address: %s\n", person.address);
}

// Function to add a new person to the database
void add_person(person_t *people, int *count) {
    int i;
    for (i = 0; i < *count; i++) {
        if (strcmp(people[i].name, "") == 0) {
            break;
        }
    }
    if (i == *count) {
        printf("Database is full, cannot add new person\n");
        return;
    }
    people[i].age = people[i].age + 1;
    printf("Person %d added to the database\n", i + 1);
    *count += 1;
}

// Function to remove a person from the database
void remove_person(person_t *people, int *count, int index) {
    if (index >= 0 && index < *count) {
        memmove(people + index, people + index + 1, (*count - index) * sizeof(person_t));
        *count -= 1;
        printf("Person %d removed from the database\n", index + 1);
    } else {
        printf("Invalid index\n");
    }
}

// Function to search for a person in the database
int search_person(person_t *people, int count, char *name) {
    int i;
    for (i = 0; i < count; i++) {
        if (strcmp(people[i].name, name) == 0) {
            return i;
        }
    }
    return -1;
}

int main() {
    int count = 0;
    person_t people[MAX_RECORDS];

    // Initialize the database
    for (int i = 0; i < MAX_RECORDS; i++) {
        people[i].age = 0;
        strcpy(people[i].name, "No name");
        strcpy(people[i].address, "No address");
    }

    // Read in the first person's information
    read_person(&people[count]);
    count++;

    // Add more people to the database
    add_person(people, &count);

    // Remove a person from the database
    remove_person(people, &count, 2);

    // Search for a person in the database
    int result = search_person(people, count, "John");
    if (result != -1) {
        display_person(people[result]);
    } else {
        printf("Person not found\n");
    }

    return 0;
}