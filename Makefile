CFLAGS=-Wall -Wpedantic $(shell sdl2-config --cflags) -g
LIBRARIES=$(shell sdl2-config --libs) -lm -lGL

.DEFAULT_GOAL := all

christmas_tree.o: christmas_tree.c shader.c spiral.c
	gcc $(CFLAGS) -c -o $@ $<

christmas_tree: christmas_tree.o shader.o spiral.o
	gcc -o $@ $^ $(LIBRARIES)

all: christmas_tree

clean:
	rm -f *.o christmas_tree || true