section .data
    heading db 'C R O S S W O R D', 10
    lenHeading equ $ - heading

    ; level 1 grid
    l1FirstLine db '  M  O  O  N  ', 10
    l1SecondLine db '  A  O  S  M  ', 10
    l1ThirdLine db '  N  Z  P  Y  ', 10
    l1FouthLine db '  S  E  A  L  ', 10

    len1 equ $ - l1FirstLine

    ; level 1 correct words
    moon  db 'moon'
    lenMoon equ $ - moon

    man db 'man'
    lenMan equ $ - man 
    ooze db 'ooze'
    lenOoze equ $ - ooze
    seal db 'seal'
    lenSeal equ $ - seal
    spa db 'spa'
    lenSpa equ $ - spa 


    ; level 2 grid
    L2LINE1 DB '  A  M  A  Z  E  M  ', 10
    L2LINE2 DB '  P  H  I  I  B  L  ', 10
    L2LINE3 DB '  A  E  M  P  I  N  ', 10
    L2LINE4 DB '  C  A  P  E  W  Z  ', 10
    L2LINE5 DB '  E  T  C  O  O  L  ', 10
    L2LINE6 DB '  Z  M  O  O  C  S  ', 10

    len2 equ $ - L2LINE1

    ; level 2 correct words
    amaze db 'amaze'
    lenAmaze equ $ - amaze
    pace db 'pace'
    lenPace equ $ - pace
    pin db 'pin'
    lenPin equ $ -pin
    cap db 'cap'
    lenCap equ $ -cap
    zip db 'zip'
    lenZip equ $ -zip
    phi db 'phi'
    lenPhi equ $ -phi
    heat db 'heat'
    lenHeat equ $ -heat
    ape db 'ape'
    lenApe equ $ -ape
    eat db 'eat'
    lenEat equ $ -eat
    cool db 'cool'
    lenCool equ $ - cool

    ; LEVEL 3 GRID
    L3LINE1 DB '  D  E  D  O  N  O  R  S  ', 10
    L3LINE2 DB '  T  M  C  O  O  M  A  N  ', 10
    L3LINE3 DB '  H  M  A  R  E  A  D  O  ', 10
    L3LINE4 DB '  R  N  N  E  Z  I  I  T  ', 10
    L3LINE5 DB '  O  N  E  D  Y  N  C  T  ', 10
    L3LINE6 DB '  W  O  N  O  S  E  U  U  ', 10
    L3LINE7 DB '  N  O  E  M  I  C  L  B  ', 10
    L3LINE8 DB '  C  U  S  T  O  M  E  R  ', 10

    len3 equ $ - L3LINE1

    ; level 3 correct words
    cane db 'cane'
    lenCane equ $ - cane
    main db 'main'
    lenMain equ $ - main
    nose db 'nose'
    lenNose equ $ - nose
    thrown db 'thrown'   
    lenThrown equ $ - thrown
    read db 'read'    
    lenRead equ $ - read
    customer db 'customer'    
    lenCustomer equ $ - customer
    donors db 'donors'    
    lenDonors equ $ - donors
    button db 'button'    
    lenButton equ $ - button
    sender db 'sender'    
    lenSender equ $ - sender
    radicule db 'radicule'    
    lenRadicule equ $ - radicule


    ; level 4 grid
    firstLine db '  U  N  I  V  E  R  S  I  T  Y  ', 10
    secondLine db '  A  L  O  P  L  I  M  N  O  P  ', 10
    thirdLine db '  C  A  N  Z  E  G  B  Z  U  V  ', 10
    fourthLine db '  C  Z  S  R  P  H  P  L  T  O  ', 10
    fifthLine db '  O  Q  S  A  H  T  A  B  L  E  ', 10
    sixthLine db '  R  T  O  L  A  G  N  H  O  L  ', 10
    seventhLine DB '  D  I  N  N  N  L  E  Q  A  B  ', 10
    eightLine db '  C  B  A  L  T  T  L  O  K  K  ', 10

    len4 equ $ - firstLine

    ; correct words in crossword
    university db 'university'    
    lenUniversity equ $ - university
    accord db 'accord'    
    lenAccord equ $ - accord
    table db 'table'    
    lenTable equ $ - table
    elephant db 'elephant'    
    lenElephant equ $ - elephant
    din db 'din'    
    lenDin equ $ - din
    pane db 'pane'    
    lenPane equ $ - pane
    son db 'son'    
    lenSon equ $ - son
    ions db 'ions'    
    lenIons equ $ - ions
    right db 'right'    
    lenRight equ $ - right
    tout db 'tout'    
    lenTout equ $ - tout

    ; displaying messages
    welcome db 'Welcome to Crossword Puzzle Game!', 10
    lenWelcome equ $ - welcome

    ready db 'Are you ready for LEVEL 1 ? (y/n) _ '
    lenReady equ $ - ready

    prompt db 'Enter Words found In small caps',10, 'Enter a word found: '
    lenPrompt equ $ - prompt
    correctMsg db 'Correct guess!', 10
    lenCorrectMsg equ $ - correctMsg

    wrongMsg db 'Wrong guess! Try again.', 10
    lenWrongMsg equ $ - wrongMsg

    exitMsg db 'Thank you for playing! Goodbye.', 10
    lenExitMsg equ $ - exitMsg

    ask db 'Do you still find another word?(y/n) _ '
    lenAsk equ $ - ask

    yes db 'y'
    lenYes equ $ - yes

    no db 'n'
    lenNo equ $ - no







