//Falcon-180B DATASET v1.0 Category: Benchmarking ; Style: grateful
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ARRAY_SIZE 1000000

int main() {
    int i;
    int *array = (int *)malloc(ARRAY_SIZE * sizeof(int));
    if (array == NULL) {
        printf("Memory allocation failed!\n");
        exit(1);
    }

    /* Fill the array with random values */
    for (i = 0; i < ARRAY_SIZE; i++) {
        array[i] = rand() % 1000000;
    }

    /* Sort the array */
    clock_t start_time = clock();
    for (i = 0; i < ARRAY_SIZE - 1; i++) {
        int j;
        for (j = i + 1; j < ARRAY_SIZE; j++) {
            if (array[j] < array[i]) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    clock_t end_time = clock();

    /* Calculate the time taken for sorting */
    double time_taken = (double)(end_time - start_time) / CLOCKS_PER_SEC;

    /* Print the sorted array */
    printf("Sorted array:\n");
    for (i = 0; i < ARRAY_SIZE; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    /* Print the time taken for sorting */
    printf("Time taken for sorting: %.6f seconds\n", time_taken);

    /* Free the memory allocated for the array */
    free(array);

    return 0;
}