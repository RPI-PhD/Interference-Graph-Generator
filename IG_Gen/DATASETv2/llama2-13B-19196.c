//LLAMA2-13B DATASET v1.0 Category: Physics simulation ; Style: active
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define GRAVITY 9.8
#define FPS 60

typedef struct {
    double x;
    double y;
    double vx;
    double vy;
} Particle;

Particle particles[10];
int num_particles = 0;

void init_particles(void) {
    int i;
    for (i = 0; i < 10; i++) {
        particles[i].x = (double)rand() / RAND_MAX * 10 - 5;
        particles[i].y = (double)rand() / RAND_MAX * 10 - 5;
        particles[i].vx = (double)rand() / RAND_MAX * 2 - 1;
        particles[i].vy = (double)rand() / RAND_MAX * 2 - 1;
        num_particles++;
    }
}

void update_particles(void) {
    int i;
    for (i = 0; i < num_particles; i++) {
        particles[i].x += particles[i].vx;
        particles[i].y += particles[i].vy;
        particles[i].vx += GRAVITY;
        particles[i].vy += GRAVITY;
        if (particles[i].x < 0 || particles[i].x > 10 ||
                particles[i].y < 0 || particles[i].y > 10) {
            particles[i].x = (double)rand() / RAND_MAX * 10 - 5;
            particles[i].y = (double)rand() / RAND_MAX * 10 - 5;
            particles[i].vx = (double)rand() / RAND_MAX * 2 - 1;
            particles[i].vy = (double)rand() / RAND_MAX * 2 - 1;
        }
    }
}

void draw_particles(void) {
    int i;
    for (i = 0; i < num_particles; i++) {
        printf("%.2f %.2f %.2f %.2f\n", particles[i].x, particles[i].y, particles[i].vx, particles[i].vy);
    }
}

int main(void) {
    srand(time(NULL));
    init_particles();

    while (1) {
        update_particles();
        draw_particles();
        usleep(1000000 / FPS);
    }

    return 0;
}