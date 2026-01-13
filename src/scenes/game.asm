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
    mov rcx, [rel x]
    mov rdx, [rel y]
    mov r8d, 50
    mov r9d, 50

    mov rax, [rel RED]
    mov [rsp + 32], rax

    call DrawRectangle
    ret


GameScene_UPDATE:
    call mvup
    call mvdn
    call mvlt
    call mvrt
    ret