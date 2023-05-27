; program that divides two numbers
section .data
    prompt db 'The sum is: '
    len equ $-prompt

section .bss
    res resb 1

section .text
    global _start
_start:
    mov ax, '4'
    sub ax, '0' ; convert to decimal
    mov bl, '2'
    sub bl, '0' ; convrt to decimal
    div bl
    add ax, '0' ; convert back to ASCII

    mov [res], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 80h

    mov eax, 1
    int 80h