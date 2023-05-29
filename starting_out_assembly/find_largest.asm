; the program displays the largest of three variables
; the variables asre double-digit variables

section .data
    msg db "The largest digit is: " ; caption
    len equ $-msg       ; caption length

    ; initialize variables
    num1 dd '32'       
    num2 dd '24'
    num3 dd '22'
    nl db 10        ; for newline

section .bss
    largest resb 2  ; reserve a memory to store largest number

section .text
    global _start       ; for linker    
_start:                 ; entry point
    mov ecx, [num1]     ; store num1 in ecx register
    cmp ecx, [num2]     ; comapare num1 to num2
    jg check_third_num  ; jump to check_third if num1 greater than num2
    mov ecx, [num2]     ; else override num2 on num1 in ecx register

check_third_num:        
    cmp ecx, [num3]     ; compare the highest number from the last check to num3
    jg assign_largest   ; jump to assign_largest if value in ecx > num3
    mov ecx, [num3]     ; else override num3 on the value

assign_largest:
    mov [largest], dword ecx    ; store the largest number to the variable

    ; display the caption
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; display the largest number
    mov ecx, largest
    mov edx, 2
    mov ebx, 1
    mov eax, 4
    int 0x80

nwln:       ; move cursor to newline
    mov ecx, nl
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

exit:       ; exit the program
    mov eax, 1
    int 80h