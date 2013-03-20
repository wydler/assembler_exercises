#
# Linux makefile stringcopy
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

all: stringcopy

stringcopy : stringcopy.o stringcopy_asm.o
	$(CC) $(CFLAGS) -o stringcopy stringcopy.o stringcopy_asm.o

stringcopy_asm.o :  stringcopy_asm.asm


stringcopy.o : stringcopy.c


clean :
	rm *.o

debug :
	kdbg ./stringcopy
	
