//MISTRAL-7B DATASET v1.0 Category: Weather simulation ; Style: interoperable
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define CITY_SIZE 5

typedef struct {
    float temperature;
    float humidity;
    float precipitation;
} Weather;

void generate_weather(Weather city[], int days);
void print_city_weather(Weather city[]);

int main() {
    srand(time(NULL));
    Weather city[CITY_SIZE];
    int days = 10;

    generate_weather(city, days);
    print_city_weather(city);

    return 0;
}

void generate_weather(Weather city[], int days) {
    for (int i = 0; i < CITY_SIZE; i++) {
        city[i].temperature = rand() % 30 + 5;
        city[i].humidity = (rand() % 51) + 50.0;
        city[i].precipitation = (rand() % 11) + 0.1;
    }

    for (int i = 0; i < days; i++) {
        for (int j = 0; j < CITY_SIZE; j++) {
            city[j].temperature += (rand() % 5) - 2;
            city[j].humidity += (rand() % 11) - 5;
            city[j].precipitation += (rand() % 3) * 0.1;
        }
    }
}

void print_city_weather(Weather city[]) {
    printf("\nCity Weather Report\n");
    for (int i = 0; i < CITY_SIZE; i++) {
        printf("\nCity %d:\n", i + 1);
        printf("Temperature: %.2f°C\n", city[i].temperature);
        printf("Humidity: %.2f%%\n", city[i].humidity);
        printf("Precipitation: %.1fmm\n", city[i].precipitation);
    }
}