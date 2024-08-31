extern "C" void bootloader_main() {
    char* video_memory = (char*)0xb8000; // Address for text mode video memory
    const char* message = "Welcome to Nostalgia";

    int line_length = 80; // Number of characters per line
    int line_count = 25;  // Number of lines on the screen
    int message_length = 0;
    while (message[message_length] != '\0') {
        ++message_length;
    }

    // Clear the screen
    for (int i = 0; i < 80 * 25 * 2; ++i) {
        video_memory[i] = 0x20; // Space character
        video_memory[i + 1] = 0x07; // Light gray on black
    }

    int current_line = 0;
    int current_column = 0;
    for (int i = 0; i < message_length; ++i) {
        if (current_column >= line_length) {
            current_column = 0;
            current_line++;
            if (current_line >= line_count) {
                break; // Stop if we exceed the number of lines
            }
        }
        video_memory[(current_line * line_length + current_column) * 2] = message[i];
        video_memory[(current_line * line_length + current_column) * 2 + 1] = 0x07;
        ++current_column;
    }

    while (true) {
        // Infinite loop to keep the bootloader running
    }
}
