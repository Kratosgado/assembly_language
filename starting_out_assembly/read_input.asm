;code to read a number from the keyboard and display it

section .bss    ; uninitialized data
    num resb 5
section .text   ; code segment
    global _start
_start:
    ;user prompt
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, userMsg    ; the prompt
    mov edx, lenUserMsg ; prompt length
    int 80h             ; call kernel

    ; read and store the user input
    mov eax,3       ; sys_read
    mov ebx, 2      
    mov ecx, num    ; store input to num
    mov edx, 5      ; 5 bytes (numberic, 1 for sign) of that information
    int 80h         ; call kernel

    ;output the message 'the entered number is: '
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, dispMsg   ; message    
    mov edx, lenDispMsg ;message length
    int 80h         ; call kernel

    ; output the number entered
    mov eax, 4  ; sys_write
    mov ebx, 0  
    mov ecx, num
    mov edx, 5
    int 80h

    ; exit code
    mov eax, 1  ; sys_exit
    mov ebx, 0
    int 80h

section .data ; Data segment
    userMsg db 'Please enter a number: ' ; ask the user to enter a number
    lenUserMsg equ $ - userMsg           ; length of message
    dispMsg db 'You have entered: '
    lenDispMsg equ $ - dispMsg
