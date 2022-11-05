# Simple 16 bit Operating System

## Code

This a very simple bootloader that relies on [BIOS Interupts](https://en.wikipedia.org/wiki/BIOS_interrupt_call) for printing to the screen.

We first set the [Video mode](http://vitaly_filatov.tripod.com/ng/asm/asm_023.1.html) to 2, which corresponds to a 80x25 text mode and invoke an interupt.
```asm
xor ah, ah
mov al, 2
int 0x10
```


We then use the interupt 0x0E to write an ASCII character to the screen, we set it to 'A' and increment 26 times do display the alphabet.
```asm
mov ah, 0x0E
mov al, 'A'

myloop:
    int 0x10
    inc al
    cmp al, 'Z'
    jng myloop
```


Here we enter an endless loop since our program is done and fill up the sector with zero's which is 512 bytes in total.

We then add the bytes \xAA\x55 to tell the bios that this sector is bootable.
```asm
jmp $
times 510-($-$$) db 0
dw 0xAA55
```

## Assemble & Try

Run the `build` file (you might have to append a .bat or .sh), all it does is use `NASM` to generate a .bin file which you can use a floppy disk image in a virtual machine such as VMWare, Qemu or VirtualBox. I didn't test it on real hardware yet.

## Showcase

![image](https://cdn.discordapp.com/attachments/780153367305256981/1038443686008205322/image.png)
