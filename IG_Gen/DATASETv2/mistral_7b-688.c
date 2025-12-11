//MISTRAL-7B DATASET v1.0 Category: Medical Store Management System ; Style: Cryptic
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char name[50];
    int stock;
    float price;
} Medicine;

typedef struct {
    int id;
    Medicine med;
} StockItem;

#define MAX_STOCK 100
#define MAX_MEDICINES 20

StockItem stock[MAX_STOCK];
int stock_count = 0;

void add_medicine(char *name, int quantity, float price) {
    if (stock_count >= MAX_STOCK) {
        printf("Error: Stock full!\n");
        return;
    }

    strcpy(stock[stock_count].med.name, name);
    stock[stock_count].med.stock = quantity;
    stock[stock_count].med.price = price;
    stock_count++;
}

void display_stock() {
    int i;
    printf("\nCURRENT STOCK:\n");
    for (i = 0; i < stock_count; i++) {
        printf("\nID: %d", stock[i].id);
        printf("\nMEDICINE: %s", stock[i].med.name);
        printf("\nQUANTITY: %d", stock[i].med.stock);
        printf("\nPRICE: %.2f", stock[i].med.price);
    }
}

void search_medicine(char *name) {
    int i;
    for (i = 0; i < stock_count; i++) {
        if (strcmp(stock[i].med.name, name) == 0) {
            printf("\nID: %d", stock[i].id);
            printf("\nMEDICINE: %s", stock[i].med.name);
            printf("\nQUANTITY: %d", stock[i].med.stock);
            printf("\nPRICE: %.2f", stock[i].med.price);
            return;
        }
    }

    printf("\nMedicine not found!\n");
}

int main() {
#define NUM_MEDICINES 5
    int i;

    for (i = 0; i < NUM_MEDICINES; i++) {
        char medicine_name[50];
        int quantity;
        float price;

        printf("\nEnter medicine name: ");
        scanf("%s", medicine_name);
        printf("\nEnter quantity: ");
        scanf("%d", &quantity);
        printf("\nEnter price: ");
        scanf("%f", &price);

        add_medicine(medicine_name, quantity, price);
    }

    display_stock();

    char search_name[50];

    printf("\nEnter medicine name to search: ");
    scanf("%s", search_name);

    search_medicine(search_name);

    return 0;
}