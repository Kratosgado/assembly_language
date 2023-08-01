section .data
    heading db 'C R O S S W O R D', 10
    lenHeading equ $ - heading

    ; level 1 grid
    l1FirstLine db '  M  O  O  N  ', 10
                db '  A  O  S  M  ', 10
                db '  N  Z  P  Y  ', 10
                db '  S  E  A  L  ', 10

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
            DB '  P  H  I  I  B  L  ', 10
            DB '  A  E  M  P  I  N  ', 10
            DB '  C  A  P  E  W  Z  ', 10
            DB '  E  T  C  O  O  L  ', 10
            DB '  Z  M  O  O  C  S  ', 10

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
            DB '  T  M  C  O  O  M  A  N  ', 10
            DB '  H  M  A  R  E  A  D  O  ', 10
            DB '  R  N  N  E  Z  I  I  T  ', 10
            DB '  O  N  E  D  Y  N  C  T  ', 10
            DB '  W  O  N  O  S  E  U  U  ', 10
            DB '  N  O  E  M  I  C  L  B  ', 10
            DB '  C  U  S  T  O  M  E  R  ', 10

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
    firstLine   db '  U  N  I  V  E  R  S  I  T  Y  ', 10
                db '  A  L  O  P  L  I  M  N  O  P  ', 10
                db '  C  A  N  Z  E  G  B  Z  U  V  ', 10
                db '  C  Z  S  R  P  H  P  L  T  O  ', 10
                db '  O  Q  S  A  H  T  A  B  L  E  ', 10
                db '  R  T  O  L  A  G  N  H  O  L  ', 10
                DB '  D  I  N  N  N  L  E  Q  A  B  ', 10
                db '  C  B  A  L  T  T  L  O  K  K  ', 10

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

    ; Welcome message to be displayed upon start of the game
    welcome db 'Welcome to Crossword Puzzle Game!', 10
    lenWelcome equ $ - welcome

    ; message to ask the player to start
    ready db 'Are you ready for LEVEL 1 ? (y/n): '
    lenReady equ $ - ready

    ; message to instruct the user to enter found words in small
    prompt db 'Enter Words found In small caps',10, 'Enter a word found: '
    lenPrompt equ $ - prompt

    ; message to display when player gets a word correct
    correctMsg db 'Correct guess!', 10
    lenCorrectMsg equ $ - correctMsg

    ; message to display when player gets a word wrong
    wrongMsg db 'Wrong guess! Try again.', 10
    lenWrongMsg equ $ - wrongMsg

    ; message to display when exiting the game
    exitMsg db 'Thank you for playing! Goodbye.', 10
    lenExitMsg equ $ - exitMsg

    ; prompt message for another word
    ask db 'Do you still find another word?(y/n): '
    lenAsk equ $ - ask

    ; prompt message for next level
    askPlay db 'Move to the next level? (y/n): '
    lenAskPlay equ $ - askPlay

    ; for checking user response
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
    ; display crossword title
    mov rax, 1
    mov edi, 1
    mov esi, heading
    mov rdx, lenHeading
    syscall   ; call kernel

    ; display welcome message
    mov rax, 1
    mov edi, 1
    mov esi, welcome
    mov rdx, lenWelcome
    syscall

    jmp getting_ready

; Ask if user is ready to start level 1
getting_ready:
    ; ask if player is ready
    mov rax, 1
    mov edi, 1
    mov esi, ready
    mov rdx, lenReady
    syscall

    ; read the response from the user
    mov rax, 0
    mov rdi, 0
    mov rsi, respond
    mov rdx, 2
    syscall

    ; check if user ready and start the game or exit
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

    jmp get_guess1

; receiving user input
get_guess1:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

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
    je match_found1

; will be back
    mov rsi, man
    mov rdi, guess
    mov rcx, lenMan
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found1

    mov rsi, seal
    mov rdi, guess
    mov rcx, lenSeal
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found1

    mov rsi, ooze
    mov rdi, guess
    mov rcx, lenOoze
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found1

    mov rsi, spa
    mov rdi, guess
    mov rcx, lenSpa
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found1


    jmp match_not_found1

match_not_found1:
    ; Else, print "Strings are not equal" message
    mov rax, 1
    mov edi, 1
    mov esi, wrongMsg
    mov rdx, lenWrongMsg
    syscall

    jmp get_guess1

; print match found message
match_found1:
    mov rax, 1
    mov edi, 1
    mov esi, correctMsg
    mov rdx, lenCorrectMsg
    syscall

    jmp ask_new_word1

; ask if user still wants to find a new word
ask_new_word1:
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
    je get_guess1

    jmp start_level_2

start_level_2:
    mov rax, 1
    mov edi, 1
    mov esi, askPlay
    mov rdx, lenAskPlay
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

