//Falcon2-11B DATASET v1.0 Category: Stock market tracker ; Style: shocked
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>

typedef struct {
    char name[20];
    float price;
    float volume;
} Stock;

int main() {
    // Creating 10 stocks
    Stock stocks[10];
    for(int i=0;i<10;i++) {
        stocks[i].name[0] = (char)(rand()%26 + 'a');
        stocks[i].price = (float)(rand()%1000 + 1);
        stocks[i].volume = (float)(rand()%1000 + 1);
    }

    // Printing the stocks
    printf("Stock Market Tracker\n");
    for(int i=0;i<10;i++) {
        printf("%s: %.2f %s\n", stocks[i].name, stocks[i].price, stocks[i].volume > 0? "BUY" : "SELL");
    }

    // Asking for user input
    char userInput[20];
    printf("Enter the name of the stock you want to buy/sell: ");
    fgets(userInput, sizeof(userInput), stdin);

    // Processing user input
    int index = -1;
    for(int i=0;i<10;i++) {
        if(strcmp(stocks[i].name, userInput) == 0) {
            index = i;
            break;
        }
    }

    if(index!= -1) {
        if(stocks[index].volume > 0) {
            printf("BUYING %s...\n", stocks[index].name);
            stocks[index].volume--;
            printf("You bought %s for %.2f\n", stocks[index].name, stocks[index].price);
        } else {
            printf("SELLING %s...\n", stocks[index].name);
            stocks[index].volume++;
            printf("You sold %s for %.2f\n", stocks[index].name, stocks[index].price);
        }
    } else {
        printf("No such stock in the market\n");
    }

    return 0;
}