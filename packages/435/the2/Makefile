all: server client

server: server.c
	gcc -O3 -o server server.c

client: client.c
	gcc -O3 -o client client.c

clean:
	rm -rf *.o server client