all: server client

server: server.c
	g++ -O3 -o server -pthread  server.cpp

client: client.c
	g++ -O3 -o client -pthread  client.cpp

clean:
	rm -rf *.o server client