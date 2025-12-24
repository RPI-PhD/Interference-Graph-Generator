//Falcon-180B DATASET v1.0 Category: Medical Store Management System ; Style: Linus Torvalds
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ITEMS 100
#define MAX_NAME_LENGTH 50
#define MAX_QUANTITY 1000

typedef struct {
    char name[MAX_NAME_LENGTH];
    int quantity;
    float price;
} item_t;

void add_item(item_t* items, int count, char* name, int quantity, float price) {
    if (count >= MAX_ITEMS) {
        printf("Error: Max items reached\n");
        return;
    }

    strcpy(items[count].name, name);
    items[count].quantity = quantity;
    items[count].price = price;

    printf("Item added: %s\n", name);
}

void display_items(item_t* items, int count) {
    printf("Items in store:\n");
    for (int i = 0; i < count; i++) {
        printf("%s: %d in stock, $%.2f each\n", items[i].name, items[i].quantity, items[i].price);
    }
}

void purchase_item(item_t* items, int count, char* name, int quantity) {
    for (int i = 0; i < count; i++) {
        if (strcmp(items[i].name, name) == 0) {
            if (items[i].quantity >= quantity) {
                items[i].quantity -= quantity;
                printf("%d %s purchased for $%.2f\n", quantity, name, items[i].price * quantity);
            } else {
                printf("Not enough %s in stock\n", name);
            }
            return;
        }
    }

    printf("Item not found\n");
}

void main() {
    item_t items[MAX_ITEMS];
    int count = 0;

    add_item(items, count, "Aspirin", 100, 0.50);
    add_item(items, count, "Ibuprofen", 50, 0.75);
    add_item(items, count, "Tylenol", 75, 1.00);

    display_items(items, count);

    purchase_item(items, count, "Aspirin", 25);
    purchase_item(items, count, "Ibuprofen", 10);
    purchase_item(items, count, "Tylenol", 50);

    display_items(items, count);
}