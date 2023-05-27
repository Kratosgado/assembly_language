section .data
    hello db 'hello', 0xa
    len equ $-hello

section .text
    global _start
_start:
    jmp check

    mov eax, 1
    int 80h

lp1:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, len
    int 80h

    jmp check

check:
    inc edx,
    cmp edx, 10
    jle lp1

    mov eax, 1
    int 80h