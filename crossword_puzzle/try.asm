section .data
    s1 db 'Hello'
    lens1 equ $-s1
    ne db 'world'
    lenw equ $ -ne
    prompt db 'Enter a string: ', 0
    len_prompt equ $-prompt
    msg_eq db 'Strings are equal', 0xa
    len_eq equ $-msg_eq
    msg_neq db 'Strings are not equal', 0xa
    len_msg_neq equ $-msg_neq

section .bss
    s2 resb 32

section .text
    global _start

_start:
    ; Print prompt to enter a string
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov edx, len_prompt
    syscall

    ; Read string from user
    mov rax, 0
    mov rdi, 0
    mov rsi, s2
    mov rdx, 32
    syscall

    ; Compare strings s1 and s2
    mov rsi, s1
    mov rdi, s2
    mov rcx, lens1
    cld
    repe cmpsb

    ; If rcx is zero (end of both strings reached), jump to equal
    je equal

    ; Compare strings s1 and s2
    mov rsi, ne
    mov rdi, s2
    mov rcx, lenw
    cld
    repe cmpsb

    ; If rcx is zero (end of both strings reached), jump to equal
    je equal

    ; Else, print "Strings are not equal" message
    mov rax, 1
    mov edi, 1
    mov rsi, msg_neq
    mov rax, len_msg_neq
    syscall

    ; Exit the program
    mov rax, 60
    xor edi, edi
    syscall

equal:
    ; Print "Strings are equal" message
    mov rax, 1
    mov edi, 1
    mov rsi, msg_eq
    mov rdx, len_eq
    syscall

    ; Exit the program
    mov rax, 60
    xor edi, edi
    syscall
