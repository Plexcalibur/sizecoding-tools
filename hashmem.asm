[org 100h]

VERSION equ '1.0'

    pusha
    push ds
    push es
    
    ; print Header line
    mov bx, cs
    call printBX

    mov ax, '  '
    call printStringInEAX

    mov bx, 0
    mov cx, 16
  loopHeader:
    call printBX12Bit
    add bx, 0x100
    loop loopHeader

    call printCRLF

    ; real start
start:
    mov ds, cx
    call hash64k
    mov cx, ds
    add cx, 0x1000
    jnz start

    pop es
    pop ds
    popa

    call printRegisters
    call printCRLF

    mov eax, 'Ver'
    call printStringInEAX
    mov eax, VERSION
    call printStringInEAX
    call printCRLF

    ret ; exit back to DOS

hash64k:
    pusha
    mov bx, ds
    call printBX
    mov dl, ':'
    call printDL
    mov dl, ' '
    call printDL

    ; 4k hashes
    xor si, si
    mov bp, 16
  loop4kHashes:
    mov cx, 4096
    call hash
    mov bx, ax
    call printBXorSpaces
    dec bp
    jnz loop4kHashes

    call printCRLF

    popa
    ret

hash:
    xor dx, dx
    xor ax, ax
    mov bx, 37
  hashLoop:
    mul bx
    movzx dx, byte[ds:si]
    add ax, dx
    inc si
    loop hashLoop
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
    mov ah, 2
    mov dl, ';'
    int 21h
    mov dl, '.'
    int 21h
    int 21h
    int 21h
    popa
    ret

printBX12Bit:
    pusha
    mov dl, '_'
    call printDL

    mov ah, 2
    mov cx, 3 ; char count to print
    rol bx, 4
    jmp printLoop ; reuse second part of printBX


printBX:
    pusha
    mov ah, 2
    mov cx, 4 ; char count to print

  printLoop:
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