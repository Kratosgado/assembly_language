; using logical or

section .bss
    result resb 1

section .text
    global _start
_start:
    mov al, 7   ; get 5 in al
    mov bl, 5   ; get 3 in bl
    or al, bl   ; or al and bl registers, result should be 7
    add al, byte '0' ; convert to ascii
    mov [result], al 
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h

outprog:
    mov eax, 1
    int 80h

