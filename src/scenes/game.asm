[bits 64]

%include "include/raylib.asm"
%include "include/input.asm"

section .data
%include "include/colors.asm"
extern x
extern y

section .text
global GameScene_DRAW
global GameScene_UPDATE

GameScene_DRAW:
    sub rsp, 40 ; set up the stack

    mov ecx, [rel x] ; int x
    mov edx, [rel y] ; int y
    mov r8d, 50 ; int w
    mov r9d, 50 ; int h

    mov eax, [rel RED]
    mov [rsp + 32], eax ; Color color

    call DrawRectangle ; DrawRectangle(x, y, w, h, color)
    add rsp, 40 ; clear stack
    ret


GameScene_UPDATE:
    ; call movement condition functions
    call mvup
    call mvdn
    call mvlt
    call mvrt
    ret