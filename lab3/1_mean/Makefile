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

all: mean

mean : mean.o mean_asm.o 
	$(CC) $(CFLAGS) -o mean mean.o mean_asm.o


mean_asm.o : mean_asm.asm


mean.o : mean.c


clean :
	rm *.o

debug :
	kdbg ./mean
