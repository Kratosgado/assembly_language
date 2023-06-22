section .data
    puzzleGrid db 'C R O S S W O R D', 0
    greetMsg db 'Welcome to Crossword Puzzle Game!', 0
    prompt db 'Enter a word guess: ', 0
    correctMsg db 'Correct guess!', 0
    wrongMsg db 'Wrong guess! Try again.', 0
    exitMsg db 'Thank you for playing! Goodbye.', 0

section .text
    global _start

_start:
    ; Display greeting message
    mov rdi, greetMsg
    call print_string

    ; Display puzzle grid
    mov rdi, puzzleGrid
    call print_string

game_loop:
    ; Display prompt and get user input
    mov rdi, prompt
    call print_string

    ; Read user input
    mov rdi, buffer
    mov rsi, 255 ; Maximum input length
    call read_string

    ; Compare user input with correct answer
    cmp byte [buffer], 'A'
    je correct_guess

    ; Display wrong guess message
    mov rdi, wrongMsg
    call print_string
    jmp game_loop

correct_guess:
    ; Display correct guess message
    mov rdi, correctMsg
    call print_string

    ; Continue game loop or exit
    jmp game_loop

exit_game:
    ; Display exit message
    mov rdi, exitMsg
    call print_string

    ; Terminate program
    mov rax, 60 ; System call number for exit
    xor edi, edi ; Exit status 0
    syscall

print_string:
    ; Print string to console
    push rsi
    mov rsi, rsp
    mov eax, 1 ; System call number for write
    mov rdx, 255 ; Maximum string length
    mov esi, rdi ; String address
    sub rsp, 8 ; Adjust stack pointer
    xor rax, rax ; Clear RAX register
    syscall
    add rsp, 8 ; Restore stack pointer
    pop rsi
    ret

read_string:
    ; Read string from console
    push rdx
    mov rdx, rsi ; Maximum string length
    mov eax, 0 ; System call number for read
    xor edi, edi ; Standard input file descriptor (0)
    syscall
    pop rdx
    ret

section .bss
    buffer resb 256 ; Input buffer
