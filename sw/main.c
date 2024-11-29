#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <compiler.h>
#include "ch559.h"  // Include the header file for CH559

void delay(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 120; j++);  // Adjust the inner loop for accurate delay
    }
}

SBIT(LED_0, 0xC0, 0);
SBIT(LED_1, 0xB0, 4);
SBIT(LED_2, 0xB0, 3);
SBIT(LED_3, 0xB0, 2);
SBIT(LED_4, 0xC0, 4);

void main(void) {
    uint8_t shreg = 1;
    
	PORT_CFG = 0b11110000;
    P3_DIR = 0b00011100;
    P4_DIR = 0b00010001;    

    while (1) {
        delay(500);  // Add a delay to avoid busy-waiting

        if (shreg != 0) shreg = shreg << 1;else shreg = 1;
        LED_0 = (shreg>>0) & 0x01;
        LED_1 = (shreg>>1) & 0x01;
        LED_2 = (shreg>>2) & 0x01;
        LED_3 = (shreg>>3) & 0x01;
        LED_4 = (shreg>>4) & 0x01;       
    }
}
