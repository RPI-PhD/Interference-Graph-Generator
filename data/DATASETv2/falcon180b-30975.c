//Falcon-180B DATASET v1.0 Category: Sorting ; Style: Cryptic
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_SIZE 1000000

typedef struct {
    int data;
    int index;
} data_t;

void swap(data_t* a, data_t* b) {
    data_t temp = *a;
    *a = *b;
    *b = temp;
}

int partition(data_t arr[], int low, int high) {
    int pivot = arr[high].data;
    int i = low - 1;
    for (int j = low; j <= high - 1; j++) {
        if (arr[j].data < pivot) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return i + 1;
}

void quick_sort(data_t arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quick_sort(arr, low, pi - 1);
        quick_sort(arr, pi + 1, high);
    }
}

void generate_array(data_t arr[], int size) {
    srand(time(NULL));
    for (int i = 0; i < size; i++) {
        arr[i].data = rand() % 1000;
        arr[i].index = i;
    }
}

void print_array(data_t arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i].data);
    }
    printf("\n");
}

int main() {
    data_t arr[MAX_SIZE];
    int size = MAX_SIZE;

    generate_array(arr, size);
    printf("Before sorting:\n");
    print_array(arr, size);

    quick_sort(arr, 0, size - 1);
    printf("After sorting:\n");
    print_array(arr, size);

    return 0;
}