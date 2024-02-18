[org 100h]

    mov bx, cs
    call printBX

    ; print Header line
    mov cx, 2
    mov dl, ' '
  leadingSpaces:
    call printDL
    loop leadingSpaces

    mov bx, 0
    mov cx, 16
  loopHeader:
    call printBX12Bit
    add bx, 0x100
    loop loopHeader

    call fillLine

    ; real start
start:
    mov ds, cx
    call hash64k
    mov cx, ds
    add cx, 0x1000
    jnz start

    mov dl, 'V'
    call printDL
    mov dl, 'e'
    call printDL
    mov dl, 'r'
    call printDL
    mov dl, '1'
    call printDL
    mov dl, '.'
    call printDL
    mov dl, '0'
    call printDL

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

    call fillLine

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

fillLine:
    pusha
    mov dl, ' '
    mov cx, 10
  fillLineLoop:
    call printDL
    loop fillLineLoop
    popa
    ret