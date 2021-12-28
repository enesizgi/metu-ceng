/*
** listener.c -- a datagram sockets "server" demo
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
#include <iostream>
#include <thread>
#include <mutex>

#define MAXBUFLEN 100

int sockfd, sockfd2;
struct sockaddr_storage their_addr;
char s[INET_ADDRSTRLEN];

void *get_in_addr(struct sockaddr *sa)
{
	return &(((struct sockaddr_in *)sa)->sin_addr);
}

unsigned short int get_port(struct sockaddr *sa)
{
	return (((struct sockaddr_in *)sa)->sin_port);
}

int thread1()
{
	int numbytes;
	std::cout << "Thread started to work " << ntohs(get_port((struct sockaddr *)&their_addr)) << "\n";

	int rv2;
	struct addrinfo hints2, *servinfo2, *p2;
	memset(&hints2, 0, sizeof hints2);
	hints2.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints2.ai_socktype = SOCK_DGRAM;

	std::cout << std::to_string(ntohs(get_port((struct sockaddr *)&their_addr))).c_str() << "\n";

	if ((rv2 = getaddrinfo(inet_ntop(their_addr.ss_family,
									 get_in_addr((struct sockaddr *)&their_addr),
									 s, sizeof s),
						   std::to_string(ntohs(get_port((struct sockaddr *)&their_addr))).c_str(), &hints2, &servinfo2)) != 0)
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

	while (true)
	{
		std::string message;
		std::cin >> message;
		std::cout << message << " " << message.size() << "\n";
		if ((numbytes = sendto(sockfd, (void *)message.c_str(), message.size() + 1, 0,
							   p2->ai_addr, p2->ai_addrlen)) == -1)
		{
			perror("talker: sendto");
			exit(1);
		}
		std::cout << "sendto bytes:" << numbytes << "\n";
	}
}

int main(int argc, char *argv[])
{
	struct addrinfo hints, *servinfo, *p;
	int rv;
	int numbytes;
	char buf[MAXBUFLEN];
	socklen_t addr_len;
	int is_thread_created = 0;

	if (argc != 2)
	{
		fprintf(stderr, "usage: talker hostname message\n");
		exit(1);
	}

	memset(&hints, 0, sizeof hints);
	hints.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints.ai_socktype = SOCK_DGRAM;
	hints.ai_flags = AI_PASSIVE; // use my IP

	if ((rv = getaddrinfo(NULL, argv[1], &hints, &servinfo)) != 0)
	{
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
		return 1;
	}

	// loop through all the results and bind to the first we can
	for (p = servinfo; p != NULL; p = p->ai_next)
	{
		if ((sockfd = socket(p->ai_family, p->ai_socktype,
							 p->ai_protocol)) == -1)
		{
			perror("listener: socket");
			continue;
		}

		if (bind(sockfd, p->ai_addr, p->ai_addrlen) == -1)
		{
			close(sockfd);
			perror("listener: bind");
			continue;
		}

		break;
	}

	if (p == NULL)
	{
		fprintf(stderr, "listener: failed to bind socket\n");
		return 2;
	}

	printf("listener: waiting to recvfrom...\n");

	while (true)
	{
		addr_len = sizeof their_addr;
		if ((numbytes = recvfrom(sockfd, buf, MAXBUFLEN - 1, 0,
								 (struct sockaddr *)&their_addr, &addr_len)) == -1)
		{
			perror("recvfrom");
			exit(1);
		}

		printf("listener: got packet from %s\n",
			   inet_ntop(their_addr.ss_family,
						 get_in_addr((struct sockaddr *)&their_addr),
						 s, sizeof s));
		// std::cout << "Port:" << inet_ntop(their_addr.ss_family, get_port((struct sockaddr *)&their_addr), s, sizeof s) << "\n";
		std::cout << "Port:" << ntohs(get_port((struct sockaddr *)&their_addr)) << "\n";
		printf("listener: packet is %d bytes long\n", numbytes);
		buf[numbytes] = '\0';
		printf("listener: packet contains \"%s\"\n", buf);

		if (!is_thread_created)
		{
			is_thread_created = 1;
			std::thread t1(thread1);
			t1.detach();
		}
	}

	freeaddrinfo(servinfo);

	close(sockfd);

	return 0;
}