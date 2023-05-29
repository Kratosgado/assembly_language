; this program copies the string in s1 to s2
; making use of the movsb - movs byte and
; rep - repetition

section .data
    s1 db 'Hello World', 10     ; source of string
    len equ $-s1
section .bss
    s2 resb 20          ; destination

section .text
    global _start
_start:
    mov ecx, len        ; numbers of loop, loop  through the length
    mov esi, s1         ; copying byte from
    mov edi, s2         ; copying byte to
    cld   ; clear direction flag, DF = 0: makes operation left to right
    rep movsb           ; perform copy, and repeat above action for the next byte until ecx = 0,

    ; display s2 after copying
    mov edx, 20
    mov ecx, s2
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit
    mov eax, 1
    int 80h