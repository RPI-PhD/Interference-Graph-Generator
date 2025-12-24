//GEMINI-pro DATASET v1.0 Category: File system simulation ; Style: visionary
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_FILES 100
#define MAX_BLOCKS 1000
#define BLOCK_SIZE 1024

typedef struct {
  char name[32];
  int size;
  int blocks[MAX_BLOCKS];
} file_t;

typedef struct {
  int free[MAX_BLOCKS];
} disk_t;

file_t files[MAX_FILES];
disk_t disk;

int main() {
  // Initialize the disk
  for (int i = 0; i < MAX_BLOCKS; i++) {
    disk.free[i] = 1;
  }

  // Create some files
  int num_files = 0;
  for (int i = 0; i < MAX_FILES; i++) {
    // Generate a random file name
    char name[32];
    for (int j = 0; j < 32; j++) {
      name[j] = 'a' + rand() % 26;
    }
    name[31] = '\0';

    // Generate a random file size
    int size = rand() % 10000;

    // Allocate blocks for the file
    int blocks[MAX_BLOCKS];
    int num_blocks = 0;
    for (int j = 0; j < size; j += BLOCK_SIZE) {
      int block = rand() % MAX_BLOCKS;
      if (disk.free[block]) {
        blocks[num_blocks++] = block;
        disk.free[block] = 0;
      }
    }

    // Create the file
    strcpy(files[num_files].name, name);
    files[num_files].size = size;
    memcpy(files[num_files].blocks, blocks, num_blocks * sizeof(int));
    num_files++;
  }

  // Print the file system
  printf("File System:\n");
  for (int i = 0; i < num_files; i++) {
    printf("  %s (%d bytes)\n", files[i].name, files[i].size);
  }

  // Free the disk
  for (int i = 0; i < MAX_BLOCKS; i++) {
    disk.free[i] = 1;
  }

  return 0;
}