//Falcon-180B DATASET v1.0 Category: Client Server Application ; Style: futuristic
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <time.h>

#define PORT 8080
#define BACKLOG 10
#define BUFFER_SIZE 1024

int main(int argc, char *argv[]) {
    int server_socket, client_socket;
    struct sockaddr_in server_addr, client_addr;
    socklen_t client_size;
    char buffer[BUFFER_SIZE];

    if ((server_socket = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        printf("Error creating socket\n");
        exit(1);
    }

    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port = htons(PORT);

    if (bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        printf("Error binding socket\n");
        exit(1);
    }

    if (listen(server_socket, BACKLOG) < 0) {
        printf("Error listening on socket\n");
        exit(1);
    }

    while (1) {
        if ((client_socket = accept(server_socket, (struct sockaddr *)&client_addr, &client_size)) < 0) {
            printf("Error accepting connection\n");
            exit(1);
        }

        time_t now = time(0);
        char *timestamp = ctime(&now);

        sprintf(buffer, "Welcome to the futuristic server, %s!\n", timestamp);
        send(client_socket, buffer, strlen(buffer), 0);

        close(client_socket);
    }

    return 0;
}