#include <stdint.h>

// CHR-ROM: 8 KB
// Tile 0: pusty
// Tile 1: jednolity kolor (indeks 1)

const uint8_t chr_data[8192]
__attribute__((used, section(".chr_rom"))) = {
    // Tile 1, bitplane 0
    [16] = 0xFF,
    [17] = 0xFF,
    [18] = 0xFF,
    [19] = 0xFF,
    [20] = 0xFF,
    [21] = 0xFF,
    [22] = 0xFF,
    [23] = 0xFF

    // Bitplane 1 pozostaje wyzerowany.
};