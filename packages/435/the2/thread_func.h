#ifndef THREAD_FUNC_H
#define THREAD_FUNC_H

#include <thread>
#include <mutex>
#include <vector>
#include <iostream>
#include <cstring>
#include <chrono>
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

#include "packet.h"
#define WINDOW_SIZE 8

// int window[2 * WINDOW_SIZE] = {0};

extern int buffer_number;
extern int is_first_rcv;

long sequence_number = 0;
long server_window_start = 0;
long client_window_start = 0;

std::mutex m1;
std::vector<packet *> buf_client;
std::vector<packet *> buf_server;

struct addrinfo hints, *servinfo, *p;
int rv;
int rv2;
struct addrinfo hints2, *servinfo2, *p2;

struct sockaddr_storage addr;
int numbytes;
int sockfd, sockfd2;
char s[INET_ADDRSTRLEN];

void *get_in_addr(struct sockaddr *sa)
{
	return &(((struct sockaddr_in *)sa)->sin_addr);
}

unsigned short int get_port(struct sockaddr *sa)
{
	return (((struct sockaddr_in *)sa)->sin_port);
}

int sender()
{
	while (true)
	{
		std::this_thread::sleep_for(std::chrono::milliseconds(500));
		m1.lock();
		long i = buffer_number == 1 ? client_window_start : server_window_start;
		std::cout << "Window start: " << i << "\n";
		long first_i = i;
		size_t size = buffer_number == 1 ? buf_client.size() : buf_server.size();
		for (; i < (WINDOW_SIZE + first_i) && i < size; i++)
		{
			struct packet *tmp = buffer_number == 1 ? buf_client[i] : buf_server[i];
			if (tmp != NULL && tmp->finished != 1)
			{
				std::cout << "Package sent seq. no: " << tmp->seq_number << " Ack: " << tmp->ack << "\n";
				if ((numbytes = sendto(sockfd, (void *)tmp, sizeof(struct packet), 0,
									   p2->ai_addr, p2->ai_addrlen)) == -1)
				{
					perror("talker: sendto");
					exit(1);
				}
				std::cout << "sendto bytes:" << numbytes << "\n";
			}
		}
		m1.unlock();
	}
}

void listener()
{
	std::cout << "Thread started to work "
			  << "\n";

	while (true)
	{
		socklen_t addr_len = sizeof addr;
		struct packet *tmp = new packet();
		if ((numbytes = recvfrom(sockfd, (void *)tmp, sizeof(struct packet), 0,
								 (struct sockaddr *)&addr, &addr_len)) == -1)
		{
			perror("recvfrom");
			exit(1);
		}

		int tmp_checksum = tmp->checksum;
		if (numbytes != sizeof(struct packet))
		{
			continue;
		}

		if (tmp_checksum != tmp->calc_checksum())
		{
			continue;
		}

		if (tmp->seq_number < 0)
		{
			continue;
		}
		m1.lock();
		if (tmp->ack >= 1)
		{
			std::cout << "Sequence n: " << tmp->seq_number << " Ack: " << tmp->ack << "\n";
			if (tmp->seq_number >= (client_window_start + WINDOW_SIZE))
			{
				continue;
			}
			std::cout << "Buf_client size " << buf_client.size() << " Seq number " << tmp->seq_number << "\n";
			// buf_client.resize(2 * client_window_start + 1, NULL);
			buf_client[tmp->seq_number]->finished = 1;

			for (int i = client_window_start; i < buf_client.size(); i++)
			{
				if (buf_client[i] == NULL)
				{
					break;
				}
				if (buf_client[i]->finished == 1)
				{
					client_window_start++;
					continue;
				}
				break;
			}
		}

		if (tmp->ack == 0)
		{
			std::cout << "New packet seq:" << tmp->seq_number << "\n";
			if (tmp->seq_number >= (server_window_start + WINDOW_SIZE))
			{
				continue;
			}
			std::cout << "Buf_client size " << buf_server.size() << " Seq number " << tmp->seq_number << "\n";

			buf_server.resize(2 * server_window_start + 1, NULL);
			buf_server[tmp->seq_number] = tmp;

			for (int i = server_window_start; i < buf_server.size(); i++)
			{
				if (buf_server[i] == NULL)
				{
					break;
				}
				if (buf_server[i]->finished == 1)
				{
					server_window_start++;
					continue;
				}
				break;
			}

			std::cout << "temp ack: " << tmp->ack << "\n";
			struct packet *ack_package = new packet;
			ack_package->ack = 1;
			strcpy(ack_package->payload, tmp->payload);
			ack_package->seq_number = tmp->seq_number;
			ack_package->calc_checksum();
			if ((numbytes = sendto(sockfd, (void *)ack_package, sizeof(struct packet), 0,
								   p2->ai_addr, p2->ai_addrlen)) == -1)
			{
				perror("talker: sendto");
				exit(1);
			}
			std::cout << "sendto bytes:" << numbytes << "\n";
		}
		m1.unlock();

		printf("listener: got packet from %s\n",
			   inet_ntop(addr.ss_family,
						 get_in_addr((struct sockaddr *)&addr),
						 s, sizeof s));
		// std::cout << "Port:" << inet_ntop(their_addr.ss_family, get_port((struct sockaddr *)&their_addr), s, sizeof s) << "\n";
		std::cout << "Port:" << ntohs(get_port((struct sockaddr *)&addr)) << "\n";
		printf("listener: packet is %d bytes long\n", numbytes);
		printf("listener: packet contains \"%s\"\n", tmp->payload);
	}
}

void input_thread()
{
	while (true)
	{
		std::string message;
		std::cin >> message;
		for (int i = 0; i < message.size(); i += 7)
		{
			struct packet *tmp = new packet();
			strcpy(tmp->payload, message.substr(0, 7).c_str());
			tmp->calc_checksum();
			tmp->seq_number = sequence_number++;
			m1.lock();
			if (buffer_number == 1)
			{
				buf_client.push_back(tmp);
			}
			else
			{
				buf_server.push_back(tmp);
			}
			m1.unlock();
		}
		std::cout << message << " " << message.size() << "\n";
	}
}

int create_socket()
{
	int numbytes;
	std::cout << "Thread started to work " << ntohs(get_port((struct sockaddr *)&addr)) << "\n";

	memset(&hints2, 0, sizeof hints2);
	hints2.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints2.ai_socktype = SOCK_DGRAM;

	std::cout << std::to_string(ntohs(get_port((struct sockaddr *)&addr))).c_str() << "\n";

	if ((rv2 = getaddrinfo(inet_ntop(addr.ss_family,
									 get_in_addr((struct sockaddr *)&addr),
									 s, sizeof s),
						   std::to_string(ntohs(get_port((struct sockaddr *)&addr))).c_str(), &hints2, &servinfo2)) != 0)
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

	return 0;
}

#endif