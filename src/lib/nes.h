#ifndef NES_H
#define NES_H

#include <stdint.h>

// Zero Page
#define ZERO_PAGE_START ((volatile uint8_t*)0x0000)

//  ============================================================ 
//                             Stuff
//  ============================================================ 

typedef void (*GameStateFunc)(void);


//  ============================================================ 
//                             PPU
//  ============================================================

#define PPU_CTRL        (*(volatile uint8_t*)0x2000)
#define PPU_MASK        (*(volatile uint8_t*)0x2001)
#define PPU_STATUS      (*(volatile uint8_t*)0x2002)
#define PPU_SCROLL      (*(volatile uint8_t*)0x2005)
#define PPU_ADDR        (*(volatile uint8_t*)0x2006)
#define PPU_DATA        (*(volatile uint8_t*)0x2007)

#define PPU_CTRL_NMI_ENABLE       0x80
#define PPU_CTRL_SPRITE_SIZE      0x20
#define PPU_CTRL_BG_PATTERN       0x10
#define PPU_CTRL_SPRITE_PATTERN   0x08
#define PPU_CTRL_VRAM_INCREMENT   0x04

#define PPU_CTRL_NAMETABLE_0  0x00
#define PPU_CTRL_NAMETABLE_1  0x01
#define PPU_CTRL_NAMETABLE_2  0x02
#define PPU_CTRL_NAMETABLE_3  0x03

#define PPU_CTRL_NAMETABLE_MASK 0x03

#define ENABLE_SRPITE   0x10
#define ENABLE_BG       0x0A

//  ============================================================ 
//                             OAM
//  ============================================================

#define OAM_ADDR        (*(volatile uint8_t*)0x2003)
#define OAM_DATA        (*(volatile uint8_t*)0x2004)
#define OAM_DMA         (*(volatile uint8_t*)0x4014)

//  ============================================================ 
//                           Sprites
//  ============================================================

typedef struct {
    uint8_t y;
    uint8_t tile_ID;
    uint8_t attribute;
    uint8_t x;
} sprite_data_t;

//  ============================================================ 
//                             APU
//  ============================================================

// different behaviour on write and read
#define APU_STATUS      (*(volatile uint8_t*)0x4015)

/* @brief 7bit: Interrupt inhibit flag | 6bit: 0: Freerun 1: Expect external synchronization*/
#define FRAME_COUNTER   (*(volatile uint8_t*)0x4017)

#define SQ1_VOL         (*(volatile uint8_t*)0x4000)
#define SQ1_SWEEP       (*(volatile uint8_t*)0x4001)
#define SQ1_LO          (*(volatile uint8_t*)0x4002)
#define SQ1_HI          (*(volatile uint8_t*)0x4003)

#define SQ2_VOL         (*(volatile uint8_t*)0x4004)
#define SQ2_SWEEP       (*(volatile uint8_t*)0x4005)
#define SQ2_LO          (*(volatile uint8_t*)0x4006)
#define SQ2_HI          (*(volatile uint8_t*)0x4007)

#define TRI_LINEAR      (*(volatile uint8_t*)0x4008)
#define TRI_UNUSED      (*(volatile uint8_t*)0x4009)    // Unused
#define TRI_LO          (*(volatile uint8_t*)0x400A)
#define TRI_HI          (*(volatile uint8_t*)0x400B)

#define NOISE_VOL       (*(volatile uint8_t*)0x400C)
#define NOISE_UNUSED    (*(volatile uint8_t*)0x400D)    // Unused
#define NOISE_LO        (*(volatile uint8_t*)0x400E)
#define NOISE_HI        (*(volatile uint8_t*)0x400F)

#define DMC_FREQ        (*(volatile uint8_t*)0x4010)
#define DMC_RAW         (*(volatile uint8_t*)0x4011)
#define DMC_START       (*(volatile uint8_t*)0x4012)
#define DMC_LEN         (*(volatile uint8_t*)0x4013)

//  ============================================================ 
//                             APU
//  ============================================================

#define CONTROLLER_STROBE  (*(volatile uint8_t*)0x4016)

/* @brief Player 1 controller port */
#define JOY1 (*(volatile uint8_t*)0x4016)

/* @brief Player 2 controller port */
#define JOY2 (*(volatile uint8_t*)0x4017)

extern uint8_t controller;
extern uint8_t controller_prev;

#define BUTTON_A       0x01
#define BUTTON_B       0x02
#define BUTTON_SELECT  0x04
#define BUTTON_START   0x08
#define BUTTON_UP      0x10
#define BUTTON_DOWN    0x20
#define BUTTON_LEFT    0x40
#define BUTTON_RIGHT   0x80

#define PRESS_LEFT      (controller & BUTTON_LEFT)
#define PRESS_RIGHT     (controller & BUTTON_RIGHT)
#define PRESS_UP        (controller & BUTTON_UP)
#define PRESS_DOWN      (controller & BUTTON_DOWN)

#define PRESS_A         (controller & BUTTON_A)
#define PRESS_B         (controller & BUTTON_B)

#define PRESS_START     (controller & BUTTON_START)

#define PRESSED_LEFT    (PRESS_LEFT     && !(controller_prev & PRESS_LEFT))
#define PRESSED_RIGHT   (PRESS_RIGHT    && !(controller_prev & PRESS_RIGHT))
#define PRESSED_UP      (PRESS_UP       && !(controller_prev & PRESS_UP))
#define PRESSED_DOWN    (PRESS_DOWN     && !(controller_prev & PRESS_DOWN))

#define PRESSED_START   (PRESS_START    && !(controller_prev & PRESS_START))


#define PRESSED_A \
    ((controller & BUTTON_A) && !(controller_prev & BUTTON_A))

#define PRESSED_B \
    ((controller & BUTTON_B) && !(controller_prev & BUTTON_B))

#endif