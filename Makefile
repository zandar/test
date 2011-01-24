OPTIMIZE= -O2
MCU_TARGET=atmega8

DEFS=
LIBS=

CC=avr-gcc

OBJCOPY=avr-objcopy
OBJDUMP=avr-objdump
AVRSVF=avrsvf

# bootloader option
BOOTLOADER=avrload.sh
BAUD=19200

override CFLAGS= -g -Wall $(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS)
override LDFLAGS= -Wl,-Map,$(APP).map


PROJ=test

SRCS= test.c
OBJS:=$(SRCS:.c=.o)


all: $(PROJ).hex

%.elf: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)


%.o: %.c $(wildcard *.h)
	$(CC) -c $(CFLAGS) $< -o $@ 

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@
	
load:
	$(BOOTLOADER) $(BAUD) $(PROJ)

