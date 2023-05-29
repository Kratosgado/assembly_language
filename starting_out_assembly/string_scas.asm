; this program searches for a letter in a string
; prints found when letter is in the string
; else not found

section .data
    my_string db 'hello world', 0        ; The string to be searched
    len equ $-my_string                 ; Length of the string
    msg_found db 'found', 0xa           ; Message displayed when the character is found
    len_f equ $-msg_found               ; Length of the "found" message
    msg_nfound db 'not found', 0xa      ; Message displayed when the character is not found
    len_nf equ $-msg_nfound             ; Length of the "not found" message

section .text
    global _start
_start:
    mov ecx, len                       ; Load the length of the string into ECX
    mov edi, my_string                 ; Load the starting address of the string into EDI
    mov al, 'e'                        ; Load the character to be searched into AL
    cld                                ; Clear the direction flag to scan the string forward
    repne scasb                        ; Search for the character in the string

    je found                           ; Jump to "found" if the character is found

    ; If the character is not found, display the "not found" message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_nfound
    mov edx, len_nf
    int 80h
    jmp exit                           ; Jump to the exit label

found:
    ; If the character is found, display the "found" message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_found
    mov edx, len_f
    int 80h

exit: 
    mov eax, 1
    mov ebx, 0
    int 80h
