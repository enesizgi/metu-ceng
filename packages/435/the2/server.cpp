/*
** listener.c -- a datagram sockets "server" demo
*/
#include <future>

#include "packet.h"
#include "thread_func.h"

int is_first_rcv = 0;

int buffer_number = 2;

int main(int argc, char *argv[])
{
	socklen_t addr_len;

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

	while (true)
	{
		addr_len = sizeof addr;
		struct packet *tmp = new packet();
		if ((numbytes = recvfrom(sockfd, (void *)tmp, sizeof(struct packet), 0,
														 (struct sockaddr *)&addr, &addr_len)) == -1)
		{
			perror("recvfrom");
			exit(1);
		}

		if (is_first_rcv == 0)
		{
			std::thread t1(sender);
			t1.detach();

			std::thread t2(input_thread);
			t2.detach();

			std::thread t4(printer);
			t4.detach();

			std::thread t3(create_socket);
			t3.join();
		}

		is_first_rcv = 1;

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

		if (tmp->ack >= 1)
		{
			if (tmp->seq_number >= (server_window_start + WINDOW_SIZE))
			{
				continue;
			}
			if (tmp->seq_number + 1 > buf_server.size())
			{
				buf_server.resize(tmp->seq_number * 2 + 1, NULL);
			}
			buf_server[tmp->seq_number]->finished = 1;

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
		}

		if (tmp->ack == 0)
		{
			if (tmp->seq_number >= (client_window_start + WINDOW_SIZE))
			{
				continue;
			}
			if (tmp->seq_number + 1 > buf_client.size())
			{
				buf_client.resize(tmp->seq_number * 2 + 1, NULL);
				is_printed.resize(tmp->seq_number * 2 + 1, false);
			}
			buf_client[tmp->seq_number] = tmp;
			tmp->finished = 1;
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
	}

	freeaddrinfo(servinfo);

	close(sockfd);

	return 0;
}