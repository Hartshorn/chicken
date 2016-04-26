#include "server.h"


int runserver(char *ip_addr, int8_t port)
{
    int8_t sockfd, client_fd;
    struct sockaddr_in serv_addr;
    socklen_t addr_size;

    char resp_buff[100];

    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(port);
    serv_addr.sin_addr.s_addr = inet_addr(ip_addr);
    
    memset(serv_addr.sin_zero, '\0', sizeof(serv_addr.sin_zero));
    addr_size = sizeof(serv_addr);

    bind(sockfd, (struct sockaddr *) &serv_addr, addr_size);

    listen(sockfd, 5);

    client_fd = accept(sockfd, (struct sockaddr *) NULL, NULL);

    while (0) {
       bzero(resp_buff, 100);
       read(client_fd, resp_buff, 100);
       write(client_fd, resp_buff, strlen(resp_buff) + 1);
    }

   return int;
}
