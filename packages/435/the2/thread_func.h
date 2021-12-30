#ifndef THREAD_FUNC_H
#define THREAD_FUNC_H

#include <thread>
#include <mutex>
#include <vector>
#include <iostream>
#include <cstring>
#include <chrono>
#include <future>
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

extern int buffer_number;
extern int is_first_rcv;

long next_to_print = 0;

long sequence_number = 0;
long server_window_start = 0;
long client_window_start = 0;

std::mutex m1;
std::vector<packet *> buf_client;
std::vector<packet *> buf_server;

std::vector<bool> is_printed;

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

// For sending packets, it sends every non-acked packet in window every 500 ms
int sender()
{
	while (true)
	{
		std::this_thread::sleep_for(std::chrono::milliseconds(500));
		m1.lock();
		long i = buffer_number == 1 ? client_window_start : server_window_start;
		long first_i = i;
		size_t size = buffer_number == 1 ? buf_client.size() : buf_server.size();
		for (; i < (WINDOW_SIZE + first_i) && i < size; i++)
		{
			struct packet *tmp = buffer_number == 1 ? buf_client[i] : buf_server[i];
			if (tmp != NULL && tmp->finished != 1)
			{
				tmp->ack = 0;
				if ((numbytes = sendto(sockfd, (void *)tmp, sizeof(struct packet), 0,
															 p2->ai_addr, p2->ai_addrlen)) == -1)
				{
					perror("talker: sendto");
					exit(1);
				}
			}
		}
		m1.unlock();
	}
}

// This thread always listens for packets and adds them to buf arrays for printing and sending ACK
void listener()
{

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
			if (tmp->seq_number >= (client_window_start + WINDOW_SIZE))
			{
				continue;
			}
			if (tmp->seq_number + 1 > buf_client.size())
			{
				buf_client.resize(tmp->seq_number * 2 + 1, NULL);
			}
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
			if (tmp->seq_number >= (server_window_start + WINDOW_SIZE))
			{
				continue;
			}

			if (tmp->seq_number + 1 > buf_server.size())
			{
				buf_server.resize(tmp->seq_number * 2 + 1, NULL);
				is_printed.resize(tmp->seq_number * 2 + 1, false);
			}
			buf_server[tmp->seq_number] = tmp;
			tmp->finished = 1;
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
		}
		m1.unlock();
	}
}

// This thread always takes input and chops the strings into 7 byte pieces.
void input_thread()
{
	while (true)
	{
		std::string message;
		std::getline(std::cin, message);
		message.append("\n");
		for (int i = 0; i < message.size(); i += 6)
		{
			struct packet *tmp = new packet();
			int j = i;
			std::string tmp_str;
			for (; j < message.size() && tmp_str.size() < 6; j++)
			{
				tmp_str.append(message.begin() + j, message.begin() + j + 1);
			}
			strcpy(tmp->payload, tmp_str.c_str());
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
	}
}

// This thread is for server.cpp. Creates the socket connection from server to client.
int create_socket()
{
	int numbytes;

	memset(&hints2, 0, sizeof hints2);
	hints2.ai_family = AF_INET; // set to AF_INET to use IPv4
	hints2.ai_socktype = SOCK_DGRAM;

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

// This threads print the packets with order every 500 ms.
void printer()
{
	while (true)
	{
		std::this_thread::sleep_for(std::chrono::milliseconds(500));
		m1.lock();
		std::vector<packet *> &arr = buffer_number == 2 ? buf_client : buf_server;
		long size = arr.size();
		long size_2 = is_printed.size();
		for (int i = next_to_print; i < size && i < size_2; i++)
		{
			if (arr[i] == NULL)
			{
				break;
			}
			if (!is_printed[i])
			{
				std::cout << arr[i]->payload;
				is_printed[i] = true;
				next_to_print = i + 1;
			}
		}
		m1.unlock();
	}
}

#endif