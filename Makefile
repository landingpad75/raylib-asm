.PHONY: all game

all: mkfiles game

mkfiles:
	mkdir -p build
	mkdir -p build/utils 
	mkdir -p build/scenes 

run:
	.\build\game.exe

game: build/main.o build/utils/input.o build/scenes/game.o
	gcc -g build/main.o build/utils/colors.o build/utils/input.o build/scenes/game.o -o build/game.exe -Llib -lraylib -lwinmm -lgdi32

build/main.o: src/main.asm include/raylib.asm
	nasm src/main.asm -o build/main.o -fwin64

build/utils/input.o: src/utils/input.asm include/input.asm
	nasm src/utils/input.asm -o build/utils/input.o -fwin64

build/scenes/game.o: src/scenes/game.asm include/scenes.asm
	nasm src/scenes/game.asm -o build/scenes/game.o -fwin64