//GEMINI-pro DATASET v1.0 Category: Pixel Art Generator ; Style: protected
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WIDTH 800
#define HEIGHT 600

typedef struct {
    unsigned char r, g, b;
} pixel;

pixel pixels[WIDTH][HEIGHT];

void draw_line(int x0, int y0, int x1, int y1, pixel color) {
    int dx = abs(x1 - x0), sx = x0 < x1 ? 1 : -1;
    int dy = abs(y1 - y0), sy = y0 < y1 ? 1 : -1;
    int err = (dx > dy ? dx : -dy) / 2;
    while (1) {
        pixels[x0][y0] = color;
        if (x0 == x1 && y0 == y1) break;
        int e2 = err;
        if (e2 > -dx) { err -= dy; x0 += sx; }
        if (e2 < dy) { err += dx; y0 += sy; }
    }
}

void draw_circle(int x, int y, int radius, pixel color) {
    int x0 = x, y0 = y, d = 3 - 2 * radius;
    while (x0 <= y0) {
        pixels[x0 + radius][y0] = color;
        pixels[x0 - radius][y0] = color;
        pixels[x0][y0 + radius] = color;
        pixels[x0][y0 - radius] = color;
        pixels[y0 + radius][x0] = color;
        pixels[y0 - radius][x0] = color;
        pixels[y0][x0 + radius] = color;
        pixels[y0][x0 - radius] = color;
        if (d < 0) d += 4 * x0++ + 6;
        else d += 4 * (x0++ - y0--) + 10;
    }
}

void draw_rectangle(int x, int y, int width, int height, pixel color) {
    for (int i = 0; i < width; i++) {
        pixels[x + i][y] = color;
        pixels[x + i][y + height - 1] = color;
    }
    for (int i = 0; i < height; i++) {
        pixels[x][y + i] = color;
        pixels[x + width - 1][y + i] = color;
    }
}

void save_ppm(const char *filename) {
    FILE *fp = fopen(filename, "wb");
    fprintf(fp, "P6\n%d %d\n255\n", WIDTH, HEIGHT);
    fwrite(pixels, sizeof(pixel), WIDTH * HEIGHT, fp);
    fclose(fp);
}

int main() {
    memset(pixels, 0, sizeof(pixels));

    draw_line(0, 0, WIDTH - 1, HEIGHT - 1, (pixel){255, 0, 0});
    draw_circle(WIDTH / 2, HEIGHT / 2, 100, (pixel){0, 255, 0});
    draw_rectangle(100, 100, 200, 100, (pixel){0, 0, 255});

    save_ppm("pixel_art.ppm");
    return 0;
}