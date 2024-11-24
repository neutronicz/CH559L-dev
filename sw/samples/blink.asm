;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.3 #11345 (MINGW64)
;--------------------------------------------------------
	.module blink
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _LED6
	.globl _P1
	.globl _P1_DIR
	.globl _PORT_CFG
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PORT_CFG	=	0x00c6
_P1_DIR	=	0x00ba
_P1	=	0x0090
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_LED6	=	0x0096
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;i                         Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	blink.c:10: static inline void delay() {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	blink.c:12: for (i = 0; i < (120000UL); i++){}
	mov	r4,#0xc0
	mov	r5,#0xd4
	mov	r6,#0x01
	mov	r7,#0x00
00104$:
	mov	a,r4
	add	a,#0xff
	mov	r0,a
	mov	a,r5
	addc	a,#0xff
	mov	r1,a
	mov	a,r6
	addc	a,#0xff
	mov	r2,a
	mov	a,r7
	addc	a,#0xff
	mov	r3,a
	mov	ar4,r0
	mov	ar5,r1
	mov	ar6,r2
	mov	ar7,r3
	mov	a,r0
	orl	a,r1
	orl	a,r2
	orl	a,r3
	jnz	00104$
;	blink.c:13: __asm__("nop");
	nop
;	blink.c:14: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	blink.c:16: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	blink.c:17: PORT_CFG = 0b00101101;
	mov	_PORT_CFG,#0x2d
;	blink.c:18: P1_DIR = 0b11110000;
	mov	_P1_DIR,#0xf0
;	blink.c:19: P1 = 0x00;
	mov	_P1,#0x00
;	blink.c:21: while (1) {
00102$:
;	blink.c:12: for (i = 0; i < (120000UL); i++){}
	mov	r4,#0xc0
	mov	r5,#0xd4
	mov	r6,#0x01
	mov	r7,#0x00
00108$:
	mov	a,r4
	add	a,#0xff
	mov	r0,a
	mov	a,r5
	addc	a,#0xff
	mov	r1,a
	mov	a,r6
	addc	a,#0xff
	mov	r2,a
	mov	a,r7
	addc	a,#0xff
	mov	r3,a
	mov	ar4,r0
	mov	ar5,r1
	mov	ar6,r2
	mov	ar7,r3
	mov	a,r0
	orl	a,r1
	orl	a,r2
	orl	a,r3
	jnz	00108$
;	blink.c:13: __asm__("nop");
	nop
;	blink.c:23: LED6 = !LED6;
	cpl	_LED6
;	blink.c:25: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
