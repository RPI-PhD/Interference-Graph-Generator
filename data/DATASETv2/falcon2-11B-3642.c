//Falcon2-11B DATASET v1.0 Category: Chat server ; Style: synchronous
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <netinet/in.h>

#define PORT 8080

int main() {
    int listen_socket, client_socket;
    struct sockaddr_in server, client;
    int opt = 1;

    listen_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (listen_socket < 0) {
        perror("socket error");
        exit(EXIT_FAILURE);
    }

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(PORT);
    if (bind(listen_socket, (struct sockaddr *) &server, sizeof(server)) < 0) {
        perror("bind error");
        exit(EXIT_FAILURE);
    }

    if (listen(listen_socket, 3) < 0) {
        perror("listen error");
        exit(EXIT_FAILURE);
    }

    while (1) {
        client_socket = accept(listen_socket, (struct sockaddr *) &client, (socklen_t *) &opt);
        if (client_socket < 0) {
            perror("accept error");
            exit(EXIT_FAILURE);
        }

        char buffer[256];
        int len = 0;

        while (len > 0) {
            len = recv(client_socket, buffer, sizeof(buffer), 0);
            if (len < 0) {
                perror("recv error");
                exit(EXIT_FAILURE);
            }

            send(client_socket, buffer, len, 0);
        }

        close(client_socket);
    }

    return 0;
}