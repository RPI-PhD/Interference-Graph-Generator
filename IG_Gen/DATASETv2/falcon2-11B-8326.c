//Falcon2-11B DATASET v1.0 Category: Firewall ; Style: standalone
#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <netinet/tcp.h>
#include <netdb.h>

#define PORT 8080

int main() {
    int server_fd, client_fd;
    struct sockaddr_in server_addr, client_addr;
    int addrlen = sizeof(client_addr);

    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == -1) {
        perror("socket failed");
        return 1;
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("bind failed");
        return 1;
    }

    if (listen(server_fd, 5) < 0) {
        perror("listen failed");
        return 1;
    }

    while (1) {
        client_fd = accept(server_fd, (struct sockaddr *)&client_addr, &addrlen);
        if (client_fd < 0) {
            perror("accept failed");
            return 1;
        }

        char buffer[1024];
        while (1) {
            bzero(buffer, sizeof(buffer));
            int bytes_read = recv(client_fd, buffer, sizeof(buffer), 0);
            if (bytes_read <= 0) {
                close(client_fd);
                break;
            }
            printf("%s\n", buffer);
            send(client_fd, "Received\n", strlen("Received\n"), 0);
        }

        close(client_fd);
    }

    close(server_fd);
    return 0;
}