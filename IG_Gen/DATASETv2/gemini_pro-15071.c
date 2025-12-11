//GEMINI-pro DATASET v1.0 Category: Digital Diary ; Style: distributed
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the maximum length of a diary entry
#define MAX_ENTRY_LENGTH 1024

// Define the maximum number of diary entries
#define MAX_ENTRIES 100

// Define the structure of a diary entry
typedef struct {
  char *date;
  char *entry;
} DiaryEntry;

// Define the structure of a digital diary
typedef struct {
  DiaryEntry entries[MAX_ENTRIES];
  int num_entries;
} DigitalDiary;

// Create a new digital diary
DigitalDiary *create_diary() {
  DigitalDiary *diary = malloc(sizeof(DigitalDiary));
  diary->num_entries = 0;
  return diary;
}

// Add a new entry to the digital diary
void add_entry(DigitalDiary *diary, char *date, char *entry) {
  if (diary->num_entries < MAX_ENTRIES) {
    diary->entries[diary->num_entries].date = malloc(strlen(date) + 1);
    strcpy(diary->entries[diary->num_entries].date, date);
    diary->entries[diary->num_entries].entry = malloc(strlen(entry) + 1);
    strcpy(diary->entries[diary->num_entries].entry, entry);
    diary->num_entries++;
  }
}

// Print the digital diary
void print_diary(DigitalDiary *diary) {
  for (int i = 0; i < diary->num_entries; i++) {
    printf("Date: %s\n", diary->entries[i].date);
    printf("Entry: %s\n", diary->entries[i].entry);
    printf("\n");
  }
}

// Free the memory allocated by the digital diary
void free_diary(DigitalDiary *diary) {
  for (int i = 0; i < diary->num_entries; i++) {
    free(diary->entries[i].date);
    free(diary->entries[i].entry);
  }
  free(diary);
}

// Main function
int main() {
  // Create a new digital diary
  DigitalDiary *diary = create_diary();

  // Add some entries to the digital diary
  add_entry(diary, "2023-01-01", "Today I went for a walk in the park.");
  add_entry(diary, "2023-01-02", "Today I met with a friend for coffee.");
  add_entry(diary, "2023-01-03", "Today I worked on a new project.");

  // Print the digital diary
  print_diary(diary);

  // Free the memory allocated by the digital diary
  free_diary(diary);

  return 0;
}