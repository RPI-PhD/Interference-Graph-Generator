//Gemma-7B DATASET v1.0 Category: Game of Life ; Style: multivariable
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int board[20][20];
    int x, y, i, j, k, l, generation = 0;

    // Initialize the board
    for (x = 0; x < 20; x++)
    {
        for (y = 0; y < 20; y++)
        {
            board[x][y] = 0;
        }
    }

    // Seed the board with random values
    for (i = 0; i < 100; i++)
    {
        x = rand() % 20;
        y = rand() % 20;
        board[x][y] = 1;
    }

    // Game loop
    while (generation < 10)
    {
        // Calculate the next generation
        for (i = 0; i < 20; i++)
        {
            for (j = 0; j < 20; j++)
            {
                k = 0;
                l = 0;
                // Count the neighbors
                for (x = -1; x <= 1; x++)
                {
                    for (y = -1; y <= 1; y++)
                    {
                        if (x == 0 && y == 0) continue;
                        if (board[x][y] == 1) k++;
                    }
                }

                // Apply the rules of survival and reproduction
                if (board[i][j] == 1 && k < 2) board[i][j] = 0;
                if (board[i][j] == 0 && k == 3) board[i][j] = 1;
            }
        }

        // Print the board
        for (x = 0; x < 20; x++)
        {
            for (y = 0; y < 20; y++)
            {
                printf("%d ", board[x][y]);
            }
            printf("\n");
        }

        generation++;
    }

    return 0;
}