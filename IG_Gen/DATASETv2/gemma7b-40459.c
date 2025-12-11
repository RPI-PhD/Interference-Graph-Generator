//Gemma-7B DATASET v1.0 Category: Simple Web Server ; Style: configurable
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>
#include <unistd.h>

#define PORT 8080
#define BUFFER_SIZE 1024

typedef struct {
  char name[256];
  int age;
} User;

User users[10] = {
  {"John Doe", 25},
  {"Jane Doe", 30},
  {"Peter Pan", 12},
  {"Mary Poppins", 20},
  {"The Cat in the Hat", 40},
  {"Mr. Spock", 50},
  {"Batman", 35},
  {"Superman", 45},
  {"Spider-Man", 15},
  {"Iron Man", 20}
};

int main() {
  int sockfd, newsockfd;
  struct sockaddr_in serv_addr, client_addr;
  char buffer[BUFFER_SIZE];

  sockfd = socket(AF_INET, SOCK_STREAM, htons(PORT));
  if (sockfd < 0) {
    perror("Error creating socket");
    exit(1);
  }

  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(PORT);
  serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);

  bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));

  while (1) {
    newsockfd = accept(sockfd, (struct sockaddr *)&client_addr, NULL);
    if (newsockfd < 0) {
      perror("Error accepting connection");
      continue;
    }

    recv(newsockfd, buffer, BUFFER_SIZE, 0);
    printf("Client: %s\n", buffer);

    for (int i = 0; i < 10; i++) {
      if (strcmp(users[i].name, buffer) == 0) {
        printf("User: %s, Age: %d\n", users[i].name, users[i].age);
      }
    }

    send(newsockfd, "Message from server", 20, 0);
    close(newsockfd);
  }

  return 0;
}