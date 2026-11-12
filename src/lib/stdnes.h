#ifndef STDNES_H
#define STDNES_H

#include "nes.h"
#include <stdint.h>


/* @brief Read and store controller output 
 * @return Bitmask of pressed buttons.
*/
uint8_t read_controller_1(void);

#endif