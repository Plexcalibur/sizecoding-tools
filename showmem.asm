[org 100h]

    mov al, 0x13
    int 10h

    ; PALLETTE Color
    mov cx, 0x100
pallette_loop1:
    mov dx, 3C8h    
    mov al, cl
    out dx, al
    inc dx 
    out dx, al
    shr al, 1
    out dx, al
    shr al, 1
    out dx, al
    dec cx
    test cl, ~15
    jnz pallette_loop1

    mov ds, cx
    push 0xa000
    pop es

    ; initial scroll down amount: one line per frame
    mov bp, 16   ; change this to 0 to start in NO_SCROLLING state

frameStart:
    mov dl, 200  ; how many lines on screen?
    xor si, si
    xor di, di

nextLine:
    ; copy one line
    mov cx, 256  ; how many pixels per line?
    rep movsb

    ; put color pattern at border
    mov ax, ds
    shl ax, 4
    add ax, si
    dec ah
    mov al, ah
    stosb

    ; fill rest of line with color of the number of the 64k segment
    mov ax, si
    sub ax, 256
    shr ax, 4
    mov bx, ds
    add ax, bx
    shr ax, 12
    mov cx, 320-256-1
    rep stosb

    ; prepare next line
    dec dl
    jnz nextLine

    ; one line of pixels down
    mov dx, ds
    add dx, bp
    mov ds, dx

    ; check for esc
    in al, 60h       ; read keyboard scan code
    dec al           ; cmp to code for ESC-key
    jnz frameStart

    ; toggle scrolling
    xor bp, 16

wait_for_esc:
    in al, 60h       ; read keyboard scan code
    dec al           ; cmp to code for ESC-key
    jz wait_for_esc

    jmp frameStart
