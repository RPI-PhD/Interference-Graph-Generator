//Falcon-180B DATASET v1.0 Category: Smart home light control ; Style: Ada Lovelace
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>
#include <unistd.h>
#include <pthread.h>

#define MAX_COMMANDS 10
#define DELAY 1000
#define LIGHT_ON 1
#define LIGHT_OFF 0

char commands[MAX_COMMANDS][100];
int num_commands = 0;

void *run_commands(void *param) {
    while (true) {
        for (int i = 0; i < num_commands; i++) {
            if (strcmp(commands[i], "light on") == 0) {
                light_on();
            } else if (strcmp(commands[i], "light off") == 0) {
                light_off();
            }
        }
        usleep(DELAY * 1000);
    }
    return NULL;
}

void light_on() {
    printf("Light turned on.\n");
}

void light_off() {
    printf("Light turned off.\n");
}

void add_command(char *command) {
    strcpy(commands[num_commands], command);
    num_commands++;
}

int main() {
    add_command("light on");
    add_command("light off");

    pthread_t thread_id;
    pthread_create(&thread_id, NULL, run_commands, NULL);

    while (true) {
        char input[100];
        printf("Enter command: ");
        fgets(input, 100, stdin);
        input[strcspn(input, "\n")] = '\0';
        add_command(input);
    }

    return 0;
}