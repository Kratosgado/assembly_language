section .text
    global _start        ; for linker
_start:         ; entry point
    mov ax, 8h  ; get 9 in hex
    and ax, 1   ; check if least significant bit is 1
    jz evnn     ; conditionally jump if zero flag is set
    mov eax, 4  ; system write
    mov ebx, 1  ; stdout
    mov ecx, odd_msg
    mov edx, len2
    int 0x80
    jmp outprog

evnn: 
    mov ah, 09h
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, len1
    int 0x80
outprog:
    mov eax, 1
    int 0x80

section .data
    even_msg db 'Even Number!', 0xa
    len1 equ $-even_msg
    odd_msg db 'Odd Number', 0xa
    len2 equ $-odd_msg