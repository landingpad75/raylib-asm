[bits 64]

global main
global x
global y

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

    ; UPDATE
    call fscreen
    mov rdx, 0
    test rdx, [rel currentScreen]
    jnz .aftercscr1

    call GameScene_UPDATE
.aftercscr1:
    ; DRAW
    call BeginDrawing

    mov rcx, [rel BLACK] ; this should be black
    call ClearBackground

    mov rdx, 0
    test [rel currentScreen], rdx
    jnz .aftercscr1d ; so this does work
    
    ; void DrawRectangle(int posX, int posY, int width, int height, Color color);
    call GameScene_DRAW
.aftercscr1d:

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
currentScreen: db 0 ; max would be 255 screens, too many so nothign to worry about

windowName: db "raysm :)", 0
gotInput: db "Got input!", 10
x: dq 0
y: dq 0