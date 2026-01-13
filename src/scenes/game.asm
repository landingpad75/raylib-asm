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
    sub rsp, 40

    mov ecx, [rel x]
    mov edx, [rel y]
    mov r8d, 50
    mov r9d, 50

    mov eax, [rel RED]
    mov [rsp + 32], eax

    call DrawRectangle
    add rsp, 40
    ret


GameScene_UPDATE:
    call mvup
    call mvdn
    call mvlt
    call mvrt
    ret