; starting level 2
level2:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, L2LINE1
    mov rdx, len2
    syscall

    jmp get_guess2

; level 2 display prompt
get_guess2:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

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
    je match_found2

    mov rsi, pace
    mov rdi, guess
    mov rcx, lenPace
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, pin
    mov rdi, guess
    mov rcx, lenPin
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, cap
    mov rdi, guess
    mov rcx, lenCap
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, zip
    mov rdi, guess
    mov rcx, lenZip
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, phi
    mov rdi, guess
    mov rcx, lenPhi
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, heat
    mov rdi, guess
    mov rcx, lenHeat
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, ape
    mov rdi, guess
    mov rcx, lenApe
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, eat
    mov rdi, guess
    mov rcx, lenEat
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2

    mov rsi, cool
    mov rdi, guess
    mov rcx, lenCool
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found2


    jmp match_not_found2


match_not_found2:
    ; Else, print "Strings are not equal" message
    mov rax, 1
    mov edi, 1
    mov esi, wrongMsg
    mov rdx, lenWrongMsg
    syscall

    jmp get_guess1

; print match found message
match_found2:
    mov rax, 1
    mov edi, 1
    mov esi, correctMsg
    mov rdx, lenCorrectMsg
    syscall

    jmp ask_new_word2

; ask if user still wants to find a new word
ask_new_word2:
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
    je get_guess2

    jmp start_level_3

start_level_3:
    mov rax, 1
    mov edi, 1
    mov esi, askPlay
    mov rdx, lenAskPlay
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
    je begin3

    jmp exit

; starting level 3
level3:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, L3LINE1
    mov rdx, len3
    syscall

    jmp get_guess3

; level 3
get_guess3:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

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
    je match_found3

    mov rsi, main
    mov rdi, guess
    mov rcx, lenMain
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, nose
    mov rdi, guess
    mov rcx, lenNose
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, thrown
    mov rdi, guess
    mov rcx, lenThrown
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, read
    mov rdi, guess
    mov rcx, lenRead
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, donors
    mov rdi, guess
    mov rcx, lenDonors
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, customer
    mov rdi, guess
    mov rcx, lenCustomer
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, button
    mov rdi, guess
    mov rcx, lenButton
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, sender
    mov rdi, guess
    mov rcx, lenSender
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    mov rsi, radicule
    mov rdi, guess
    mov rcx, lenRadicule
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found3

    
    jmp match_not_found3
  

match_not_found3:
    ; Else, print "Strings are not equal" message
    mov rax, 1
    mov edi, 1
    mov esi, wrongMsg
    mov rdx, lenWrongMsg
    syscall

    jmp get_guess3

; print match found message
match_found3:
    mov rax, 1
    mov edi, 1
    mov esi, correctMsg
    mov rdx, lenCorrectMsg
    syscall

    jmp ask_new_word3

; ask if user still wants to find a new word
ask_new_word3:
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
    je get_guess3

    jmp start_level_4

start_level_4:
    mov rax, 1
    mov edi, 1
    mov esi, askPlay
    mov rdx, lenAskPlay
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
    je begin4

    jmp exit

; starting level 4
level4:
    ; Print string to console
    mov rax, 1
    mov edi, 1
    mov esi, firstLine
    mov rdx, len4
    syscall

    jmp get_guess4

; level 4
get_guess4:
    mov rax, 1
    mov edi, 1
    mov esi, prompt
    mov rdx, lenPrompt
    syscall

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
    je match_found4

    mov rsi, table
    mov rdi, guess
    mov rcx, lenTable
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, elephant
    mov rdi, guess
    mov rcx, lenElephant
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, tout
    mov rdi, guess
    mov rcx, lenTout
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, accord
    mov rdi, guess
    mov rcx, lenAccord
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, din
    mov rdi, guess
    mov rcx, lenDin
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, son
    mov rdi, guess
    mov rcx, lenSon
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, ions
    mov rdi, guess
    mov rcx, lenIons
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, right
    mov rdi, guess
    mov rcx, lenRight
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4

    mov rsi, pane
    mov rdi, guess
    mov rcx, lenPane
    cld
    repe cmpsb
    ; If rcx is zero (end of both strings reached), jump to equal
    je match_found4
    jmp match_not_found4

match_not_found4:
    ; Else, print "Strings are not equal" message
    mov rax, 1
    mov edi, 1
    mov esi, wrongMsg
    mov rdx, lenWrongMsg
    syscall

    jmp get_guess4

; print match found message
match_found4:
    mov rax, 1
    mov edi, 1
    mov esi, correctMsg
    mov rdx, lenCorrectMsg
    syscall

    jmp ask_new_word4

; ask if user still wants to find a new word
ask_new_word4:
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
    je get_guess4

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
