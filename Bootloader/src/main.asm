org 0x7C00
bits 16

start:
    jmp main


puts:
    push si
    push ax

.loop:
    lodsb
    or al,al
    jz .done

    mov ah, 0x0e ; Function to print a character
    mov bh, 0    ; Page number (0 for current page)
    int 0x10     ; Call BIOS to print character

.done:
    pop ax
    pop si
    ret


main:
    ;setup data segments
    mov ax, 0
    mov ds, ax
    mov es ,ax
    
    ;setup stack
    mov ss, ax
    mov sp, 0x7C00
    
    mov si,msg_hello
    call puts

    hlt
.halt:
    jmp .halt

msg_hello: db 'Hello World',0x0A,0   


times 510-($-$$) db 0
dw 0AA55h