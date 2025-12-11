//LLAMA2-13B DATASET v1.0 Category: Networking ; Style: systematic
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define PORT 8080

int main(void) {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in serv_addr;
    char buffer[1024];

    // Set up server address
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);
    inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr);

    // Bind socket to address and port
    if (bind(sock, (struct sockaddr*) &serv_addr, sizeof(serv_addr)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    // Listen for incoming connections
    if (listen(sock, 3) < 0) {
        perror("listen failed");
        exit(EXIT_FAILURE);
    }

    printf("Listening for incoming connections...\n");

    while (1) {
        // Accept incoming connection
        int client_sock = accept(sock, NULL, NULL);

        // Receive data from client
        recv(client_sock, buffer, 1024, 0);

        // Send response back to client
        send(client_sock, "Hello, World!", 13, 0);

        // Close connection
        close(client_sock);
    }

    return 0;
}