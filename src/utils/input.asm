[bits 64]

%macro _KeyDown 1
    mov rcx, %1
    call IsKeyDown
    test al, al
%endmacro

%macro _KeyPressed 1
    mov rcx, %1
    call IsKeyPressed
    test al, al
%endmacro

%include "include/raylib.asm"

section .data
speed: dd 200.0
accum_x: dd 0.0
accum_y: dd 0.0

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

mvxsub:
    sub rsp, 40
    call GetFrameTime
    mulss xmm0, [rel speed]

    movss xmm1, [rel accum_x]
    subss xmm1, xmm0
    movss [rel accum_x], xmm1

    cvttss2si rax, xmm1
    cmp rax, 0
    jge .done

    add [rel x], rax

    cvtsi2ss xmm0, rax
    subss xmm1, xmm0
    movss [rel accum_x], xmm1

.done:
    add rsp, 40
    ret

mvxadd:
    sub rsp, 40
    call GetFrameTime
    mulss xmm0, [rel speed]

    movss xmm1, [rel accum_x]
    addss xmm1, xmm0
    movss [rel accum_x], xmm1

    cvttss2si rax, xmm1
    cmp rax, 0
    jle .done

    add [rel x], rax

    cvtsi2ss xmm0, rax
    subss xmm1, xmm0
    movss [rel accum_x], xmm1

.done:
    add rsp, 40
    ret

mvysub:
    sub rsp, 40
    call GetFrameTime
    mulss xmm0, [rel speed]

    movss xmm1, [rel accum_y]
    subss xmm1, xmm0
    movss [rel accum_y], xmm1

    cvttss2si rax, xmm1
    cmp rax, 0
    jge .done

    add [rel y], rax

    cvtsi2ss xmm0, rax
    subss xmm1, xmm0
    movss [rel accum_y], xmm1

.done:
    add rsp, 40
    ret

mvyadd:
    sub rsp, 40
    call GetFrameTime
    mulss xmm0, [rel speed]

    movss xmm1, [rel accum_y]
    addss xmm1, xmm0
    movss [rel accum_y], xmm1

    cvttss2si rax, xmm1
    cmp rax, 0
    jle .done

    add [rel y], rax

    cvtsi2ss xmm0, rax
    subss xmm1, xmm0
    movss [rel accum_y], xmm1

.done:
    add rsp, 40
    ret

fscreen:
    _KeyPressed 300 ; KEY_F11 = 300
    jz done

    call ToggleBorderlessWindowed
    ret

mvup:
    _KeyDown 87 ; KEY_W = 87
    jz done
    
    call mvysub
    ret

mvdn:
    _KeyDown 83 ; KEY_S = 83
    jz done

    call mvyadd
    ret

mvlt:
    _KeyDown 65 ; KEY_A = 65
    jz done

    call mvxsub
    ret

mvrt:
    _KeyDown 68 ; KEY_D = 68
    jz done

    call mvxadd
    ret

done:
    ret