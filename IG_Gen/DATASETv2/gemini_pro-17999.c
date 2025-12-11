//GEMINI-pro DATASET v1.0 Category: Simple Web Server ; Style: innovative
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>

#define PORT 8080

int main() {
  int server_fd, new_socket, valread;
  struct sockaddr_in address;
  int addrlen = sizeof(address);
  char buffer[1024] = {0};
  char *hello = "HTTP/1.1 200 OK\nContent-Type: text/plain\nContent-Length: 12\n\nHello world!";

  // Create a socket
  if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
    perror("socket failed");
    exit(EXIT_FAILURE);
  }

  address.sin_family = AF_INET;
  address.sin_addr.s_addr = INADDR_ANY;
  address.sin_port = htons(PORT);

  // Bind the socket to the address
  if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
    perror("bind failed");
    exit(EXIT_FAILURE);
  }

  // Listen for incoming connections
  if (listen(server_fd, 3) < 0) {
    perror("listen failed");
    exit(EXIT_FAILURE);
  }

  // Accept a connection
  if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t *)&addrlen)) < 0) {
    perror("accept failed");
    exit(EXIT_FAILURE);
  }

  // Read the request
  valread = read(new_socket, buffer, 1024);
  printf("%s\n", buffer);

  // Send the response
  send(new_socket, hello, strlen(hello), 0);

  // Close the connection
  close(new_socket);

  // Close the server socket
  close(server_fd);

  return 0;
}