#
# Linux makefile for multiply
# Use with make 
#

.SUFFIXES: .o .asm .c

AS=yasm
ASFLAGS= -f elf32 -g dwarf2
CFLAGS= -g -m32
CC=gcc


.asm.o:
	$(AS) $(ASFLAGS) $*.asm


.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: multiply

multiply : multiply.o multiply_asm.o 
	$(CC) $(CFLAGS) -o multiply multiply.o multiply_asm.o


multiply_asm.o : multiply_asm.asm


multiply.o : multiply.c


clean :
	rm *.o

debug :
	ddd -gdb ./multiply
