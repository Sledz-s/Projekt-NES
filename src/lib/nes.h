#ifndef NES_H
#define NES_H

#include <stdint.h>

// Zero Page
#define ZERO_PAGE_START ((volatile uint8_t*)0x0000)

// PPU
/**
 * @brief PPU Control Register (PPUCTRL)
 *
 * @details
 * Address: $2000
 * Access: Write-only
 * Size: 8 bits
 *
 * Controls the PPU operation, including NMI generation,
 * sprite size, pattern table selection, VRAM increment
 * and base nametable selection.
 *
 * Bit layout:
 *
 *   7  6  5  4  3  2  1  0
 *  +--+--+--+--+--+--+--+--+
 *  |V |P |H |B |S |I |N |N |
 *  +--+--+--+--+--+--+--+--+
 *
 * Bits:
 *
 * [7] V - NMI Enable
 *     0 = Disable NMI
 *     1 = Enable NMI at the beginning of VBlank
 *
 * [6] P - PPU Master/Slave Select
 *     0 = PPU operates in master mode
 *     1 = PPU operates in slave mode
 *
 * [5] H - Sprite Height
 *     0 = 8x8 pixels
 *     1 = 8x16 pixels
 *
 * [4] B - Background Pattern Table
 *     0 = $0000
 *     1 = $1000
 *
 * [3] S - Sprite Pattern Table
 *     0 = $0000
 *     1 = $1000
 *     Note: Ignored when sprites are 8x16 pixels.
 *
 * [2] I - VRAM Address Increment
 *     0 = Increment by 1 after PPUDATA access
 *     1 = Increment by 32 after PPUDATA access
 *
 * [1:0] N - Base Nametable Address
 *     00 = $2000
 *     01 = $2400
 *     10 = $2800
 *     11 = $2C00
 *
 * @note Writing to PPUCTRL updates the temporary VRAM
 *       address (t) nametable bits.
 *
 * @warning This register is write-only. Reading $2000
 *          does not return the stored PPUCTRL value.
 *
 * @see PPU_MASK
 * @see PPU_STATUS
 */
#define PPU_CTRL        (*(volatile uint8_t*)0x2000)

#define PPU_MASK        (*(volatile uint8_t*)0x2001)
#define PPU_STATUS      (*(volatile uint8_t*)0x2002)
#define OAMADDR         (*(volatile uint8_t*)0x2003)
#define OAMDATA         (*(volatile uint8_t*)0x2004)
#define PPU_SCROLL      (*(volatile uint8_t*)0x2005)
#define PPU_ADDR        (*(volatile uint8_t*)0x2006)
#define PPU_DATA        (*(volatile uint8_t*)0x2007)

#define OAMDMA          (*(volatile uint8_t*)0x4014)

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

// APU
#define APU_STATUS      (*(volatile uint8_t*)0x4015)

#define CONTROLLER_STROBE  (*(volatile uint8_t*)0x4016)

/* @brief Player 1 controller port */
#define CONTROLLER_PORT_1 (*(volatile uint8_t*)0x4016)

/* @brief Player 2 controller port */
#define CONTROLLER_PORT_2 (*(volatile uint8_t*)0x4017)

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

#define PRESS_START   (controller & BUTTON_START)

#define PRESSED_LEFT    (PRESS_LEFT     && !(controller_prev & PRESS_LEFT))
#define PRESSED_RIGHT   (PRESS_RIGHT    && !(controller_prev & PRESS_RIGHT))
#define PRESSED_UP      (PRESS_UP       && !(controller_prev & PRESS_UP))
#define PRESSED_DOWN    (PRESS_DOWN     && !(controller_prev & PRESS_DOWN))

#define PRESSED_A \
    ((controller & BUTTON_A) && !(controller_prev & BUTTON_A))

#define PRESSED_B \
    ((controller & BUTTON_B) && !(controller_prev & BUTTON_B))

#endif