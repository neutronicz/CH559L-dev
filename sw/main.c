// typedef unsigned char *PUINT8;
// typedef unsigned char __xdata *PUINT8X;
// typedef const unsigned char __code *PUINT8C;
// typedef unsigned char __xdata UINT8X;
// typedef unsigned char  __data             UINT8D;

// #include <stdint.h>
// #include <stdio.h>
// #include <string.h>
// #include "CH559.h"
// #include "util.h"
// #include "USBHost.h"
// #include "uart.h"

// SBIT(LED, 0x90, 6);

// void main()
// {
//     unsigned char s;
//     initClock();
//     initUART0(1000000, 1);
//     DEBUG_OUT("Startup\n");
//     resetHubDevices(0);
//     resetHubDevices(1);
//     initUSB_Host();
//     DEBUG_OUT("Ready\n");
// 	sendProtocolMSG(MSG_TYPE_STARTUP,0, 0x00, 0x00, 0x00, 0);
//     while(1)
//     {
//         if(!(P4_IN & (1 << 6)))
//             runBootloader();
//         processUart();
//         s = checkRootHubConnections();
//         pollHIDdevice();
//     }
// }

 #include <compiler.h>
 #include <stdint.h>

// SFR(PORT_CFG,	0xC6); // Port Configuration Register
// SFR(P3_DIR,	    0xBE);	// P1 port direction control register
// SFR(P3,	        0xB0);	// P1 port input and output register


//SBIT(LED6, 0xB0, 2); // accessing pin 3.2

// static inline void delay() {
//     uint32_t i;
//     for (i = 0; i < (120000UL); i++){}
//         __asm__("nop");
// }

// void main() {
// 	PORT_CFG = 0b11110000;
//     P3_DIR = 0b11111111;
// 	P3 = 0x00;

// 	while (1) {
// 		delay();
// 		LED6 = !LED6;
// 	}
// }

#include "ch559.h"  // Include the header file for CH559

#define LED_0    LED2
#define LED_1    LEDC
#define LED_2    LED1
#define LED_3    LED0
#define LED_4    LED3

void delay(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 120; j++);  // Adjust the inner loop for accurate delay
    }
}

void usb_host_init(void) {
    USB_CTRL = 0x00;  // Reset USB controller
    USB_CTRL = 0x29;  // Enable USB host mode, and other settings
    USB_DEV_AD = 0x00;  // Reset device address
    USB_CTRL |= bUC_HOST_MODE;  // Set USB host mode
    delay(100);  // Wait for USB host mode to stabilize
}

void usb_host_task(void) {
    // Handle USB host tasks such as enumeration and data transfer
    if (USB_INT_FG ) {  // Device detected
        USB_INT_FG = 0x00;  // Clear interrupt flag
        //LED6 = 1;
        // Handle device enumeration
    }
    // Add more USB host handling code here
}

void main(void) {
    uint8_t shreg = 1;

	PORT_CFG = 0b11110000;
    P3_DIR = 0b11111111;
    P4_DIR = 0b00010001;
	P3 = 0x00;

     

    usb_host_init();  // Initialize USB host

    while (1) {
        usb_host_task();  // Perform USB host tasks
        delay(500);  // Add a delay to avoid busy-waiting

        if (shreg != 0) shreg = shreg << 1;else shreg = 1;
        LED_0 = (shreg>>0) & 0x01;
        LED_1 = (shreg>>1) & 0x01;
        LED_2 = (shreg>>2) & 0x01;
        LED_3 = (shreg>>3) & 0x01;
        LED_4 = (shreg>>4) & 0x01;       
    }
}
