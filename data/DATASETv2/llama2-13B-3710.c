//LLAMA2-13B DATASET v1.0 Category: Port Scanner ; Style: accurate
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define PORT_RANGE 1024

int main() {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) {
        perror("socket creation failed");
        return 1;
    }

    struct sockaddr_in server_addr = {
        .sin_family = AF_INET,
        .sin_port = htons(0),
        .sin_addr.s_addr = INADDR_ANY
    };

    if (bind(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("bind failed");
        return 1;
    }

    int client_count = 0;

    for (int i = 1; i <= PORT_RANGE; i++) {
        struct sockaddr_in client_addr = {
            .sin_family = AF_INET,
            .sin_port = htons(i),
            .sin_addr.s_addr = INADDR_ANY
        };

        socklen_t client_len = sizeof(client_addr);

        int client_sock = accept(sock, (struct sockaddr *)&client_addr, &client_len);
        if (client_sock < 0) {
            perror("accept failed");
            continue;
        }

        printf("Client connected on port %d\n", ntohs(client_addr.sin_port));

        char buffer[1024];
        recv(client_sock, buffer, 1024, 0);
        printf("Client message: %s\n", buffer);

        send(client_sock, "Hello, client!", 13, 0);

        close(client_sock);
        client_count++;
    }

    printf("Total clients: %d\n", client_count);

    close(sock);
    return 0;
}