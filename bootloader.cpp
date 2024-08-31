extern "C" int my_strlen(const char* str) {
    int length = 0;
    while (str[length] != '\0') {
        ++length;
    }
    return length;
}

extern "C" void bootloader_main() {
    const char* message = "Welcome to Nostalgia OS!";  // ข้อความสั้นๆ
    char* video_memory = (char*)0xb8000; // Address for text mode video memory

    // Clear the screen
    for (int i = 0; i < 80 * 25 * 2; ++i) {
        video_memory[i] = 0;  // Clear video memory
    }

    // Show message
    int i = 0;
    while (message[i] != '\0') {
        video_memory[i * 2] = message[i]; // Character
        video_memory[i * 2 + 1] = 0x07;   // Attribute (light gray on black)
        ++i;
    }

    // Show prompt
    const char* prompt = "Press Enter to continue...";
    int message_length = my_strlen(message);
    i = 0;
    while (prompt[i] != '\0') {
        video_memory[(i + 2 * message_length) * 2] = prompt[i]; // Character
        video_memory[(i + 2 * message_length) * 2 + 1] = 0x07;   // Attribute (light gray on black)
        ++i;
    }

    while (true) {
        // Infinite loop to keep the bootloader running
    }
}