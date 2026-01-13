[bits 64]

%macro _KeyDown 1
    mov rcx, %1
    call IsKeyDown
    test al, al
%endmacro

%include "include/raylib.asm"

section .text

global mvxsub
global mvxadd
global mvysub
global mvyadd
global mvup
global mvdn
global mvlt
global mvrt
global fscreen

extern x
extern y

speed equ 5

; mvsub, takes rax as input1, value goes back to rax + x variable
mvxsub:
    push rax
    
    mov rax, [rel x]
    sub rax, speed 
    mov [rel x], rax
    
    pop rax
    ret
; mvadd, takes rax as input1, value goes back to rax + x variable
mvxadd:
    push rax

    mov rax, [rel x]
    add rax, speed
    mov [rel x], rax
    
    pop rax
    ret
; mvsub, takes rax as input1, value goes back to rax + y variable
mvysub:
    push rax

    mov rax, [rel y]
    sub rax, speed
    mov [rel y], rax

    pop rax
    ret
; mvadd, takes rax as input1, value goes back to rax + y variable
mvyadd:
    mov rax, [rel y]
    add rax, speed
    mov [rel y], rax

    pop rax
    ret

fscreen:
    _KeyDown 300
    jz done

    call ToggleBorderlessWindowed
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