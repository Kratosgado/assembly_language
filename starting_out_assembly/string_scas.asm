section .data
    my_string db 'hello world', 0
    len equ $-my_string
    msg_found db 'found', 0xa
    len_f equ $- msg_found
    msg_nfound db 'not found', 0xa
    len_nf equ $-msg_nfound

section .text
    global _start
_start:
    mov ecx, len
    mov edi, my_string
    mov al, 'e'
    cld
    repne scasb
    je found    ; when found
    ; else
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_nfound
    mov edx, len_nf
    int 80h
    jmp exit

found:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_found
    mov edx, len_f
    int 80h
exit: 
    mov eax, 1
    mov ebx, 0
    int 80h