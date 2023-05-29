; this program changes the case of first variable from upper
; to lower and stores it in the second variable

section .data
    first db 'HELLO, WORLD', 0    ; source string
    len equ $-first              ; length of the source string

section .bss
    second resb 20               ; destination buffer

section .text
    global _start

_start:
    mov ecx, len                ; number of characters to process
    mov esi, first              ; source string pointer
    mov edi, second             ; destination buffer pointer

loop_here:
    lodsb                       ; load byte from source string (increments esi)
    or al, 20h                  ; convert uppercase to lowercase
    stosb                       ; store byte to destination buffer (increments edi)
    loop loop_here              ; repeat loop until ecx is zero

    cld                         ; clear direction flag for forward string operation
    rep movsb                   ; copy remaining bytes from source to destination

    mov edx, 20                 ; maximum number of characters to display
    mov ecx, second             ; address of the destination buffer
    mov ebx, 1                  ; file descriptor for standard output
    mov eax, 4                  ; system call number for write
    int 0x80                    ; invoke system call for output

    mov eax, 1                  ; system call number for exit
    int 0x80                    ; invoke exit system call
