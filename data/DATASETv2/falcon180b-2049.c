//Falcon-180B DATASET v1.0 Category: Robot movement control ; Style: energetic
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

#define WIDTH 50
#define HEIGHT 50
#define NUM_ROBOTS 10
#define ROBOT_SPEED 2
#define ROBOT_RANGE 10

enum Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT
};

struct Robot {
    int x, y;
    enum Direction dir;
};

void init_robot(struct Robot* r) {
    r->x = rand() % WIDTH;
    r->y = rand() % HEIGHT;
    r->dir = rand() % 4;
}

void move_robot(struct Robot* r) {
    switch (r->dir) {
        case UP:
            r->y--;
            break;
        case DOWN:
            r->y++;
            break;
        case LEFT:
            r->x--;
            break;
        case RIGHT:
            r->x++;
            break;
    }
}

bool check_collision(struct Robot* r1, struct Robot* r2) {
    int dx = r1->x - r2->x;
    int dy = r1->y - r2->y;
    return dx * dx + dy * dy <= ROBOT_RANGE * ROBOT_RANGE;
}

void turn_robot(struct Robot* r, enum Direction dir) {
    r->dir = dir;
}

void print_robot(struct Robot* r) {
    printf("Robot at (%d, %d) facing %d\n", r->x, r->y, r->dir);
}

int main() {
    srand(time(NULL));
    struct Robot robots[NUM_ROBOTS];

    for (int i = 0; i < NUM_ROBOTS; i++) {
        init_robot(&robots[i]);
    }

    while (true) {
        for (int i = 0; i < NUM_ROBOTS; i++) {
            move_robot(&robots[i]);
            print_robot(&robots[i]);
        }

        for (int i = 0; i < NUM_ROBOTS; i++) {
            for (int j = i + 1; j < NUM_ROBOTS; j++) {
                if (check_collision(&robots[i], &robots[j])) {
                    turn_robot(&robots[i], (enum Direction)((int)robots[i].dir + 2) % 4);
                    turn_robot(&robots[j], (enum Direction)((int)robots[j].dir + 2) % 4);
                }
            }
        }

        usleep(100000);
    }

    return 0;
}