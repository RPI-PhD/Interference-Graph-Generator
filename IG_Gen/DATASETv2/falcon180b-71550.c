//Falcon-180B DATASET v1.0 Category: Linked list operations ; Style: Cyberpunk
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node {
    int data;
    struct node* next;
} Node;

Node* create_node(int data) {
    Node* new_node = (Node*) malloc(sizeof(Node));
    if (new_node == NULL) {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    new_node->data = data;
    new_node->next = NULL;
    return new_node;
}

void add_node_at_beginning(Node** head, int data) {
    Node* new_node = create_node(data);
    new_node->next = *head;
    *head = new_node;
}

void add_node_at_end(Node** head, int data) {
    Node* new_node = create_node(data);
    Node* temp = *head;
    if (*head == NULL) {
        *head = new_node;
        return;
    }
    while (temp->next!= NULL) {
        temp = temp->next;
    }
    temp->next = new_node;
}

void add_node_at_position(Node** head, int data, int position) {
    Node* new_node = create_node(data);
    Node* temp = *head;
    if (position == 1) {
        new_node->next = *head;
        *head = new_node;
        return;
    }
    for (int i = 1; i < position - 1 && temp!= NULL; i++) {
        temp = temp->next;
    }
    if (temp == NULL) {
        printf("Invalid position!\n");
        return;
    }
    new_node->next = temp->next;
    temp->next = new_node;
}

void delete_node_by_value(Node** head, int value) {
    Node* temp = *head;
    Node* prev = NULL;
    if (temp!= NULL && temp->data == value) {
        *head = temp->next;
        free(temp);
        return;
    }
    while (temp!= NULL && temp->data!= value) {
        prev = temp;
        temp = temp->next;
    }
    if (temp == NULL) {
        printf("Value not found in the list!\n");
        return;
    }
    prev->next = temp->next;
    free(temp);
}

void print_list(Node* head) {
    Node* temp = head;
    while (temp!= NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    Node* head = NULL;
    add_node_at_beginning(&head, 10);
    add_node_at_end(&head, 20);
    add_node_at_position(&head, 15, 2);
    print_list(head);
    delete_node_by_value(&head, 10);
    print_list(head);
    delete_node_by_value(&head, 20);
    print_list(head);
    delete_node_by_value(&head, 15);
    print_list(head);
    return 0;
}