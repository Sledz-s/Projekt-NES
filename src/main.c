
#include <stdint.h>
#include "lib/nes.h"
#include "lib/stdnes.h"

#define TILE_X 10
#define TILE_Y 10

inline void ppu_wait_vblank(void) {
    while (!(PPU_STATUS & 0x80));
}

void ppu_set_address(uint16_t address) {
    (void)PPU_STATUS;

    PPU_ADDR = (uint8_t)(address >> 8);
    PPU_ADDR = (uint8_t)address;
}

void ppu_set_nametable(uint8_t nametable) {
    PPU_CTRL = nametable & PPU_CTRL_NAMETABLE_MASK;
}

void ppu_clear_nametable(void) {
    ppu_set_address(0x2000);

    // 960 kafelków + 64 bajty atrybutów
    for (uint16_t i = 0; i < 1024; i++) {
        PPU_DATA = 0;
    }
}

void ppu_set_palette(uint8_t color) {
    (void)PPU_STATUS;

    PPU_ADDR = 0x3F;
    PPU_ADDR = 0x00;

    PPU_DATA = 0x0F;
    PPU_DATA = color;
    PPU_DATA = 0x0F;
    PPU_DATA = 0x0F;

    // Przywróć bazowy nametable w rejestrze t
    PPU_CTRL = PPU_CTRL_NAMETABLE_0;

    // Przywróć scroll
    (void)PPU_STATUS;
    PPU_SCROLL = 0;
    PPU_SCROLL = 0;
}


void ppu_draw_test_tile(void) {
    uint16_t address = 0x2000 + TILE_Y * 32 + TILE_X;

    ppu_set_address(address);
    PPU_DATA = 1;
}

void ppu_reset_scroll(void) {
    (void)PPU_STATUS;
    PPU_SCROLL = 0;
    PPU_SCROLL = 0;

    PPU_CTRL = 0;
    PPU_MASK = 0x0A;

    PPU_CTRL = PPU_CTRL_NAMETABLE_0;
}

void Reset(void) {
    PPU_CTRL = 0;
    PPU_MASK = 0;

    ppu_wait_vblank();
    ppu_clear_nametable();
    ppu_set_palette(0x2A);
    ppu_draw_test_tile();

    ppu_reset_scroll(); 
}

int main(void) {
    Reset();

    uint8_t controller = 0;
    uint8_t controller_prev = 0;
    uint8_t palette_pending = 0x2A;

    while (1) {
    ppu_wait_vblank();

    controller = read_controller_1();

    if (PRESSED_A) {
        ppu_set_palette(0x2B);
    }

    if (PRESSED_B) {
        ppu_set_palette(0x2A);
    }

    controller_prev = controller;
    }

    return 0;
}
