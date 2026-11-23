#include <stdint.h>

const uint8_t chr_page_1[4096]
__attribute__((used, section(".chr_rom.1"))) = {
    [0] = 0xFF
};