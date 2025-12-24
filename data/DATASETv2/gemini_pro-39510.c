//GEMINI-pro DATASET v1.0 Category: Fractal Generation ; Style: configurable
#include <stdio.h>
#include <stdlib.h>
#include <complex.h>

// Define the fractal parameters
#define MAX_ITERATIONS 256
#define WIDTH 800
#define HEIGHT 600
#define ZOOM 1.0
#define OFFSET 0.0

// Define the color palette
const int colors[] = {
    0x000000, 0x0000FF, 0x00FF00, 0xFF0000, 0xFFFF00, 0xFF00FF, 0x00FFFF, 0xFFFFFF
};

// Generate a fractal image
void generate_fractal(double complex center, double zoom, int width, int height, int max_iterations, int *pixels) {
    // Calculate the scaling factors
    double scale_x = (2.0 * zoom) / width;
    double scale_y = (2.0 * zoom) / height;

    // Iterate over each pixel in the image
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            // Calculate the complex coordinate of the pixel
            double complex c = center + (x - width / 2) * scale_x + (y - height / 2) * scale_y * I;

            // Iterate over the Mandelbrot set
            int iterations = 0;
            double complex z = 0.0;
            while (iterations < max_iterations && cabs(z) < 2.0) {
                z = z * z + c;
                iterations++;
            }

            // Color the pixel
            if (iterations == max_iterations) {
                pixels[y * width + x] = 0x000000;
            } else {
                pixels[y * width + x] = colors[iterations % 8];
            }
        }
    }
}

// Write the fractal image to a file
void write_fractal(int *pixels, int width, int height, char *filename) {
    // Open the file
    FILE *file = fopen(filename, "wb");
    if (file == NULL) {
        perror("Error opening file");
        exit(1);
    }

    // Write the header
    fprintf(file, "P3\n%d %d\n255\n", width, height);

    // Write the pixels
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            fprintf(file, "%d %d %d ", (pixels[y * width + x] >> 16) & 0xFF, (pixels[y * width + x] >> 8) & 0xFF, pixels[y * width + x] & 0xFF);
        }
        fprintf(file, "\n");
    }

    // Close the file
    fclose(file);
}

int main() {
    // Allocate memory for the pixels
    int *pixels = malloc(sizeof(int) * WIDTH * HEIGHT);

    // Generate the fractal
    generate_fractal(0.0, ZOOM, WIDTH, HEIGHT, MAX_ITERATIONS, pixels);

    // Write the fractal to a file
    write_fractal(pixels, WIDTH, HEIGHT, "fractal.ppm");

    // Free the memory
    free(pixels);

    return 0;
}