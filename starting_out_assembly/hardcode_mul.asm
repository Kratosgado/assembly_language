section .data
    prompt db 'The sum is: '
    len equ $-prompt

section .bss
    res resb 1

section .text
    global _start
_start:
    mov al, '4'
    sub al, '0' ; convert to ASCII
    mov bl, '2'
    sub bl, '0' ; convrt to ASCII
    mul bl
    add al, '0' ; convert back from ASCII

    mov [res], al

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