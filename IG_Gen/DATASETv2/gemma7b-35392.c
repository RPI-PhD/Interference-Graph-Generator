//Gemma-7B DATASET v1.0 Category: Geometric algorithms ; Style: Sherlock Holmes
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void main()
{
    // The Adventure Begins...
    int x, y;
    printf("Enter the dimensions of the room (x, y): ");
    scanf("%d %d", &x, &y);

    // Draw the room
    int **room = (int**)malloc(x * sizeof(int*));
    for (int i = 0; i < x; i++)
    {
        room[i] = (int*)malloc(y * sizeof(int));
        for (int j = 0; j < y; j++)
        {
            room[i][j] = 0;
        }
    }

    // Place the treasure
    printf("Enter the coordinates of the treasure (x, y): ");
    scanf("%d %d", &x, &y);
    room[x][y] = 1;

    // Search for the treasure
    int search_x, search_y;
    printf("Enter the coordinates of your search (x, y): ");
    scanf("%d %d", &search_x, &search_y);

    // Check if the treasure has been found
    if (room[search_x][search_y] == 1)
    {
        printf("Congratulations! You have found the treasure!");
    }
    else
    {
        printf("Sorry, the treasure is not there.");
    }

    // Free the memory
    for (int i = 0; i < x; i++)
    {
        free(room[i]);
    }
    free(room);

    return 0;
}