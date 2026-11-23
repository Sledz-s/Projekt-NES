#include <stdint.h>

#define TILE_SIZE 16
#define TILE_OFFSET(index) ((index) * TILE_SIZE)

// CHR-ROM: 4 KB

const uint8_t chr_page_0[4096]
__attribute__((used, section(".chr_rom.0"))) = {
    //tile 0
    [TILE_OFFSET(0)] = 0x00,

    // tile 1
    [TILE_OFFSET(1)] = 0xFF,
    [TILE_OFFSET(1) + 1] = 0xFF,
    [TILE_OFFSET(1) + 2] = 0xFF,
    [TILE_OFFSET(1) + 3] = 0xFF,
    [TILE_OFFSET(1) + 4] = 0xFF,
    [TILE_OFFSET(1) + 5] = 0xFF,
    [TILE_OFFSET(1) + 6] = 0xFF,
    [TILE_OFFSET(1) + 7] = 0xFF,

    // Tile 2: Ball
    [TILE_OFFSET(2)] = 0x00,
    [TILE_OFFSET(2) + 1] = 0x18,
    [TILE_OFFSET(2) + 2] = 0x3C,
    [TILE_OFFSET(2) + 3] = 0x7E
};