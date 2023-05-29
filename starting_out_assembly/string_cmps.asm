; this program compares two strings
; prints equal when they are, else, not equal

section .data
    ; Define the first string
    s1 db 'Hello, world', 0
    lens1 equ $-s1

    ; Define the second string
    s2 db 'Hello, there', 0
    lens2 equ $-s2

    ; Define the messages for equal and not equal strings
    msg_eq db 'Strings are equal', 0xa
    len_eq equ $-msg_eq
    msg_neq db 'Strings are not equal', 0xa
    len_msg_neq equ $-msg_neq

section .text
    global _start
_start:
    ; Load the starting address of s1 into esi
    mov esi, s1

    ; Load the starting address of s2 into edi
    mov edi, s2

    ; Load the length of s2 into ecx (used as loop counter)
    mov ecx, lens2

    ; Clear the direction flag (ensure forward string operations)
    cld

    ; Compare bytes at [esi] and [edi], repeat until ecx is zero or a mismatch is found
    repe cmpsb

    ; If ecx is zero (end of both strings reached), jump to equal
    jecxz equal

    ; Else, print "Strings are not equal" message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_neq
    mov edx, len_msg_neq
    int 80h

    ; Jump to exit
    jmp exit

equal:
    ; Print "Strings are equal" message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_eq
    mov edx, len_eq
    int 80h

exit:
    ; Exit the program
    mov eax, 1
    mov ebx, 0
    int 80h
