//GEMINI-pro DATASET v1.0 Category: Percolation Simulator ; Style: creative
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

// Grid dimensions
#define WIDTH 20
#define HEIGHT 20

// Probability of a cell being open
#define PROBABILITY 0.5

// Cell states
#define OPEN 1
#define CLOSED 0

// Initialize the grid
void init_grid(int grid[HEIGHT][WIDTH]) {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            grid[i][j] = (rand() < RAND_MAX * PROBABILITY) ? OPEN : CLOSED;
        }
    }
}

// Print the grid
void print_grid(int grid[HEIGHT][WIDTH]) {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            printf("%c ", grid[i][j] ? 'O' : 'X');
        }
        printf("\n");
    }
}

// Check if a cell is open
int is_open(int grid[HEIGHT][WIDTH], int x, int y) {
    return grid[x][y] == OPEN;
}

// Check if a cell is within the grid
int is_in_bounds(int x, int y) {
    return x >= 0 && x < HEIGHT && y >= 0 && y < WIDTH;
}

// Perform a depth-first search from the given cell
void dfs(int grid[HEIGHT][WIDTH], int x, int y) {
    if (!is_in_bounds(x, y) || !is_open(grid, x, y)) {
        return;
    }

    // Mark the cell as visited
    grid[x][y] = -1;

    // Recursively visit all adjacent cells
    dfs(grid, x - 1, y);
    dfs(grid, x + 1, y);
    dfs(grid, x, y - 1);
    dfs(grid, x, y + 1);
}

// Check if the grid percolates
int percolates(int grid[HEIGHT][WIDTH]) {
    // Mark all cells on the top row as visited
    for (int i = 0; i < WIDTH; i++) {
        if (is_open(grid, 0, i)) {
            dfs(grid, 0, i);
        }
    }

    // Check if any cells on the bottom row have been visited
    for (int i = 0; i < WIDTH; i++) {
        if (grid[HEIGHT - 1][i] == -1) {
            return 1;
        }
    }

    return 0;
}

int main() {
    // Seed the random number generator
    srand(time(NULL));

    // Initialize the grid
    int grid[HEIGHT][WIDTH];
    init_grid(grid);

    // Print the grid
    printf("Initial grid:\n");
    print_grid(grid);

    // Check if the grid percolates
    int does_percolate = percolates(grid);

    // Print the result
    printf("Does the grid percolate? %s\n", does_percolate ? "Yes" : "No");

    return 0;
}