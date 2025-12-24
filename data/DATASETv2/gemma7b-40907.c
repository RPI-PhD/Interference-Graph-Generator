//Gemma-7B DATASET v1.0 Category: Data mining ; Style: random
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void main() {
    char **arr = NULL;
    int size = 0;
    FILE *fp = NULL;
    char buffer[1024];
    int i = 0, j = 0, k = 0;
    double avg = 0.0, sum = 0.0;

    fp = fopen("data.txt", "r");
    if (fp == NULL) {
        perror("Error opening file");
        exit(1);
    }

    // Calculate the size of the file
    while (fgets(buffer, 1024, fp) != NULL) {
        size++;
    }

    // Allocate memory for the array
    arr = (char **)malloc(size * sizeof(char *));

    // Read the file again and store the data in the array
    rewind(fp);
    while (fgets(buffer, 1024, fp) != NULL) {
        arr[i++] = strdup(buffer);
    }

    // Calculate the average of each element in the array
    for (i = 0; i < size; i++) {
        sum += atof(arr[i]);
    }

    avg = sum / size;

    // Print the average
    printf("The average of each element in the array is: %.2lf", avg);

    // Free the memory allocated for the array
    free(arr);

    // Close the file
    fclose(fp);

    return 0;
}