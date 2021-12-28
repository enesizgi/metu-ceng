all: server client

server: server.c
	g++ -O3 -o server server.cpp

client: client.c
	g++ -O3 -o client client.cpp

clean:
	rm -rf *.o server client