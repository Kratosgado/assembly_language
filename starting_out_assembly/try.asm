section .bss
    input resb 5
section .text
    global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, promptLen
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 5
    int 80h

    mov eax, 4
    mov ebx, 0
    mov ecx, input
    mov edx, 5
    int 80h

    mov eax, 1
    int 80h

section .data
prompt db 'Enter your name: '
promptLen equ $ - prompt