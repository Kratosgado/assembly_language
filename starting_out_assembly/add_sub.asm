; this program receives 2 numbers from the user
; and display their sum

; define the constants for system calls
SYS_EXIT EQU 1
SYS_READ EQU 3
SYS_WRITE EQU 4
STDIN EQU 0
STDOUT EQU 1
STDERR EQU 2

section .data 
    msg1 db 'Enter a digit: '   ; first prompt
    len1 equ $-msg1     ; its length

    msg2 db "Please enter a second digit: " ; second prompt
    len2 equ $-msg2     ; its length

    msg3 db "The sum is : "     ; result prompt
    len3 equ $-msg3     ; its length

section .bss
    num1 resb 2         ; reserve 2 byte for first number
    num2 resb 2         ; same for second number
    res resb 2          ; reserve for result

section .text
    global _start       ; for linker
_start:
    ; display first prompt
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; read first number
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; display second prompt
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; read second number
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; display result prompt
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; moving the first number to eax register and second number to ebx
    ; and subtracting ascii '0' to convert it into a decimal number
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'

    ; add eax and ebx
    add eax, ebx
    ; add '0'  to convert the sum from decimal to ASCII
    add eax, '0'

    ; storing the sum in memory location res
    mov [res], eax

    ; print the sum
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 2
    int 0x80

; exit the program
exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80