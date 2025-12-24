//Falcon-180B DATASET v1.0 Category: TCP/IP Programming ; Style: introspective
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFFER_SIZE 1024

int main() {
    int sockfd, newsockfd, portno;
    struct sockaddr_in serv_addr, cli_addr;
    char buffer[BUFFER_SIZE];
    int addrlen;
    int opt = 1;

    // Create socket
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
        printf("Error creating socket\n");
        exit(1);
    }

    // Set options on the socket
    setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));

    // Bind the socket to a local address and port
    memset(&serv_addr, '0', sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(8080);

    // Bind the socket
    if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("Error binding socket\n");
        exit(1);
    }

    // Listen for incoming connections
    if (listen(sockfd, 5) < 0) {
        printf("Error listening on socket\n");
        exit(1);
    }

    // Accept a connection
    addrlen = sizeof(cli_addr);
    newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &addrlen);
    if (newsockfd < 0) {
        printf("Error accepting connection\n");
        exit(1);
    }

    // Send data to the client
    sprintf(buffer, "Welcome to the server! ");
    send(newsockfd, buffer, strlen(buffer), 0);

    // Receive data from the client
    memset(buffer, '0', BUFFER_SIZE);
    recv(newsockfd, buffer, BUFFER_SIZE, 0);

    // Close the socket
    close(newsockfd);
    close(sockfd);

    return 0;
}