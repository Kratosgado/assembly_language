; program that adds two numbers

section .text
    global _start     ; must be declared for linker ld
_start:
    mov eax, '3'
    sub eax, '0'
    mov ebx, '4'
    sub eax, '0'
    add eax, ebx
    add eax, '0'
    mov [sum], eax
    mov ecx, msg
    mov edx, len
    mov ebx, 1      ; stdout
    mov eax, 4      ; system write
    int 80h

    mov ecx, sum
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    int 80h

section .data
    msg db "The sum is: "
    len equ $-msg
section .bss
    sum resb 1