; declare guess for recieving the input for the user
section .bss
    guess resb 32
    respond resb 2

; program codes
section .text
    global _start

; program root
_start:
    ; display crossword
    mov rax, 1
    mov edi, 1
    mov esi, heading
    mov rdx, lenHeading
    syscall

    ; welcome message
    mov rax, 1
    mov edi, 1
    mov esi, welcome
    mov rdx, lenWelcome
    syscall

    jmp greeting


greeting:
    ; display crossword
    mov rax, 1
    mov edi, 1
    mov esi, ready
    mov rdx, lenReady
    syscall

    ; read the input from the user
    mov rax, 0
    mov rdi, 0
    mov rsi, respond
    mov rdx, 2
    syscall

    mov rsi, yes
    mov rdi, respond
    mov rcx, lenYes
    cld
    repe cmpsb

    ; If rcx is zero (end of both strings reached), jump to equal
    je begin1

    jmp exit

; print cross word grid
begin1:
    call level1
begin2:
    call level2
begin3:
    call level3
begin4:
    call level4

; Print level 1 words and start displaying
level1:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, l1FirstLine
    mov rdx, len1
    syscall

    jmp display_prompt1

; display a prompt to recieve input
display_prompt1:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

    jmp get_guess1

; receiving user input
get_guess1:
    mov rax, 0
    mov rdi, 0
    mov rsi, guess
    mov rdx, 32
    syscall

    jmp check_guess_l1

; check the word user input and run through the correct words
check_guess_l1:
    ; Compare strings s1 and s2
    mov rsi, moon
    mov rdi, guess
    mov rcx, lenMoon
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

; will be back
    mov rsi, man
    mov rdi, guess
    mov rcx, lenMan
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, seal
    mov rdi, guess
    mov rcx, lenSeal
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, ooze
    mov rdi, guess
    mov rcx, lenOoze
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, spa
    mov rdi, guess
    mov rcx, lenSpa
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found


    jmp match_not_found

; starting level 2
level2:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, L2LINE1
    mov rdx, len2
    syscall

    jmp display_prompt2

; level 2 display prompt
display_prompt2:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

    jmp get_guess2

; receiving user input
get_guess2:
    mov rax, 0
    mov rdi, 0
    mov rsi, guess
    mov rdx, 32
    syscall

    jmp check_guess_l2


; checking level 2 words
check_guess_l2:
    ; Compare strings s1 and s2
    mov rsi, amaze
    mov rdi, guess
    mov rcx, lenAmaze
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, pace
    mov rdi, guess
    mov rcx, lenPace
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, pin
    mov rdi, guess
    mov rcx, lenPin
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, cap
    mov rdi, guess
    mov rcx, lenCap
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, zip
    mov rdi, guess
    mov rcx, lenZip
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, phi
    mov rdi, guess
    mov rcx, lenPhi
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, heat
    mov rdi, guess
    mov rcx, lenHeat
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, ape
    mov rdi, guess
    mov rcx, lenApe
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, eat
    mov rdi, guess
    mov rcx, lenEat
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, cool
    mov rdi, guess
    mov rcx, lenCool
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found


    jmp match_not_found

