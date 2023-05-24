section .text
    global _start   ; must be declared for linker (ld)
_start:     ; tell linker entry point
    ; writing the name 'Zara Ali'
    mov edx, 9  ; name length
    mov ecx, name   ; name to write
    mov ebx, 1      ; file descriptor (stdout)
    mov eax, 4      ; sys_write
    int 0x80        ; call kernel

    ; writing the name 'Nuha Ali'
    mov edx, 8   ; name length
    mov ecx, name   ; name to write
    mov ebx, 1      ; stdout
    mov eax, 4      ; sys_write
    int 0x80        ; call kernel

    ; exit program
    mov eax, 1     ; sys_exit
    xor ebx, ebx   ; exit status (0)
    int 0x80       ; call kernel

section .data
name db 'Zara Ali',0  ; initialize the name with null terminator
