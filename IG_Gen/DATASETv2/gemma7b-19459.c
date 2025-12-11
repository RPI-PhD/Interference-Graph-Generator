//Gemma-7B DATASET v1.0 Category: Digital Auction System ; Style: paranoid
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BIDS 10

typedef struct Bid {
    char *name;
    int amount;
    struct Bid *next;
} Bid;

Bid *insertBid(Bid *head, char *name, int amount) {
    Bid *newBid = malloc(sizeof(Bid));
    newBid->name = strdup(name);
    newBid->amount = amount;
    newBid->next = NULL;

    if (head == NULL) {
        head = newBid;
    } else {
        head->next = newBid;
    }

    return head;
}

void printBids(Bid *head) {
    Bid *currentBid = head;

    while (currentBid) {
        printf("%s: %d\n", currentBid->name, currentBid->amount);
        currentBid = currentBid->next;
    }
}

int main() {
    Bid *head = NULL;

    // Insert bids
    insertBid(head, "John Doe", 100);
    insertBid(head, "Jane Doe", 120);
    insertBid(head, "Bill Smith", 110);

    // Print bids
    printBids(head);

    // Check for bid tampering
    if (head->amount != 100) {
        printf("Bid tampering detected!");
    }

    return 0;
}