.PHONY: all game

all: game

run:
	.\build\game.exe

game: build/main.o
	gcc build/main.o -o build/game.exe -Llib -lraylib -lwinmm -lgdi32

build/main.o: src/main.asm include/raylib.inc
	nasm src/main.asm -o build/main.o -fwin64