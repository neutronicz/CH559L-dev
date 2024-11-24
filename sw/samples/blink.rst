                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.3 #11345 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module blink
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _LED6
                                     13 	.globl _P1
                                     14 	.globl _P1_DIR
                                     15 	.globl _PORT_CFG
                                     16 ;--------------------------------------------------------
                                     17 ; special function registers
                                     18 ;--------------------------------------------------------
                                     19 	.area RSEG    (ABS,DATA)
      000000                         20 	.org 0x0000
                           0000C6    21 _PORT_CFG	=	0x00c6
                           0000BA    22 _P1_DIR	=	0x00ba
                           000090    23 _P1	=	0x0090
                                     24 ;--------------------------------------------------------
                                     25 ; special function bits
                                     26 ;--------------------------------------------------------
                                     27 	.area RSEG    (ABS,DATA)
      000000                         28 	.org 0x0000
                           000096    29 _LED6	=	0x0096
                                     30 ;--------------------------------------------------------
                                     31 ; overlayable register banks
                                     32 ;--------------------------------------------------------
                                     33 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                         34 	.ds 8
                                     35 ;--------------------------------------------------------
                                     36 ; internal ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DSEG    (DATA)
                                     39 ;--------------------------------------------------------
                                     40 ; overlayable items in internal ram 
                                     41 ;--------------------------------------------------------
                                     42 	.area	OSEG    (OVR,DATA)
                                     43 	.area	OSEG    (OVR,DATA)
                                     44 ;--------------------------------------------------------
                                     45 ; Stack segment in internal ram 
                                     46 ;--------------------------------------------------------
                                     47 	.area	SSEG
      000008                         48 __start__stack:
      000008                         49 	.ds	1
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; indirectly addressable internal ram data
                                     53 ;--------------------------------------------------------
                                     54 	.area ISEG    (DATA)
                                     55 ;--------------------------------------------------------
                                     56 ; absolute internal ram data
                                     57 ;--------------------------------------------------------
                                     58 	.area IABS    (ABS,DATA)
                                     59 	.area IABS    (ABS,DATA)
                                     60 ;--------------------------------------------------------
                                     61 ; bit data
                                     62 ;--------------------------------------------------------
                                     63 	.area BSEG    (BIT)
                                     64 ;--------------------------------------------------------
                                     65 ; paged external ram data
                                     66 ;--------------------------------------------------------
                                     67 	.area PSEG    (PAG,XDATA)
                                     68 ;--------------------------------------------------------
                                     69 ; external ram data
                                     70 ;--------------------------------------------------------
                                     71 	.area XSEG    (XDATA)
                                     72 ;--------------------------------------------------------
                                     73 ; absolute external ram data
                                     74 ;--------------------------------------------------------
                                     75 	.area XABS    (ABS,XDATA)
                                     76 ;--------------------------------------------------------
                                     77 ; external initialized ram data
                                     78 ;--------------------------------------------------------
                                     79 	.area XISEG   (XDATA)
                                     80 	.area HOME    (CODE)
                                     81 	.area GSINIT0 (CODE)
                                     82 	.area GSINIT1 (CODE)
                                     83 	.area GSINIT2 (CODE)
                                     84 	.area GSINIT3 (CODE)
                                     85 	.area GSINIT4 (CODE)
                                     86 	.area GSINIT5 (CODE)
                                     87 	.area GSINIT  (CODE)
                                     88 	.area GSFINAL (CODE)
                                     89 	.area CSEG    (CODE)
                                     90 ;--------------------------------------------------------
                                     91 ; interrupt vector 
                                     92 ;--------------------------------------------------------
                                     93 	.area HOME    (CODE)
      000000                         94 __interrupt_vect:
      000000 02 00 06         [24]   95 	ljmp	__sdcc_gsinit_startup
                                     96 ;--------------------------------------------------------
                                     97 ; global & static initialisations
                                     98 ;--------------------------------------------------------
                                     99 	.area HOME    (CODE)
                                    100 	.area GSINIT  (CODE)
                                    101 	.area GSFINAL (CODE)
                                    102 	.area GSINIT  (CODE)
                                    103 	.globl __sdcc_gsinit_startup
                                    104 	.globl __sdcc_program_startup
                                    105 	.globl __start__stack
                                    106 	.globl __mcs51_genXINIT
                                    107 	.globl __mcs51_genXRAMCLEAR
                                    108 	.globl __mcs51_genRAMCLEAR
                                    109 	.area GSFINAL (CODE)
      00005F 02 00 03         [24]  110 	ljmp	__sdcc_program_startup
                                    111 ;--------------------------------------------------------
                                    112 ; Home
                                    113 ;--------------------------------------------------------
                                    114 	.area HOME    (CODE)
                                    115 	.area HOME    (CODE)
      000003                        116 __sdcc_program_startup:
      000003 02 00 8A         [24]  117 	ljmp	_main
                                    118 ;	return from main will return to caller
                                    119 ;--------------------------------------------------------
                                    120 ; code
                                    121 ;--------------------------------------------------------
                                    122 	.area CSEG    (CODE)
                                    123 ;------------------------------------------------------------
                                    124 ;Allocation info for local variables in function 'delay'
                                    125 ;------------------------------------------------------------
                                    126 ;i                         Allocated to registers r4 r5 r6 r7 
                                    127 ;------------------------------------------------------------
                                    128 ;	blink.c:10: static inline void delay() {
                                    129 ;	-----------------------------------------
                                    130 ;	 function delay
                                    131 ;	-----------------------------------------
      000062                        132 _delay:
                           000007   133 	ar7 = 0x07
                           000006   134 	ar6 = 0x06
                           000005   135 	ar5 = 0x05
                           000004   136 	ar4 = 0x04
                           000003   137 	ar3 = 0x03
                           000002   138 	ar2 = 0x02
                           000001   139 	ar1 = 0x01
                           000000   140 	ar0 = 0x00
                                    141 ;	blink.c:12: for (i = 0; i < (120000UL); i++){}
      000062 7C C0            [12]  142 	mov	r4,#0xc0
      000064 7D D4            [12]  143 	mov	r5,#0xd4
      000066 7E 01            [12]  144 	mov	r6,#0x01
      000068 7F 00            [12]  145 	mov	r7,#0x00
      00006A                        146 00104$:
      00006A EC               [12]  147 	mov	a,r4
      00006B 24 FF            [12]  148 	add	a,#0xff
      00006D F8               [12]  149 	mov	r0,a
      00006E ED               [12]  150 	mov	a,r5
      00006F 34 FF            [12]  151 	addc	a,#0xff
      000071 F9               [12]  152 	mov	r1,a
      000072 EE               [12]  153 	mov	a,r6
      000073 34 FF            [12]  154 	addc	a,#0xff
      000075 FA               [12]  155 	mov	r2,a
      000076 EF               [12]  156 	mov	a,r7
      000077 34 FF            [12]  157 	addc	a,#0xff
      000079 FB               [12]  158 	mov	r3,a
      00007A 88 04            [24]  159 	mov	ar4,r0
      00007C 89 05            [24]  160 	mov	ar5,r1
      00007E 8A 06            [24]  161 	mov	ar6,r2
      000080 8B 07            [24]  162 	mov	ar7,r3
      000082 E8               [12]  163 	mov	a,r0
      000083 49               [12]  164 	orl	a,r1
      000084 4A               [12]  165 	orl	a,r2
      000085 4B               [12]  166 	orl	a,r3
      000086 70 E2            [24]  167 	jnz	00104$
                                    168 ;	blink.c:13: __asm__("nop");
      000088 00               [12]  169 	nop
                                    170 ;	blink.c:14: }
      000089 22               [24]  171 	ret
                                    172 ;------------------------------------------------------------
                                    173 ;Allocation info for local variables in function 'main'
                                    174 ;------------------------------------------------------------
                                    175 ;i                         Allocated to registers r4 r5 r6 r7 
                                    176 ;------------------------------------------------------------
                                    177 ;	blink.c:16: void main() {
                                    178 ;	-----------------------------------------
                                    179 ;	 function main
                                    180 ;	-----------------------------------------
      00008A                        181 _main:
                                    182 ;	blink.c:17: PORT_CFG = 0b00101101;
      00008A 75 C6 2D         [24]  183 	mov	_PORT_CFG,#0x2d
                                    184 ;	blink.c:18: P1_DIR = 0b11110000;
      00008D 75 BA F0         [24]  185 	mov	_P1_DIR,#0xf0
                                    186 ;	blink.c:19: P1 = 0x00;
      000090 75 90 00         [24]  187 	mov	_P1,#0x00
                                    188 ;	blink.c:21: while (1) {
      000093                        189 00102$:
                                    190 ;	blink.c:12: for (i = 0; i < (120000UL); i++){}
      000093 7C C0            [12]  191 	mov	r4,#0xc0
      000095 7D D4            [12]  192 	mov	r5,#0xd4
      000097 7E 01            [12]  193 	mov	r6,#0x01
      000099 7F 00            [12]  194 	mov	r7,#0x00
      00009B                        195 00108$:
      00009B EC               [12]  196 	mov	a,r4
      00009C 24 FF            [12]  197 	add	a,#0xff
      00009E F8               [12]  198 	mov	r0,a
      00009F ED               [12]  199 	mov	a,r5
      0000A0 34 FF            [12]  200 	addc	a,#0xff
      0000A2 F9               [12]  201 	mov	r1,a
      0000A3 EE               [12]  202 	mov	a,r6
      0000A4 34 FF            [12]  203 	addc	a,#0xff
      0000A6 FA               [12]  204 	mov	r2,a
      0000A7 EF               [12]  205 	mov	a,r7
      0000A8 34 FF            [12]  206 	addc	a,#0xff
      0000AA FB               [12]  207 	mov	r3,a
      0000AB 88 04            [24]  208 	mov	ar4,r0
      0000AD 89 05            [24]  209 	mov	ar5,r1
      0000AF 8A 06            [24]  210 	mov	ar6,r2
      0000B1 8B 07            [24]  211 	mov	ar7,r3
      0000B3 E8               [12]  212 	mov	a,r0
      0000B4 49               [12]  213 	orl	a,r1
      0000B5 4A               [12]  214 	orl	a,r2
      0000B6 4B               [12]  215 	orl	a,r3
      0000B7 70 E2            [24]  216 	jnz	00108$
                                    217 ;	blink.c:13: __asm__("nop");
      0000B9 00               [12]  218 	nop
                                    219 ;	blink.c:23: LED6 = !LED6;
      0000BA B2 96            [12]  220 	cpl	_LED6
                                    221 ;	blink.c:25: }
      0000BC 80 D5            [24]  222 	sjmp	00102$
                                    223 	.area CSEG    (CODE)
                                    224 	.area CONST   (CODE)
                                    225 	.area XINIT   (CODE)
                                    226 	.area CABS    (ABS,CODE)
