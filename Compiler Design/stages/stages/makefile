CC = gcc
CFLAGS = -Wall -g

all: main

# 1. Preprocessing
main.i: main.c
	$(CC) -E main.c -o main.i

# 2. Compilation
main.s: main.i
	$(CC) -S main.i -o main.s

# 3. Assembly
main.o: main.s
	$(CC) -c main.s -o main.o

# 4. Linking
main: main.o
	$(CC) main.o -o main

# Clean build files
clean:
	rm -f main.i main.s main.o main
