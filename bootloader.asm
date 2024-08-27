; bootloader.asm
[org 0x7C00]

; แสดงข้อความ "Hello" ที่หน้าจอ
mov ah, 0x0E          ; BIOS Teletype Output
mov al, 'H'           ; ตัวอักษร 'H'
int 0x10              ; เรียก BIOS interrupt

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

mov al, 'l'
int 0x10

mov al, 'o'
int 0x10

; หยุดการทำงาน (แสดงข้อความบนหน้าจอ)
hlt


mov bx, 0x0000        ; Memory location to load Kernel (0x0000:0x8000)
mov dh, 0x01          ; Number of sectors to read
mov dl, 0x00          ; Drive number (0x00 for floppy)
mov ah, 0x02          ; BIOS read function
mov al, 0x01          ; Number of sectors to read
mov ch, 0x00          ; Cylinder number
mov cl, 0x02          ; Sector number (2nd sector on disk)
mov dh, 0x00          ; Head number
int 0x13              ; Call BIOS

jmp 0x0000:0x8000     ; Jump to Kernel's entry point

times 510-($-$$) db 0
dw 0xAA55
