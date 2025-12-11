//GEMINI-pro DATASET v1.0 Category: Airport Baggage Handling Simulation ; Style: artistic
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_BAGS 1000
#define MAX_WEIGHT 50
#define MAX_TIME 100

struct bag {
  int weight;
  int time;
  int destination;
};

struct belt {
  struct bag bags[NUM_BAGS];
  int num_bags;
};

struct airport {
  struct belt belts[10];
};

void init_airport(struct airport *airport) {
  for (int i = 0; i < 10; i++) {
    airport->belts[i].num_bags = 0;
  }
}

void create_bag(struct bag *bag) {
  bag->weight = rand() % MAX_WEIGHT + 1;
  bag->time = rand() % MAX_TIME + 1;
  bag->destination = rand() % 10;
}

void load_bag(struct belt *belt, struct bag *bag) {
  belt->bags[belt->num_bags] = *bag;
  belt->num_bags++;
}

void move_bags(struct airport *airport) {
  for (int i = 0; i < 10; i++) {
    struct belt *belt = &airport->belts[i];
    for (int j = 0; j < belt->num_bags; j++) {
      if (belt->bags[j].time > 0) {
        belt->bags[j].time--;
      }
      if (belt->bags[j].time == 0) {
        // Bag has reached its destination
        printf("Bag %d has arrived at destination %d\n", j, belt->bags[j].destination);
        // Remove bag from belt
        for (int k = j; k < belt->num_bags - 1; k++) {
          belt->bags[k] = belt->bags[k + 1];
        }
        belt->num_bags--;
      }
    }
  }
}

void print_airport(struct airport *airport) {
  for (int i = 0; i < 10; i++) {
    struct belt *belt = &airport->belts[i];
    printf("Belt %d: ", i);
    for (int j = 0; j < belt->num_bags; j++) {
      printf("(%d, %d) ", belt->bags[j].weight, belt->bags[j].time);
    }
    printf("\n");
  }
}

int main() {
  srand(time(NULL));

  struct airport airport;
  init_airport(&airport);

  for (int i = 0; i < NUM_BAGS; i++) {
    struct bag bag;
    create_bag(&bag);
    load_bag(&airport.belts[bag.destination], &bag);
  }

  for (int i = 0; i < MAX_TIME; i++) {
    move_bags(&airport);
    print_airport(&airport);
  }

  return 0;
}