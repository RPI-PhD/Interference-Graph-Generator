//Falcon-180B DATASET v1.0 Category: Checksum Calculator ; Style: multiplayer
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <time.h>

#define PORT 8080
#define MAX 1024

int main(int argc, char *argv[])
{
    int sockfd, newsockfd, len;
    struct sockaddr_in serv_addr, cli_addr;
    char buffer[MAX];

    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd < 0)
    {
        perror("socket failed");
        exit(1);
    }

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(PORT);

    if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    {
        perror("bind failed");
        exit(1);
    }

    listen(sockfd, 5);

    while (1)
    {
        len = sizeof(cli_addr);
        newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, (socklen_t *)&len);

        if (newsockfd < 0)
        {
            perror("accept failed");
            exit(1);
        }

        send(newsockfd, "Welcome to the C Checksum Calculator!\n", strlen("Welcome to the C Checksum Calculator!\n"), 0);
        send(newsockfd, "Please enter a string to calculate its checksum.\n", strlen("Please enter a string to calculate its checksum.\n"), 0);

        while (1)
        {
            memset(buffer, 0, MAX);
            recv(newsockfd, buffer, MAX, 0);

            if (strlen(buffer) == 0)
            {
                send(newsockfd, "Invalid input. Please enter a valid string.\n", strlen("Invalid input. Please enter a valid string.\n"), 0);
                continue;
            }

            char *str = strdup(buffer);
            int sum = 0;

            for (int i = 0; i < strlen(str); i++)
            {
                sum += (int)str[i];
            }

            char checksum[10];
            sprintf(checksum, "%d", sum % 256);

            send(newsockfd, "The checksum of the string is: ", strlen("The checksum of the string is: "), 0);
            send(newsockfd, checksum, strlen(checksum), 0);

            free(str);
            break;
        }

        close(newsockfd);
    }

    close(sockfd);

    return 0;
}