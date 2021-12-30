#ifndef PACKET_H
#define PACKET_H

struct packet
{
	char payload[8] = {0};
	int checksum = 0;
	int ack = 0;
	long seq_number = 0;
	int time = 0;
	int finished = 0;
	int calc_checksum()
	{
		checksum = 0;
		for (int i = 0; i < 8; i++)
		{
			checksum += i * payload[i];
		}
		return checksum;
	}
};

#endif