section .data
choice db 'y', 0xa
write equ 4
stdout equ 1
exit equ 1
kernel equ 0x80

section .text
    global _start   ; must be declared for linker
_start:   ; tell linker entry point
    mov edx, 2   ; length
    mov ecx, choice     ; message
    mov ebx, stdout      ; stdout
    mov eax, write      ; sys_write
    int kernel

    mov eax, exit      ; sys_exit
    int kernel        ; call kernel

