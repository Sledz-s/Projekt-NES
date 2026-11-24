#include <stdint.h>
#include <nes.h>
#include "lib/stdnes.h"
#include "lib/main.h"

//  ===================================================
//                      zero page
//  ===================================================
uint16_t camera_x __attribute__((section(".zp.bss")));
uint16_t camera_y __attribute__((section(".zp.bss")));
uint8_t camera_scroll_x __attribute__((section(".zp.bss")));
uint8_t camera_scroll_y __attribute__((section(".zp.bss")));

uint16_t player_x __attribute__((section(".zp.bss")));
uint16_t player_y __attribute__((section(".zp.bss")));

uint8_t player_sub_x __attribute__((section(".zp.bss")));
uint8_t player_sub_y __attribute__((section(".zp.bss")));

//  ===================================================

volatile uint8_t nmi_ready = 0;
volatile uint8_t current_color = 0x2A;
volatile uint8_t update_palette = 0;

uint8_t oam_used = 0;

uint8_t controller;
uint8_t controller_prev;

uint8_t oam_buffer[256] __attribute__((aligned(256)));
sprite_data_t *oam = (sprite_data_t *)oam_buffer;

const sprite_data_t metasprite[] = {
    {.x=0, .y=0, .attribute=0, .tile_ID=0x02},
    {.x=0, .y=8, .attribute=0, .tile_ID=0x03},
    {.x=8, .y=0, .attribute=0, .tile_ID=0x04},
    {.x=8, .y=8, .attribute=0, .tile_ID=0x05}
};

void draw_metasprite(uint16_t x, uint16_t y, const sprite_data_t *parts, uint8_t count) {
    const sprite_data_t *part = parts;

    while (count--) {

        if (oam_used >= 64)
            return;

        uint16_t sprite_x = x + part->x;
        uint16_t sprite_y = y + part->y;

        if (sprite_x <= 255 && sprite_y >= 1 && sprite_y <= 240) {
            sprite_data_t *dst = &oam[oam_used];

            dst->y = (uint8_t)(sprite_y - 1);
            dst->tile_ID = part->tile_ID;
            dst->attribute = part->attribute;
            dst->x = (uint8_t)sprite_x;

            oam_used++;
        }

        part++;
    }
}

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
    // var reset
    camera_x = 0;
    camera_y = 0;
    camera_scroll_x = 0x02;
    camera_scroll_y = 0x02;

    player_x = 40;
    player_y = 40;
    player_sub_x = 0;
    player_sub_y = 0;
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

inline void player_move(void) {
    if (PRESS_RIGHT) {
            player_sub_x += 2;

            if (player_sub_x >= 4) {
                player_x++;
                player_sub_x -= 4;
            }
        }
        else if (PRESS_LEFT) {
            if (player_sub_x < 2) {
                player_x--;
                player_sub_x += 4;
            }

            player_sub_x -= 2;
        }

        if (PRESS_DOWN) {
            player_sub_y += 2;

            if (player_sub_y >= 4) {
                player_y++;
                player_sub_y -= 4;
            }
        }
        else if (PRESS_UP) {
            if (player_sub_y < 2) {
                player_y--;
                player_sub_y += 4;
            }

            player_sub_y -= 2;
        }
}

//  ===================================================

enum game_state_t {
    TITLE_STATE,
    INTRO_STATE,
    DEMO_STATE
} GAME_STATE;

void title_update(void);
void intro_update(void);
void demo_update(void);

const GameStateFunc game_states[] = {
    title_update,
    intro_update,
    demo_update
};

void title_update(void){
    if (PRESSED_START)  GAME_STATE = DEMO_STATE;
}

void demo_update(void) {
    player_move();

    if (PRESSED_A) {
        current_color = 0x2B;
        update_palette = 1;
    }
    if (PRESSED_B) {
        current_color = 0x2A;
        update_palette = 1;
    }

    oam_clear();
    oam_used = 0;
    draw_metasprite(player_x, player_y, metasprite, 4);
}

void intro_update(void) {
    return; // placeholder
}

//  ===================================================

int main(void) {
    Reset();

    controller = 0;
    controller_prev = 0;

    PPU_CTRL = 0x80 | PPU_CTRL_NAMETABLE_0;

    GAME_STATE = TITLE_STATE;

    while (1) {
        while (!nmi_ready);
        nmi_ready = 0;

        controller = read_controller_1();

        game_states[GAME_STATE]();

        controller_prev = controller;

        // camera_x += camera_scroll_x;
        // camera_y += camera_scroll_y;
    }

    return 0;
}