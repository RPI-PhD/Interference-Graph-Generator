//GEMINI-pro DATASET v1.0 Category: Traffic Light Controller ; Style: creative
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

// Traffic light states
enum state {RED, YELLOW, GREEN};

// Traffic light colors
enum color {OFF, RED_LIGHT, YELLOW_LIGHT, GREEN_LIGHT};

// Define the traffic light
struct traffic_light {
    enum state state;
    enum color color;
    int time_remaining;
};

// Initialize the traffic light
void init_traffic_light(struct traffic_light *light) {
    light->state = RED;
    light->color = RED_LIGHT;
    light->time_remaining = 10;
}

// Update the traffic light
void update_traffic_light(struct traffic_light *light) {
    // Decrement the time remaining
    light->time_remaining--;

    // Check if the time remaining is zero
    if (light->time_remaining == 0) {
        // Change the state of the traffic light
        switch (light->state) {
            case RED:
                light->state = GREEN;
                light->color = GREEN_LIGHT;
                light->time_remaining = 10;
                break;
            case YELLOW:
                light->state = RED;
                light->color = RED_LIGHT;
                light->time_remaining = 10;
                break;
            case GREEN:
                light->state = YELLOW;
                light->color = YELLOW_LIGHT;
                light->time_remaining = 5;
                break;
        }
    }
}

// Display the traffic light
void display_traffic_light(struct traffic_light *light) {
    // Clear the screen
    system("cls");

    // Print the traffic light
    printf("\n\n");
    printf("  +---+   +---+   +---+\n");
    printf("  | %c |   | %c |   | %c |\n", light->color, light->color, light->color);
    printf("  +---+   +---+   +---+\n");
    printf("    %d     %d     %d\n", light->time_remaining, light->time_remaining, light->time_remaining);
    printf("\n\n");
}

// Main function
int main() {
    // Initialize the traffic light
    struct traffic_light light;
    init_traffic_light(&light);

    // Update the traffic light forever
    while (true) {
        // Update the traffic light
        update_traffic_light(&light);

        // Display the traffic light
        display_traffic_light(&light);

        // Sleep for 1 second
        sleep(1);
    }

    return 0;
}