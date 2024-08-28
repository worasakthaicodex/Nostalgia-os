[org 0x1000]

; แสดงข้อความ "Enter text: "
mov ah, 0x0E
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

mov al, 'e'
int 0x10

mov al, 'x'
int 0x10

mov al, 't'
int 0x10

mov al, ':'
int 0x10

mov al, ' '
int 0x10

; รับข้อความจากผู้ใช้
.mov_loop:
    mov ah, 0x00        ; BIOS keyboard function
    int 0x16            ; รับข้อมูลจากคีย์บอร์ด
    cmp al, 0x0D        ; ตรวจสอบว่าผู้ใช้กด Enter หรือไม่ (Enter = 0x0D)
    je .done_input      ; ถ้ากด Enter, ไปที่ .done_input

    ; แสดงอักขระที่ผู้ใช้ป้อน
    mov ah, 0x0E        ; BIOS Teletype Output
    int 0x10            ; แสดงอักขระบนหน้าจอ

    jmp .mov_loop       ; กลับไปวนลูปเพื่อรับตัวอักษรถัดไป

.done_input:
    hlt                 ; หยุดการทำงานของ CPU

times 510-($-$$) db 0
dw 0xAA55

