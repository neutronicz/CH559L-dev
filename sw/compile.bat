@echo off 
set project_name=CH559USB
set xram_size=0x1800
set xram_loc=0x0000
set code_size=0xF000
set dfreq_sys=48000000

SDCC\BIN\sdcc -V -mmcs51 --model-small --xram-size %xram_size% --xram-loc %xram_loc% --code-size %code_size% main.c 


del *.asm
del *.lst
del *.rel
del *.rst
del *.sym
del *.map
del *.mem
del *.lk


Rem This tool flashes the bin file directly to the ch559 chip, you need to install the libusb-win32 driver with the zadig( https://zadig.akeo.ie/ ) tool so the tool can access the usb device
wchisp\wchisp.exe flash main.ihx