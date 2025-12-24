//Falcon-180B DATASET v1.0 Category: Traffic Light Controller ; Style: high level of detail
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Define the duration of each light state in seconds
#define RED_LIGHT_DURATION 30
#define YELLOW_LIGHT_DURATION 5
#define GREEN_LIGHT_DURATION 30

// Define the number of cycles before the red light is activated again
#define NUM_CYCLES 10

// Define the light states
enum light_state {
    RED_LIGHT,
    YELLOW_LIGHT,
    GREEN_LIGHT
};

// Define the light controller struct
typedef struct {
    enum light_state current_state;
    int num_cycles;
    time_t start_time;
} LightController;

// Initialize the light controller
void init_light_controller(LightController* controller) {
    controller->current_state = RED_LIGHT;
    controller->num_cycles = NUM_CYCLES;
    controller->start_time = time(NULL);
}

// Update the light state
void update_light_state(LightController* controller) {
    switch (controller->current_state) {
        case RED_LIGHT:
            controller->current_state = YELLOW_LIGHT;
            break;
        case YELLOW_LIGHT:
            controller->current_state = GREEN_LIGHT;
            break;
        case GREEN_LIGHT:
            controller->current_state = RED_LIGHT;
            // Reset the number of cycles after a certain amount of time
            if (difftime(time(NULL), controller->start_time) > 60) {
                controller->num_cycles = NUM_CYCLES;
            }
            break;
    }
}

// Print the current light state
void print_light_state(enum light_state state) {
    switch (state) {
        case RED_LIGHT:
            printf("RED LIGHT\n");
            break;
        case YELLOW_LIGHT:
            printf("YELLOW LIGHT\n");
            break;
        case GREEN_LIGHT:
            printf("GREEN LIGHT\n");
            break;
    }
}

// Main function
int main() {
    // Initialize the light controller
    LightController controller;
    init_light_controller(&controller);

    // Loop indefinitely to simulate the traffic light controller
    while (1) {
        // Print the current light state
        print_light_state(controller.current_state);

        // Wait for the appropriate duration based on the current light state
        switch (controller.current_state) {
            case RED_LIGHT:
                sleep(RED_LIGHT_DURATION);
                break;
            case YELLOW_LIGHT:
                sleep(YELLOW_LIGHT_DURATION);
                break;
            case GREEN_LIGHT:
                sleep(GREEN_LIGHT_DURATION);
                break;
        }

        // Update the light state
        update_light_state(&controller);
    }

    return 0;
}