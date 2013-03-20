#
# Linux makefile
# Use with make 
#


.SUFFIXES: .o .asm .cpp .c

AS=yasm
ASFLAGS= -f elf -g dwarf2
CFLAGS= -g
CC=gcc

.asm.o:
	$(AS) $(ASFLAGS) $*.asm 

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: vectord

vectord : vectord.o vectord_asm.o 
	$(CC) $(CFLAGS) -o vectord vectord.o vectord_asm.o -lm


vectord_ass.o : vectord_asm.asm


vectord.o : vectord.c


clean :
	rm *.o

debug :
	nemiver ./vectord
	
