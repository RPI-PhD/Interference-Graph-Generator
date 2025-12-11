//Gemma-7B DATASET v1.0 Category: Queue Implementation ; Style: beginner-friendly
#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 10

typedef struct Node {
    int data;
    struct Node* next;
} Node;

struct Queue {
    Node* front;
    Node* rear;
    int size;
};

void enqueue(struct Queue* queue, int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;

    if (queue->front == NULL) {
        queue->front = newNode;
    } else {
        queue->rear->next = newNode;
    }

    queue->rear = newNode;
    queue->size++;
}

int dequeue(struct Queue* queue) {
    if (queue->front == NULL) {
        return -1;
    }

    int data = queue->front->data;
    queue->front = queue->front->next;
    queue->size--;

    return data;
}

int main() {
    struct Queue* queue = (struct Queue*)malloc(sizeof(struct Queue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->size = 0;

    enqueue(queue, 10);
    enqueue(queue, 20);
    enqueue(queue, 30);

    int data = dequeue(queue);
    if (data != -1) {
        printf("Dequed data: %d\n", data);
    }

    data = dequeue(queue);
    if (data != -1) {
        printf("Dequed data: %d\n", data);
    }

    data = dequeue(queue);
    if (data != -1) {
        printf("Dequed data: %d\n", data);
    }

    data = dequeue(queue);
    if (data != -1) {
        printf("Dequed data: %d\n", data);
    }

    return 0;
}