//Falcon-180B DATASET v1.0 Category: Subnet Calculator ; Style: introspective
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SUBNETS 10
#define MAX_SUBNET_SIZE 32
#define MAX_SUBNET_COUNT 100

typedef struct {
    char name[MAX_SUBNET_SIZE];
    int size;
    int count;
} subnet_t;

void print_subnets(subnet_t subnets[], int count) {
    printf("Subnets:\n");
    for (int i = 0; i < count; i++) {
        printf("%s (%d hosts)\n", subnets[i].name, subnets[i].count);
    }
}

int main() {
    int num_subnets;
    printf("Enter the number of subnets: ");
    scanf("%d", &num_subnets);

    if (num_subnets > MAX_SUBNETS) {
        printf("Error: Maximum number of subnets is %d.\n", MAX_SUBNETS);
        return 1;
    }

    subnet_t subnets[num_subnets];
    int total_hosts = 0;

    for (int i = 0; i < num_subnets; i++) {
        printf("Enter the name of subnet %d: ", i+1);
        scanf("%s", subnets[i].name);

        printf("Enter the size of subnet %s: ", subnets[i].name);
        scanf("%d", &subnets[i].size);

        if (subnets[i].size > MAX_SUBNET_SIZE) {
            printf("Error: Maximum subnet size is %d.\n", MAX_SUBNET_SIZE);
            return 1;
        }

        subnets[i].count = subnets[i].size - 2; // subtract 2 for network and broadcast addresses
        total_hosts += subnets[i].count;
    }

    if (total_hosts > MAX_SUBNET_COUNT) {
        printf("Error: Total number of hosts must not exceed %d.\n", MAX_SUBNET_COUNT);
        return 1;
    }

    printf("Subnets created successfully!\n");
    print_subnets(subnets, num_subnets);

    return 0;
}