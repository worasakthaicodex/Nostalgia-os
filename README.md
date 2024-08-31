# Nostalgia
 Nostalgia ระบบ OS ที่พัฒนาโดยคนไทยเพื่อคนไทย
ได้เเรงบัลดาลใจจาก Kotchasan PHP Framework  ...


 ## การใช้งาน
 1.ติดตั้ง [QEMU] <br>
 2.เรียกไปที่ [QEMU]  cd /d D:\qemu <br>
 3.เปิด OS   qemu-system-x86_64 -drive file=D:\Nostalgia\disk.img,format=raw -m 128 <br>


 ## Tools Used
- [nasm](https://www.nasm.us/) 
เป็นโปรแกรมที่ใช้ในการแปลงโค้ด Assembly ไปเป็นไฟล์ binary หรือ object file และสามารถเรียกใช้งานจาก Command Prompt (CMD) 
บน Windows หรือจาก terminal บนระบบปฏิบัติการอื่น ๆ เช่น Linux หรือ macOS ได้
คำสั่ง สร้าง Bin [1]
D:\nasm\ndisasm.exe -f bin -o D:\Nostalgia\bootloader.bin D:\Nostalgia\bootloader.asm

- [VirtualBox](https://www.virtualbox.org/) 
ช่วยให้สามารถรัน OS หลายๆ ตัวใน VM บน Windows ได้

- [HxD](https://mh-nexus.de/en/hxd/) 
ช่วยให้สามารถทดสอบไฟล์เครื่องได้เช่น .bin .image


- [QEMU](https://www.virtualbox.org/) 
เป็นเครื่องมือที่มีประสิทธิภาพที่สามารถสร้างและจัดการ Disk Image ได้

<br>.ใช้มันเพื่อสร้าง Disk Image ที่ VirtualBox สามารถใช้งานได้. [2]
<br>cd /d D:\qemu 
<br>qemu-img create -f raw D:\Nostalgia\disk.img 64M<br>
<br>ตรวจสอบ Disk Image:[4]
<br>qemu-img info D:\Nostalgia\disk.img


- [WSL](เปิด Command Prompt หรือ PowerShell ด้วยสิทธิ์ผู้ดูแลระบบ.)
 dd เป็นเครื่องมือที่ใช้ในการคัดลอกและแปลงข้อมูลบนระบบ Unix/Linux และสามารถใช้ในการจัดการ Disk Images ได้เช่นกัน. ต่อไปนี้คือวิธีการติดตั้งและใช้ dd บนระบบต่างๆ 
wsl --install
<br>cd /mnt/d/Nostalgia
<br>เขียน Bootloader ลงใน Disk Image: [3]
<br> dd if=bootloader.bin of=disk.img bs=512 seek=0 conv=notrunc

- [MinGW64](https://github.com/niXman/mingw-builds-binaries/releases/download/12.2.0-rt_v10-rev2/x86_64-12.2.0-release-posix-seh-msvcrt-rt_v10-rev2.7z) 
MinGW64สำหรับ C++


    [1] cd /d C:\server\mingw64\bin

    [2] g++.exe -ffreestanding -c D:\Nostalgia\bootloader.cpp -o D:\Nostalgia\bootloader.o

    [3] objcopy.exe -O binary D:\Nostalgia\bootloader.o D:\Nostalgia\bootloader.bin

    [4] ld.exe -o D:\Nostalgia\bootloader.bin -Ttext 0x7C00 --oformat binary D:\Nostalgia\bootloader.o