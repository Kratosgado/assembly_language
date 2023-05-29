section .data
    first db 'HELLO, WORLD',0
    len equ $-first

section .bss
    second resb 20

section .text
    global _start
_start:
    mov ecx, len
    mov esi, first
    mov edi, second

loop_here:
    lodsb
    or al, 20h
    stosb
    loop loop_here
    cld
    rep movsb
    mov edx, 20
    mov ecx, second
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    int 80h