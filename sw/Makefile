CC=SDCC\BIN\sdcc

XRAMSIZE=0x1800
XRAMLOC=0x0000
CODESIZE=0xF000
DFREQSYS=48000000

CFLAGS=-V -mmcs51 --model-large --xram-size $(XRAMSIZE) --xram-loc $(XRAMLOC) --code-size $(CODESIZE) 

SRCS=$(wildcard *.c)
IHXS=$(SRCS:.c=.ihx)

all:$(IHXS)

%.ihx: %.c
	$(CC) $(CFLAGS) $<

clean:
	-rm *.asm *.lst *.rel *.rst *.sym *.lk *.map *.mem
