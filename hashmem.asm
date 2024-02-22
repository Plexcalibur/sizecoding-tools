[org 100h]

VERSION equ '1.3'
DEFAULTCHAR equ '.'
SEPCHAR equ ':'

    pusha
    push ds
    push es
    
    mov ax,0x1112
    int 0x10

    ; print Version and registers
    mov eax, 'Vers'
    call printStringInEAX
    mov eax, 'ion'
    call printStringInEAX
    mov eax, VERSION
    call printStringInEAX
    call printCRLF
    call printRegisters
    call printCRLF

    ; Print Byte per Chat
    mov eax, '(1 '
    call printStringInEAX
    mov eax, 'char'
    call printStringInEAX
    mov eax, ' = 1'
    call printStringInEAX
    mov eax, 'kb)'
    call printStringInEAX
    call printCRLF

    ; print Header line
    mov bx, cs
    call printBX

    mov ax, ' '
    call printStringInEAX

    mov bx, 0
    mov cx, 16
  loopHeader:
    call printBX12Bit
    add bx, 0x100
    loop loopHeader

    mov eax, ' las'
    call printStringInEAX
    mov eax, 't4By'
    call printStringInEAX
    mov eax, 'te'
    call printStringInEAX

    call printCRLF

    ; real start
loopOverview:
    mov ds, cx
    call hash64k
    mov cx, ds
    add cx, 0x1000
    jnz loopOverview

    ; empty separation line
    call printCRLF

    ; print explanation for details
    mov eax, 'Deta'
    call printStringInEAX
    mov eax, 'ils:'
    call printStringInEAX
    mov eax, ' (1 '
    call printStringInEAX
    mov eax, 'char'
    call printStringInEAX
    mov eax, ' = 6'
    call printStringInEAX
    mov eax, '4b)'
    call printStringInEAX
    call printCRLF

    xor cx, cx
loopDetails:
    mov ds, cx
    call hash64kDetails
    mov cx, ds
    add cx, 0x1000
    jnz loopDetails

    pop es
    pop ds
    popa

    ret ; exit back to DOS

hash64kDetails:
    pusha
    ; 4k hashes
    xor si, si
    mov bp, 16
  loop4kHashesDetails:
    mov cx, 4096
    call hash
    cmp al, DEFAULTCHAR
    jz skipDetails

    ; show details for 4kb segment
    sub si, 4096
    mov bx, si
    shr bx, 4
    mov ax, ds
    add bx, ax
    call printBX
    mov ax, ' '
    call printStringInEAX

    ; makeHashes for 64 bytes
    push bp
    mov bp, 64     ; 64 chars on screen
  loop64bHashes:
    mov cx, 64
    call hash
    mov dl, al
    cmp dl, DEFAULTCHAR
    jnz printHashDetails
    test bp, 3
    jnz printHashDetails
    mov dl, SEPCHAR
  printHashDetails:
    call printDL
    dec bp
    jnz loop64bHashes
    call printLast4Bytes
    pop bp
    call printCRLF
    ; end of inner Loop

  skipDetails:
    dec bp
    jnz loop4kHashesDetails

    popa
    ret

printLast4Bytes:
    pusha
    mov eax, ' '
    call printStringInEAX
    mov bl, [ds:si - 4]
    call printBL
    mov bl, [ds:si - 3]
    call printBL
    mov bl, [ds:si - 2]
    call printBL
    mov bl, [ds:si - 1]
    call printBL
    popa
    ret


hash64k:
    pusha
    mov bx, ds
    call printBX
    mov dl, ' '
    call printDL

    ; 1k hashes
    xor si, si
    mov bp, 64
  loop1kHashes:
    mov cx, 1024
    call hash
    mov dl, al
    cmp dl, DEFAULTCHAR
    jnz printHash
    test bp, 3
    jnz printHash
    mov dl, SEPCHAR
  printHash:
    call printDL
    dec bp
    jnz loop1kHashes

    call printLast4Bytes

    call printCRLF

    popa
    ret

hash:
    xor dx, dx
    xor ax, ax
    xor di, di
    mov bx, 37
  hashLoop:
    mul bx
    xor ax, dx
    movzx dx, byte[ds:si]
    or di, dx
    add ax, dx
    inc si
    loop hashLoop
    or di, di ; was there any non-zero byte in the block?
    jz defaultChar
    xor al, ah
    xor ah, ah
    add ax, 62
  modulo:
    inc ax
    sub ax, 62
    cmp ax, 62
    jae modulo
    add al, '0'
    cmp al, '9'
    jbe endHash
    add al, 'A' - '9' - 1
    cmp al, 'Z'
    jle endHash
    add al, 'a' - 'Z' - 1
    jmp endHash
  defaultChar:
    mov al, DEFAULTCHAR
  endHash:
    ret

printDL:
    pusha
    mov ah, 2
    int 21h
    popa
    ret

printBXorSpaces:
    or bx, bx
    jnz printBX
    pusha
    mov eax, ':...'
    call printStringInEAX
    popa
    ret

printBL:
    pusha
    mov cx, 2 ; char count to print
    rol bx, 8
    jmp printLoop ; reuse second part of printBX


printBX12Bit:
    pusha
    mov dl, '_'
    call printDL

    mov cx, 3 ; char count to print
    rol bx, 4
    jmp printLoop ; reuse second part of printBX


printBX:
    pusha
    mov cx, 4 ; char count to print

  printLoop:
    mov ah, 2
    rol bx, 4
    mov dl, bl
    and dl, 15
    add dl, '0'
    cmp dl, '9'
    jna skip
    add dl, 7  ; "A" -> "F"
  skip:
    int 21h
    loop printLoop
    popa
    ret    

printRegisters:
    pusha
    push bx
    mov bx, ax
    mov ax, 'AX'
    call printRegInAXBX
    pop bx
    mov ax, 'BX'
    call printRegInAXBX
    mov ax, 'CX'
    mov bx, cx
    call printRegInAXBX
    mov ax, 'DX'
    mov bx, dx
    call printRegInAXBX
    mov ax, 'SI'
    mov bx, si
    call printRegInAXBX
    mov ax, 'DI'
    mov bx, di
    call printRegInAXBX
    mov ax, 'BP'
    mov bx, bp
    call printRegInAXBX
    mov ax, 'SP'
    mov bx, sp
    call printRegInAXBX
    call printCRLF
    mov ax, 'CS'
    mov bx, cs
    call printRegInAXBX
    mov ax, 'DS'
    mov bx, ds
    call printRegInAXBX
    mov ax, 'ES'
    mov bx, es
    call printRegInAXBX
    call printCRLF
    popa
    ret

printRegInAXBX:
    pusha
    call printStringInEAX
    mov dl, ':'
    call printDL
    call printBX
    mov dl, ' '
    call printDL
    popa
    ret

printCRLF:
    pusha
    mov ax, 0x0a0d
    call printStringInEAX
    popa
    ret

printStringInEAX:
    pusha
    mov cx, 4
  printEAXLoop:
    mov dl, al
    or dl, dl
    jz skipEAXPrint
    call printDL
  skipEAXPrint:
    ror eax, 8
    loop printEAXLoop
    popa
    xor eax, eax
    ret