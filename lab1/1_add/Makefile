#
# Linux makefile for add
# Use with make 
#

.SUFFIXES: .o .asm .c

AS=yasm
ASFLAGS= -f elf -g dwarf2
CFLAGS= -g 
CC=gcc


.asm.o:
	$(AS) $(ASFLAGS) $*.asm


.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: add

add : add.o add_asm.o 
	$(CC) $(CFLAGS) -o add add.o add_asm.o


add_asm.o : add_asm.asm


add.o : add.c


clean :
	rm *.o

debug :
	ddd -gdb ./add
