section .data
    hello db 'Hello, World!', 0x0a

section .text
    global _start

_start:
    ; Write the string to stdout
    mov eax, 4              ; Syscall number for write
    mov ebx, 2              ; File descriptor (stdout)
    mov ecx, hello          ; Address of the string
    mov edx, 14             ; Length of the string
    int 0x80                ; Call the kernel

    ; Exit the program
    mov eax, 1              ; Syscall number for exit
    xor ebx, ebx            ; Exit status (0)
    int 0x80                ; Call the kernel
