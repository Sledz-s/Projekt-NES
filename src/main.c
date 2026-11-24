#include <stdint.h>
#include <nes.h>
#include "lib/stdnes.h"
#include "lib/main.h"

uint16_t camera_x __attribute__((section(".zp.bss")));
uint16_t camera_y __attribute__((section(".zp.bss")));
uint8_t camera_scroll_x __attribute__((section(".zp.bss")));
uint8_t camera_scroll_y __attribute__((section(".zp.bss")));

volatile uint8_t nmi_ready = 0;
volatile uint8_t current_color = 0x2A;
volatile uint8_t update_palette = 0;

uint8_t oam_buffer[256] __attribute__((aligned(256)));

struct oam_data_t {
    uint8_t y;
    uint8_t tile_ID;
    uint8_t attribute;
    uint8_t x;
};

struct oam_data_t *oam = (struct oam_data_t *)oam_buffer;

//  ===================================================
// PPU stuff

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

void oam_clear(void) {
    for (uint8_t i = 0; i < 64; i++) {
        oam[i].y = 0xFF;
    }
}

//  ===================================================

void Reset(void) {
    PPU_CTRL = 0; 
    PPU_MASK = 0; 

    ppu_wait_vblank_poll();
    ppu_wait_vblank_poll();

    ppu_clear_nametable();
    ppu_draw_test_tile();

    current_color = 0x2A;
    update_palette = 1;
    
    oam_clear();

    oam[0].y = 19;
    oam[0].tile_ID = 0x02;
    oam[0].attribute = 0;
    oam[0].x = 20;

    oam[1].y = 19 + 8;
    oam[1].tile_ID = 0x03;
    oam[1].attribute = 0;
    oam[1].x = 20;

    oam[2].y = 19;
    oam[2].tile_ID = 0x04;
    oam[2].attribute = 0;
    oam[2].x = 20 + 8;

    oam[3].y = 19 + 8;
    oam[3].tile_ID = 0x05;
    oam[3].attribute = 0;
    oam[3].x = 20 + 8;
    
    // var reset
    camera_x = 0;
    camera_y = 0;
    camera_scroll_x = 0x02;
    camera_scroll_y = 0x02;
}

NMI {
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

    OAM_ADDR = 0;
    OAM_DMA = ((uint16_t)oam_buffer) >> 8;

    (void)PPU_STATUS;
    PPU_SCROLL = camera_x >> 2;
    PPU_SCROLL = camera_y >> 2;
    PPU_CTRL = 0x80 | PPU_CTRL_NAMETABLE_0;
    PPU_MASK = 0x18;

    nmi_ready = 1;
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

        // camera_x += camera_scroll_x;
        // camera_y += camera_scroll_y;
    }

    return 0;
}