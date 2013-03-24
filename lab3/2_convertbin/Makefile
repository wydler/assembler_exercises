#
# Linux makefile
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

all: convbin

convbin : convbin.o convbin_asm.o 
	$(CC) $(CFLAGS) -o convbin convbin.o convbin_asm.o


convbin_asm.o : convbin_asm.asm


convbin.o : convbin.c


clean :
	rm *.o

debug :
	ddd -gdb ./convbin