; starting level 3
level3:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, L3LINE1
    mov rdx, len3
    syscall

    jmp display_prompt3

; level 3
display_prompt3:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

    jmp get_guess3

; receiving user input
get_guess3:
    mov rax, 0
    mov rdi, 0
    mov rsi, guess
    mov rdx, 32
    syscall

    jmp check_guess_l3


; checking level 3 guess
check_guess_l3:
    mov rsi, cane
    mov rdi, guess
    mov rcx, lenCane
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, main
    mov rdi, guess
    mov rcx, lenMain
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, nose
    mov rdi, guess
    mov rcx, lenNose
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, thrown
    mov rdi, guess
    mov rcx, lenThrown
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, read
    mov rdi, guess
    mov rcx, lenRead
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, donors
    mov rdi, guess
    mov rcx, lenDonors
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, customer
    mov rdi, guess
    mov rcx, lenCustomer
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, button
    mov rdi, guess
    mov rcx, lenButton
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, sender
    mov rdi, guess
    mov rcx, lenSender
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, radicule
    mov rdi, guess
    mov rcx, lenRadicule
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    
    jmp match_not_found
  

; starting level 4
level4:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, firstLine
    mov rdx, len4
    syscall

    jmp display_prompt4



; level 4
display_prompt4:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

    jmp get_guess4

; receiving user input
get_guess4:
    mov rax, 0
    mov rdi, 0
    mov rsi, guess
    mov rdx, 32
    syscall

    jmp check_guess_l4

; checking level 3 guess
check_guess_l4:
    mov rsi, university
    mov rdi, guess
    mov rcx, lenUniversity
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, table
    mov rdi, guess
    mov rcx, lenTable
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, elephant
    mov rdi, guess
    mov rcx, lenElephant
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, tout
    mov rdi, guess
    mov rcx, lenTout
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, accord
    mov rdi, guess
    mov rcx, lenAccord
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, din
    mov rdi, guess
    mov rcx, lenDin
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, son
    mov rdi, guess
    mov rcx, lenSon
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, ions
    mov rdi, guess
    mov rcx, lenIons
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, right
    mov rdi, guess
    mov rcx, lenRight
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    mov rsi, pane
    mov rdi, guess
    mov rcx, lenPane
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found

    
    jmp match_not_found
  

match_not_found:
    ; Else, print "Strings are not equal" message
    mov rax, 1
    mov edi, 1
    mov esi, wrongMsg
    mov rdx, lenWrongMsg
    syscall

    jmp display_prompt1

; print match found message
match_found:
    mov rax, 1
    mov edi, 1
    mov esi, correctMsg
    mov rdx, lenCorrectMsg
    syscall

    jmp ask_new_word

; ask if user still wants to find a new word
ask_new_word:
    ; display prompt for new word
    mov rax, 1
    mov edi, 1
    mov esi, ask
    mov rdx, lenAsk
    syscall

    ; read the input from the user
    mov rax, 0
    mov rdi, 0
    mov rsi, respond
    mov rdx, 2
    syscall

    mov rsi, yes
    mov rdi, respond
    mov rcx, lenYes
    cld
    repe cmpsb

    ; If rcx is zero (end of both strings reached), jump to equal
    je display_prompt1

    jmp start_next_level

start_next_level:
    mov rax, 1
    mov edi, 1
    mov esi, ask
    mov rdx, lenAsk
    syscall

    ; read the input from the user
    mov rax, 0
    mov rdi, 0
    mov rsi, respond
    mov rdx, 2
    syscall

    mov rsi, yes
    mov rdi, respond
    mov rcx, lenYes
    cld
    repe cmpsb

    ; If rcx is zero (end of both strings reached), jump to equal
    je begin2

    jmp exit








; exit program
exit: 
    mov rax, 1
    mov edi, 1
    mov esi, exitMsg
    mov rdx, lenExitMsg
    syscall


    mov rax, 60
    mov edi,edi
    syscall