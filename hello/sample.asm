section .data
    hello db 'Hello, World!', 0x0a
    len equ $ - hello       ; lenth of string

section .text
    global _start

_start:
    ; Write the string to stdout
    mov rax, 1              ; Syscall number for write
    mov edi, 1              ; File descriptor (stdout)
    mov esi, hello          ; Address of the string
    mov rdx, len             ; Length of the string
    syscall                ; Call the kernel

    ; Exit the program
    mov rax, 60              ; Syscall number for exit
    syscall                ; Call the kernel