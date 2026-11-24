#include "stdnes.h"
#include "nes.h"
#include <stdint.h>

uint8_t read_controller_1(void) {
    uint8_t buttons = 0;

    CONTROLLER_STROBE = 1;
    CONTROLLER_STROBE = 0;

    for (uint8_t i = 0; i < 8; i++) {
        buttons |= (JOY1 & 1) << i;
    }

    return buttons;
}