//GEMINI-pro DATASET v1.0 Category: Product Inventory System ; Style: safe
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the maximum number of products that can be stored in the inventory.
#define MAX_PRODUCTS 100

// Define the structure of a product.
typedef struct product {
    char name[50];
    int quantity;
    float price;
} product;

// Define the structure of the inventory.
typedef struct inventory {
    product products[MAX_PRODUCTS];
    int num_products;
} inventory;

// Create a new inventory.
inventory* create_inventory() {
    inventory* inv = malloc(sizeof(inventory));
    inv->num_products = 0;
    return inv;
}

// Add a product to the inventory.
void add_product(inventory* inv, product* p) {
    if (inv->num_products < MAX_PRODUCTS) {
        inv->products[inv->num_products] = *p;
        inv->num_products++;
    }
}

// Remove a product from the inventory.
void remove_product(inventory* inv, char* name) {
    int i;
    for (i = 0; i < inv->num_products; i++) {
        if (strcmp(inv->products[i].name, name) == 0) {
            inv->products[i] = inv->products[inv->num_products - 1];
            inv->num_products--;
            break;
        }
    }
}

// Find a product in the inventory.
product* find_product(inventory* inv, char* name) {
    int i;
    for (i = 0; i < inv->num_products; i++) {
        if (strcmp(inv->products[i].name, name) == 0) {
            return &inv->products[i];
        }
    }
    return NULL;
}

// Print the inventory.
void print_inventory(inventory* inv) {
    int i;
    for (i = 0; i < inv->num_products; i++) {
        printf("%s %d %.2f\n", inv->products[i].name, inv->products[i].quantity, inv->products[i].price);
    }
}

// Main function.
int main() {
    // Create a new inventory.
    inventory* inv = create_inventory();

    // Add some products to the inventory.
    product p1 = {"Apple", 10, 1.0};
    add_product(inv, &p1);
    product p2 = {"Orange", 5, 1.5};
    add_product(inv, &p2);
    product p3 = {"Banana", 15, 2.0};
    add_product(inv, &p3);

    // Print the inventory.
    printf("Inventory:\n");
    print_inventory(inv);

    // Find a product in the inventory.
    product* p = find_product(inv, "Apple");
    if (p != NULL) {
        printf("Found product: %s\n", p->name);
    } else {
        printf("Product not found.\n");
    }

    // Remove a product from the inventory.
    remove_product(inv, "Orange");

    // Print the inventory again.
    printf("Inventory:\n");
    print_inventory(inv);

    // Free the memory allocated for the inventory.
    free(inv);

    return 0;
}