extern "C" void bootloader_main() {
    // Show a message
    const char* message = "Hello from C++ bootloader!";
    char* video_memory = (char*)0xb8000; // Address for text mode video memory
    for (int i = 0; message[i] != '\0'; ++i) {
        video_memory[i * 2] = message[i]; // Character
        video_memory[i * 2 + 1] = 0x07;   // Attribute (light gray on black)
    }
    while (true) {
        // Infinite loop to keep the bootloader running
    }
}