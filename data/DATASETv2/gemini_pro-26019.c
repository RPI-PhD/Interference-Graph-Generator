//GEMINI-pro DATASET v1.0 Category: Remote control Vehicle Simulation ; Style: irregular
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <time.h>
#include <unistd.h>

#define UP 'w'
#define DOWN 's'
#define LEFT 'a'
#define RIGHT 'd'
#define QUIT 'q'

struct car {
    int x, y;
    char dir;
};

void move_car(struct car *car, char dir) {
    switch (dir) {
        case UP:
            car->y--;
            break;
        case DOWN:
            car->y++;
            break;
        case LEFT:
            car->x--;
            break;
        case RIGHT:
            car->x++;
            break;
    }
}

void draw_car(struct car *car) {
    printf("\033[%d;%dH", car->y, car->x);
    printf("|");
    printf("\033[%d;%dH", car->y, car->x + 1);
    printf("|");
    printf("\033[%d;%dH", car->y, car->x + 2);
    printf("___");
    printf("\033[%d;%dH", car->y + 1, car->x + 1);
    printf("|===|");
    printf("\033[%d;%dH", car->y + 2, car->x);
    printf("/   \\");
    printf("\033[%d;%dH", car->y + 2, car->x + 2);
    printf("|\033[31m|_|\033[0m|");
}

int main() {
    struct car car = {0, 0, UP};
    struct termios old_term, new_term;

    tcgetattr(0, &old_term);
    new_term = old_term;
    new_term.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(0, TCSANOW, &new_term);

    while (1) {
        draw_car(&car);
        char input = getchar();
        if (input == QUIT) {
            break;
        }
        move_car(&car, input);
    }

    tcsetattr(0, TCSANOW, &old_term);
    return 0;
}