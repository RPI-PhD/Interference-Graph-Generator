//GEMINI-pro DATASET v1.0 Category: File Backup System ; Style: multivariable
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_FILES 10
#define MAX_FILE_SIZE 1000

typedef struct {
  char name[256];
  int size;
  char data[MAX_FILE_SIZE];
} file;

file files[MAX_FILES];
int num_files = 0;

void add_file(char *name, int size, char *data) {
  if (num_files >= MAX_FILES) {
    printf("Error: too many files\n");
    return;
  }

  strcpy(files[num_files].name, name);
  files[num_files].size = size;
  memcpy(files[num_files].data, data, size);
  num_files++;
}

void print_files() {
  for (int i = 0; i < num_files; i++) {
    printf("File %d: %s (%d bytes)\n", i, files[i].name, files[i].size);
  }
}

void backup_files(char *filename) {
  FILE *fp = fopen(filename, "w");
  if (fp == NULL) {
    printf("Error: could not open file %s\n", filename);
    return;
  }

  for (int i = 0; i < num_files; i++) {
    fwrite(files[i].name, sizeof(char), strlen(files[i].name), fp);
    fwrite(&files[i].size, sizeof(int), 1, fp);
    fwrite(files[i].data, sizeof(char), files[i].size, fp);
  }

  fclose(fp);
}

void restore_files(char *filename) {
  FILE *fp = fopen(filename, "r");
  if (fp == NULL) {
    printf("Error: could not open file %s\n", filename);
    return;
  }

  while (!feof(fp)) {
    char name[256];
    int size;
    char data[MAX_FILE_SIZE];

    fread(name, sizeof(char), 256, fp);
    fread(&size, sizeof(int), 1, fp);
    fread(data, sizeof(char), size, fp);

    add_file(name, size, data);
  }

  fclose(fp);
}

int main() {
  // Add some sample files
  add_file("file1.txt", 10, "Hello, world!");
  add_file("file2.txt", 20, "This is a test file.");
  add_file("file3.txt", 30, "Lorem ipsum dolor sit amet, consectetur adipiscing elit.");

  // Print the files
  print_files();

  // Backup the files
  backup_files("backup.bin");

  // Restore the files
  restore_files("backup.bin");

  // Print the files again
  print_files();

  return 0;
}