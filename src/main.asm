bits 64

global main

%macro _KeyDown 1
    mov rcx, %1
    call IsKeyDown
    test al, al
%endmacro

%include "include/raylib.inc"

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

; mvsub, takes rax as input1, value goes back to rax + x variable
mvxsub:
    push rax
    
    mov rax, [rel x]
    sub rax, [rel speed] 
    mov [rel x], rax
    
    pop rax
    ret
; mvadd, takes rax as input1, value goes back to rax + x variable
mvxadd:
    push rax

    mov rax, [rel x]
    add rax, [rel speed]
    mov [rel x], rax
    
    pop rax
    ret
; mvsub, takes rax as input1, value goes back to rax + y variable
mvysub:
    push rax

    mov rax, [rel y]
    sub rax, [rel speed]
    mov [rel y], rax

    pop rax
    ret
; mvadd, takes rax as input1, value goes back to rax + y variable
mvyadd:
    push rax

    mov rax, [rel y]
    add rax, [rel speed]
    mov [rel y], rax

    pop rax
    ret

mvup:
    _KeyDown 87
    jz done
    
    call mvysub
    ret

mvdn:
    _KeyDown 83
    jz done

    call mvyadd
    ret

mvlt:
    _KeyDown 65
    jz done

    call mvxsub
    ret

mvrt:
    _KeyDown 68
    jz done

    call mvxadd
    ret

done:
    ret

section .data

RED: db 255, 0, 0, 255
BLACK: db 0, 0, 0, 255
WHITE: db 255, 255, 255, 255
BLUE: db 0, 0, 255, 255
GREEN: db 0, 255, 0, 255
YELLOW: db 0xff, 0xff, 0x8f, 255
SKYBLUE: db 49h, 0xce, 0xeb, 255

windowName: db "raysm :)", 0
gotInput: db "Got input!", 10
x: dq 0
y: dq 0
speed: dd 5