all: server client

server: server.c thread_func.h packet.h
	g++ -O3 -o server -pthread  server.cpp

client: client.c thread_func.h packet.h
	g++ -O3 -o client -pthread  client.cpp

clean:
	rm -rf *.o server client