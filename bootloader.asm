[org 0x7C00]

; แสดงข้อความ "Press Enter to continue..."
mov ah, 0x0E          ; BIOS Teletype Output
mov al, 'P'           ; ตัวอักษร 'P'
int 0x10              ; เรียก BIOS interrupt

mov al, 'r'
int 0x10

mov al, 'e'
int 0x10

mov al, 's'
int 0x10

mov al, 's'
int 0x10

mov al, ' '
int 0x10

mov al, 'E'
int 0x10

mov al, 'n'
int 0x10

mov al, 't'
int 0x10

mov al, 'e'
int 0x10

mov al, 'r'
int 0x10

mov al, ' '
int 0x10

mov al, 't'
int 0x10

mov al, 'o'
int 0x10

mov al, ' '
int 0x10

mov al, 'c'
int 0x10

mov al, 'o'
int 0x10

mov al, 'n'
int 0x10

mov al, 't'
int 0x10

mov al, 'i'
int 0x10

mov al, 'n'
int 0x10

mov al, 'u'
int 0x10

mov al, 'e'
int 0x10

mov al, '...'
int 0x10

; รอรับการกด Enter จากผู้ใช้
.wait_for_enter:
    mov ah, 0x00        ; BIOS keyboard function
    int 0x16            ; รับข้อมูลจากคีย์บอร์ด
    cmp al, 0x0D        ; ตรวจสอบว่าเป็น Enter หรือไม่ (0x0D = Enter)
    jne .wait_for_enter ; ถ้าไม่ใช่ Enter, รอรับใหม่อีกครั้ง

; แสดงข้อความ "Enter Key Pressed"
mov ah, 0x0E          ; BIOS Teletype Output
mov al, 'E'           ; ตัวอักษร 'E'
int 0x10              ; เรียก BIOS interrupt

mov al, 'n'
int 0x10

mov al, 't'
int 0x10

mov al, 'e'
int 0x10

mov al, 'r'
int 0x10

mov al, ' '
int 0x10

mov al, 'K'
int 0x10

mov al, 'e'
int 0x10

mov al, 'y'
int 0x10

mov al, ' '
int 0x10

mov al, 'P'
int 0x10

mov al, 'r'
int 0x10

mov al, 'e'
int 0x10

mov al, 's'
int 0x10

mov al, 's'
int 0x10

mov al, 'e'
int 0x10

mov al, 'd'
int 0x10

; อ่าน Kernel จากดิสก์แล้วกระโดดไปที่ Kernel
mov ah, 0x02          ; BIOS read function
mov al, 0x01          ; Number of sectors to read
mov ch, 0x00          ; Cylinder number
mov cl, 0x02          ; Sector number (2nd sector on disk)
mov dh, 0x00          ; Head number
mov dl, 0x00          ; Drive number (0x00 for floppy)
mov bx, 0x1000        ; Memory location to load Kernel (0x1000)
int 0x13              ; Call BIOS

jmp 0x0000:0x1000     ; Jump to Kernel's entry point

times 510-($-$$) db 0
dw 0xAA55
