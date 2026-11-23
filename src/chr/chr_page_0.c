#include <stdint.h>

#define TILE_SIZE 16
#define TILE_OFFSET(index) ((index) * TILE_SIZE)

// CHR-ROM: 4 KB

const uint8_t chr_page_0[4096]
__attribute__((used, section(".chr_rom.0"))) = {
    //tile 0
    [TILE_OFFSET(0)]        = 0x00,

    // tile 1
    [TILE_OFFSET(1)]        = 0xFF,
    [TILE_OFFSET(1) + 1]    = 0xFF,
    [TILE_OFFSET(1) + 2]    = 0xFF,
    [TILE_OFFSET(1) + 3]    = 0xFF,
    [TILE_OFFSET(1) + 4]    = 0xFF,
    [TILE_OFFSET(1) + 5]    = 0xFF,
    [TILE_OFFSET(1) + 6]    = 0xFF,
    [TILE_OFFSET(1) + 7]    = 0xFF,

    // Tile 2-5: Ball
    [TILE_OFFSET(2)]        = 0b00000111,
    [TILE_OFFSET(2) + 1]    = 0b00011111,
    [TILE_OFFSET(2) + 2]    = 0b00111111,
    [TILE_OFFSET(2) + 3]    = 0b01111111,
    [TILE_OFFSET(2) + 4]    = 0b01111111,
    [TILE_OFFSET(2) + 5]    = 0b11111111,
    [TILE_OFFSET(2) + 6]    = 0b11111111,
    [TILE_OFFSET(2) + 7]    = 0b11111111,

    [TILE_OFFSET(3)]        = 0b11111111,
    [TILE_OFFSET(3) + 1]    = 0b11111111,
    [TILE_OFFSET(3) + 2]    = 0b11111111,
    [TILE_OFFSET(3) + 3]    = 0b01111111,
    [TILE_OFFSET(3) + 4]    = 0b01111111,
    [TILE_OFFSET(3) + 5]    = 0b00111111,
    [TILE_OFFSET(3) + 6]    = 0b00011111,   
    [TILE_OFFSET(3) + 7]    = 0b00000111,

    [TILE_OFFSET(4)]        = 0b11100000,
    [TILE_OFFSET(4) + 1]    = 0b11111000,
    [TILE_OFFSET(4) + 2]    = 0b11111100,
    [TILE_OFFSET(4) + 3]    = 0b11111110,
    [TILE_OFFSET(4) + 4]    = 0b11111110,
    [TILE_OFFSET(4) + 5]    = 0b11111111,
    [TILE_OFFSET(4) + 6]    = 0b11111111,
    [TILE_OFFSET(4) + 7]    = 0b11111111,

    [TILE_OFFSET(5)]        = 0b11111111,
    [TILE_OFFSET(5) + 1]    = 0b11111111,
    [TILE_OFFSET(5) + 2]    = 0b11111111,
    [TILE_OFFSET(5) + 3]    = 0b11111110,
    [TILE_OFFSET(5) + 4]    = 0b11111110,
    [TILE_OFFSET(5) + 5]    = 0b11111100,
    [TILE_OFFSET(5) + 6]    = 0b11111000,   
    [TILE_OFFSET(5) + 7]    = 0b11100000
};