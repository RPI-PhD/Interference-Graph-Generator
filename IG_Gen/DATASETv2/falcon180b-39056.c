//Falcon-180B DATASET v1.0 Category: Digital Auction System ; Style: surprised
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Define item structure
typedef struct {
    char name[50];
    int starting_bid;
    int current_bid;
    int highest_bidder;
} item;

// Function to initialize items
void initialize_items(item items[], int n) {
    for (int i = 0; i < n; i++) {
        items[i].starting_bid = rand() % 100 + 1;
        items[i].current_bid = items[i].starting_bid;
        items[i].highest_bidder = -1;
    }
}

// Function to display items
void display_items(item items[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d. %s - Starting bid: $%d - Current bid: $%d - Highest bidder: %d\n", i+1, items[i].name, items[i].starting_bid, items[i].current_bid, items[i].highest_bidder);
    }
}

// Function to place a bid
void place_bid(item items[], int n, int item_index, int bid, int bidder) {
    if (items[item_index].current_bid < bid) {
        items[item_index].current_bid = bid;
        items[item_index].highest_bidder = bidder;
    }
}

// Function to check if auction is over
int is_auction_over(item items[], int n) {
    for (int i = 0; i < n; i++) {
        if (items[i].highest_bidder == -1) {
            return 0;
        }
    }
    return 1;
}

// Function to get winning bids
void get_winning_bids(item items[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%s sold to bidder %d for $%d!\n", items[i].name, items[i].highest_bidder, items[i].current_bid);
    }
}

int main() {
    srand(time(0));
    item items[5];
    initialize_items(items, 5);
    display_items(items, 5);

    int num_bidders = 5;
    int bidder;
    while (num_bidders > 0) {
        bidder = rand() % 5 + 1;
        int item_index = rand() % 5;
        int bid = rand() % 100 + 1;
        place_bid(items, 5, item_index, bid, bidder);
        printf("%d placed a bid of $%d on %s!\n", bidder, bid, items[item_index].name);
        num_bidders--;
    }

    if (is_auction_over(items, 5)) {
        get_winning_bids(items, 5);
    } else {
        printf("Auction not over.\n");
    }

    return 0;
}