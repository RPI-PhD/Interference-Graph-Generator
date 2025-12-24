//GEMINI-pro DATASET v1.0 Category: Physics simulation ; Style: curious
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define WIDTH 800
#define HEIGHT 600
#define SCALE 20
#define FRAMERATE 60

typedef struct {
    double x, y;
    double vx, vy;
    double m;
    double r;
} Particle;

Particle particles[100];

void initParticles() {
    for (int i = 0; i < 100; i++) {
        particles[i].x = WIDTH / 2 + (rand() % (WIDTH / 2)) - (WIDTH / 4);
        particles[i].y = HEIGHT / 2 + (rand() % (HEIGHT / 2)) - (HEIGHT / 4);
        particles[i].vx = (rand() % 100) / 100.0;
        particles[i].vy = (rand() % 100) / 100.0;
        particles[i].m = (rand() % 100) / 100.0;
        particles[i].r = (rand() % 100) / 100.0;
    }
}

void updateParticles() {
    for (int i = 0; i < 100; i++) {
        particles[i].x += particles[i].vx / FRAMERATE;
        particles[i].y += particles[i].vy / FRAMERATE;

        if (particles[i].x > WIDTH || particles[i].x < 0) {
            particles[i].vx *= -1;
        }

        if (particles[i].y > HEIGHT || particles[i].y < 0) {
            particles[i].vy *= -1;
        }
    }
}

void drawParticles() {
    for (int i = 0; i < 100; i++) {
        printf("%d %d %d\n", particles[i].x, particles[i].y, particles[i].r);
    }
}

int main() {
    srand(time(NULL));
    initParticles();

    while (1) {
        updateParticles();
        drawParticles();
    }

    return 0;
}