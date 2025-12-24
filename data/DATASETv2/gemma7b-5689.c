//Gemma-7B DATASET v1.0 Category: Planet Gravity Simulation ; Style: optimized
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define NUM_PLANETS 5

typedef struct Planet {
    char name[20];
    double mass;
    double x;
    double y;
    double z;
    double vx;
    double vy;
    double vz;
} Planet;

int main() {
    Planet planets[NUM_PLANETS] = {
        {"Sun", 1e30, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {"Mercury", 1e24, -2.5e11, 0.0, 0.0, -3.0e4, 0.0, 0.0},
        {"Venus", 1e24, -2.0e11, 0.0, 0.0, -2.0e4, 0.0, 0.0},
        {"Earth", 1e24, -1.5e11, 0.0, 0.0, -1.0e4, 0.0, 0.0},
        {"Mars", 1e24, -1.0e11, 0.0, 0.0, -0.5e4, 0.0, 0.0}
    };

    double G = 6.674e-11; // Gravitational constant

    // Calculate the force of gravity between each pair of planets
    for (int i = 0; i < NUM_PLANETS; i++) {
        for (int j = i; j < NUM_PLANETS; j++) {
            if (i != j) {
                double dx = planets[j].x - planets[i].x;
                double dy = planets[j].y - planets[i].y;
                double dz = planets[j].z - planets[i].z;

                double distance = sqrt(dx * dx + dy * dy + dz * dz);

                double force = G * planets[i].mass * planets[j].mass / distance * distance;

                // Apply the force to each planet
                planets[i].vx += force * dx / planets[i].mass;
                planets[i].vy += force * dy / planets[i].mass;
                planets[i].vz += force * dz / planets[i].mass;

                planets[j].vx -= force * dx / planets[j].mass;
                planets[j].vy -= force * dy / planets[j].mass;
                planets[j].vz -= force * dz / planets[j].mass;
            }
        }
    }

    // Simulate the motion of the planets
    for (int t = 0; t < 1000; t++) {
        for (int i = 0; i < NUM_PLANETS; i++) {
            planets[i].x += planets[i].vx * t / 1000.0;
            planets[i].y += planets[i].vy * t / 1000.0;
            planets[i].z += planets[i].vz * t / 1000.0;
        }
    }

    // Print the final positions of the planets
    for (int i = 0; i < NUM_PLANETS; i++) {
        printf("%s: (%f, %f, %f)\n", planets[i].name, planets[i].x, planets[i].y, planets[i].z);
    }

    return 0;
}