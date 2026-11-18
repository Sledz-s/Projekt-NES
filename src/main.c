#include <stdint.h>
#include <nes.h>
#include "lib/stdnes.h"

#define TILE_X 10
#define TILE_Y 10

volatile uint8_t nmi_ready = 0;
volatile uint8_t current_color = 0x2A;
volatile uint8_t update_palette = 0;

int8_t oam_buffer[256] __attribute__((aligned(256)));

__attribute__((interrupt_norecurse)) void nmi(void) {
    if (update_palette) {
        (void)PPU_STATUS;
        PPU_ADDR = 0x3F;
        PPU_ADDR = 0x00;

        PPU_DATA = 0x0F;
        PPU_DATA = current_color; 
        PPU_DATA = 0x0F;          
        PPU_DATA = 0x0F;          

        update_palette = 0;
    }

    (void)PPU_STATUS;
    PPU_SCROLL = 0;
    PPU_SCROLL = 0;
    PPU_CTRL = 0x80 | PPU_CTRL_NAMETABLE_0;
    PPU_MASK = 0x0A; 

    nmi_ready = 1;
}

inline void ppu_wait_vblank_poll(void) {
    while (!(PPU_STATUS & 0x80));
}

void ppu_set_address(uint16_t address) {
    (void)PPU_STATUS;
    PPU_ADDR = (uint8_t)(address >> 8);
    PPU_ADDR = (uint8_t)address;
}

void ppu_clear_nametable(void) {
    ppu_set_address(0x2000);
    for (uint16_t i = 0; i < 1024; i++) {
        PPU_DATA = 0;
    }
}

void ppu_draw_test_tile(void) {
    uint16_t address = 0x2000 + TILE_Y * 32 + TILE_X;
    ppu_set_address(address);
    PPU_DATA = 1;
}

void Reset(void) {
    PPU_CTRL = 0; 
    PPU_MASK = 0; 

    ppu_wait_vblank_poll();
    ppu_wait_vblank_poll();

    ppu_clear_nametable();
    ppu_draw_test_tile();

    current_color = 0x2A;
    update_palette = 1;
}

int main(void) {
    Reset();

    uint8_t controller = 0;
    uint8_t controller_prev = 0;

    PPU_CTRL = 0x80 | PPU_CTRL_NAMETABLE_0;

    while (1) {
        while (!nmi_ready);
        nmi_ready = 0;

        controller = read_controller_1();

        if (PRESSED_A) {
            current_color = 0x2B;
            update_palette = 1;
        }

        if (PRESSED_B) {
            current_color = 0x2A;
            update_palette = 1;
        }

        controller_prev = controller;
    }

    return 0;
}