/*
** talker.c -- a datagram "client" demo
*/

#include "packet.h"
#include "thread_func.h"

// socklen_t addr_len;

int buffer_number = 1;

int is_first_rcv = 0; // dummy variable to please compiler

int main(int argc, char *argv[])
{
	if (argc != 4)
	{
		fprintf(stderr, "usage: talker hostname message\n");
		exit(1);
	}

	memset(&hints, 0, sizeof hints);
	hints.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints.ai_socktype = SOCK_DGRAM;
	// std::cout << argv[2] << " " << argv[3] << "\n";

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

		addr.ss_family = p2->ai_addr->sa_family;

		break;
	}

	if (p == NULL || p2 == NULL)
	{
		fprintf(stderr, "talker: failed to create socket\n");
		return 2;
	}
	std::thread t4(printer);
	std::thread t2(input_thread);
	t2.detach();
	t4.detach();

	std::thread t1(listener);
	std::thread t3(sender);
	t1.join();
	t3.join();

	freeaddrinfo(servinfo);

	// printf("talker: sent %d bytes to %s\n", numbytes, argv[1]);
	close(sockfd);

	return 0;
}