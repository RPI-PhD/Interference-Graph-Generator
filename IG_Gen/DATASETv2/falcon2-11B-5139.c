//Falcon2-11B DATASET v1.0 Category: Stock market tracker ; Style: complex
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TICKERS 10
#define MAX_SHARES 100

typedef struct {
    char ticker[5];
    int shares;
} Ticker;

typedef struct {
    Ticker tickers[MAX_TICKERS];
    int num_tickers;
} StockMarketTracker;

void add_ticker(StockMarketTracker *tracker, char *ticker, int shares) {
    if (tracker->num_tickers < MAX_TICKERS) {
        tracker->tickers[tracker->num_tickers].ticker[0] = '\0';
        strncpy(tracker->tickers[tracker->num_tickers].ticker, ticker, 4);
        tracker->tickers[tracker->num_tickers].shares = shares;
        tracker->num_tickers++;
    } else {
        printf("Error: Too many tickers added.\n");
    }
}

void remove_ticker(StockMarketTracker *tracker, char *ticker) {
    int i;
    for (i = 0; i < tracker->num_tickers; i++) {
        if (strcmp(tracker->tickers[i].ticker, ticker) == 0) {
            for (int j = i; j < tracker->num_tickers - 1; j++) {
                tracker->tickers[j] = tracker->tickers[j + 1];
            }
            tracker->num_tickers--;
            return;
        }
    }
    printf("Error: Ticker not found.\n");
}

void list_tickers(StockMarketTracker *tracker) {
    int i;
    for (i = 0; i < tracker->num_tickers; i++) {
        printf("%s: %d shares\n", tracker->tickers[i].ticker, tracker->tickers[i].shares);
    }
}

int main() {
    StockMarketTracker tracker;
    tracker.num_tickers = 0;

    add_ticker(&tracker, "AAPL", 10);
    add_ticker(&tracker, "GOOG", 20);
    add_ticker(&tracker, "MSFT", 30);
    add_ticker(&tracker, "TSLA", 50);
    add_ticker(&tracker, "AMZN", 60);
    add_ticker(&tracker, "FB", 70);
    add_ticker(&tracker, "NFLX", 80);
    add_ticker(&tracker, "PYPL", 90);
    add_ticker(&tracker, "ZNGA", 100);
    add_ticker(&tracker, "NFLX", 10);

    printf("Tickers: ");
    list_tickers(&tracker);

    remove_ticker(&tracker, "NFLX");
    printf("\nAfter removing NFLX: ");
    list_tickers(&tracker);

    return 0;
}