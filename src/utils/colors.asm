[bits 64]

global RED
global BLACK
global WHITE
global BLUE
global GREEN
global YELLOW
global SKYBLUE

section .data

RED: db 255, 0, 0, 255
BLACK: db 0, 0, 0, 255
WHITE: db 255, 255, 255, 255
BLUE: db 0, 0, 255, 255
GREEN: db 0, 255, 0, 255
YELLOW: db 0xff, 0xff, 0x8f, 255
SKYBLUE: db 49h, 0xce, 0xeb, 255
