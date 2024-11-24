#include <compiler.h>
#include <stdint.h>

SFR(PORT_CFG,	0xC6); // Port Configuration Register
SFR(P1_DIR,	0xBA);	// P1 port direction control register
SFR(P1,	0x90);	// P1 port input and output register

SBIT(LED6, 0x90, 6); // accessing pin 1.6

static inline void delay() {
    uint32_t i;
    for (i = 0; i < (120000UL); i++){}
        __asm__("nop");
}

void main() {
	PORT_CFG = 0b00101101;
    P1_DIR = 0b11110000;
	P1 = 0x00;

	while (1) {
		delay();
		LED6 = !LED6;
	}
}