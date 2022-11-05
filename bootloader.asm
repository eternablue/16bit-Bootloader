xor ah, ah
mov al, 2
int 0x10

mov ah, 0x0E
mov al, 'A'

myloop:
    int 0x10
    inc al
    cmp al, 'Z'
    jng myloop

jmp $
times 510-($-$$) db 0
dw 0xAA55