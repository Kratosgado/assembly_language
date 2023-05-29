; this program loops 9 times and prints 1 - 9
; new keywords: push, pop, loop

section .text
    global _start
_start:         ; entry point
    mov ecx, 9  ; number of loops
    mov eax, '1'    ; initialize counter

loop1:          ; loop to be executed
    mov [num], eax     ; store value of eax in num

    ; write current number
    mov eax, 4         
    mov ebx, 1
    push ecx
    mov ecx, num
    mov edx, 1
    int 0x80

    mov eax, [num] ; get current number
    sub eax, '0'    ; convert to decimal
    inc eax         ; increment number by 1
    add eax, '0'    ; convert to ASCII
    pop ecx         ; decrease loop counter
    loop loop1      ; run loop again while ecx > 0

; move to newline after loop
nwln:
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 80h
    
    ; exit the program
    mov eax, 1
    int 0x80

section .bss
    num resb 1
section .data
    nl db 0xa