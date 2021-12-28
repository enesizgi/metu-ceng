/*
** talker.c -- a datagram "client" demo
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <string>
#include <iostream>

int main(int argc, char *argv[])
{
	int sockfd;
	struct addrinfo hints, *servinfo, *p;
	int rv;
	int numbytes;

	if (argc != 4)
	{
		fprintf(stderr, "usage: talker hostname message\n");
		exit(1);
	}

	memset(&hints, 0, sizeof hints);
	hints.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints.ai_socktype = SOCK_DGRAM;
	std::cout << argv[2] << " " << argv[3] << "\n";

	if ((rv = getaddrinfo(argv[1], argv[3], &hints, &servinfo)) != 0)
	{
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
		return 1;
	}

	// loop through all the results and make a socket
	for (p = servinfo; p != NULL; p = p->ai_next)
	{
		if ((sockfd = socket(p->ai_family, p->ai_socktype,
							 p->ai_protocol)) == -1)
		{
			perror("talker: socket");
			continue;
		}

		if (bind(sockfd, p->ai_addr, p->ai_addrlen) == -1)
		{
			close(sockfd);
			perror("talker: bind");
			continue;
		}

		break;
	}

	int sockfd2,rv2;
	struct addrinfo hints2, *servinfo2, *p2;
	memset(&hints2, 0, sizeof hints2);
	hints2.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints2.ai_socktype = SOCK_DGRAM;

	if ((rv2 = getaddrinfo(argv[1], argv[2], &hints2, &servinfo2)) != 0)
	{
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv2));
		return 1;
	}

	// loop through all the results and make a socket
	for (p2 = servinfo2; p2 != NULL; p2 = p2->ai_next)
	{
		if ((sockfd2 = socket(p2->ai_family, p2->ai_socktype,
							 p2->ai_protocol)) == -1)
		{
			perror("talker: socket");
			continue;
		}

		if (connect(sockfd2, p2->ai_addr, p2->ai_addrlen) == -1)
		{
			close(sockfd2);
			perror("talker: connect");
			continue;
		}

		break;
	}


	if (p == NULL || p2 == NULL)
	{
		fprintf(stderr, "talker: failed to create socket\n");
		return 2;
	}

	while (true)
	{
		std::string message;
		std::cin >> message;
		std::cout << message << " " << message.size() << "\n";
		if ((numbytes = sendto(sockfd, (void*)message.c_str(), message.size() + 1, 0,
							   p2->ai_addr, p2->ai_addrlen)) == -1)
		{
			perror("talker: sendto");
			exit(1);
		}
		std::cout << "sendto bytes:" << numbytes << "\n";
	}

	freeaddrinfo(servinfo);

	printf("talker: sent %d bytes to %s\n", numbytes, argv[1]);
	close(sockfd);

	return 0;
}