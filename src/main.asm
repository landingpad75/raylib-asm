[bits 64]

global main

%include "include/raylibasm.asm"

section .text
main:
    sub rsp, 40

    mov rcx, 800
    mov rdx, 600
    lea r8, [rel windowName]

    call InitWindow

    mov rcx, 60
    call SetTargetFPS

.loop:
    call WindowShouldClose 
    test al, al
    jnz .end

    call mvup
    call mvdn
    call mvlt
    call mvrt
    call fscreen

    call BeginDrawing

    mov rcx, [rel BLACK] ; this should be black
    call ClearBackground

    mov rcx, [rel x]
    mov rdx, [rel y]
    mov r8d, 50
    mov r9d, 50

    mov rax, [rel RED]
    mov [rsp + 32], rax

    call DrawRectangle

    mov rcx, 20
    mov rdx, 20

    call DrawFPS

    call EndDrawing

    jmp .loop
.end:
    call CloseWindow
    add rsp, 40

spawnTriangle: ; maybe some enemies?
    ret

section .data
global x
global y

currentScreen: db 0 ; max would be 255 screens, too many so nothign to worry about

windowName: db "raysm :)", 0
gotInput: db "Got input!", 10
x: dq 0
y: dq 0