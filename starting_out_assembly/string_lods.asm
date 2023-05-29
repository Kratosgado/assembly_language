; the method encrypt the string password by
; moving each letter to the next 2 letter in 
; alphabets, a = c, b = d, p = r

section .data
    s1 db 'password', 0         ; source
    len equ $-s1
section .bss
    s2 resb 10          ; destination or encrypted string

section .text
    global _start
_start:
    mov ecx, len        ; loop through the length of the string
    mov esi, s1         ; source byte to encrypt
    mov edi, s2         ; destination of byte encrypted

loop_here:
    lodsb       ; load byte from esi: source byte- stores in al
    add al, 02  ; move current letter to the next 2
    stosb       ; copy encrypted letter to edi: destination byte - copies form al
    loop loop_here  ; loop for all the byte
    cld         ; clear direction flag
    rep movsb   ; move byte to destination string

    ; display encrypted string
    mov edx, 20
    mov ecx, s2
    mov ebx, 1
    mov eax, 4
    int 80h

    ; exit
    mov eax,1
    int 80h