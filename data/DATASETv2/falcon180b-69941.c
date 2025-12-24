//Falcon-180B DATASET v1.0 Category: Simulation of the Solar System ; Style: surrealist
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define PI 3.14159265358979323846
#define G 6.67430e-11
#define DAY 86400

typedef struct {
    double x, y, z;
    double vx, vy, vz;
    double ax, ay, az;
    double mass;
} Planet;

void advance(Planet *planet, double dt) {
    double r = sqrt(pow(planet->x, 2) + pow(planet->y, 2) + pow(planet->z, 2));
    double force = G * planet->mass / pow(r, 2);

    planet->ax = force * planet->x / r;
    planet->ay = force * planet->y / r;
    planet->az = force * planet->z / r;

    planet->vx += planet->ax * dt;
    planet->vy += planet->ay * dt;
    planet->vz += planet->az * dt;

    planet->x += planet->vx * dt;
    planet->y += planet->vy * dt;
    planet->z += planet->vz * dt;
}

int main() {
    srand(time(NULL));

    Planet sun = {0, 0, 0, 0, 0, 0, 1};
    Planet earth = {1, 0, 0, 0, 0, 0, 1};
    Planet moon = {1.5, 0, 0, 0, 0, 0, 0.0123};

    double dt = DAY / 1000;

    while (1) {
        advance(&sun, dt);
        advance(&earth, dt);
        advance(&moon, dt);

        printf("Sun: (%f, %f, %f)\n", sun.x, sun.y, sun.z);
        printf("Earth: (%f, %f, %f)\n", earth.x, earth.y, earth.z);
        printf("Moon: (%f, %f, %f)\n", moon.x, moon.y, moon.z);
    }

    return 0;
}