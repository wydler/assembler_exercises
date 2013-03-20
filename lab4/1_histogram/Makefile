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

#.cpp.o:
#	$(CXX) -c $(CXXFLAGS) $*.cpp

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: histogram

histogram : histogram.o histogram_asm.o 
	$(CC) $(CFLAGS) -o histogram histogram.o histogram_asm.o 


histogram_ass.o : histogram_asm.asm


histogram.o : histogram.c


clean :
	rm *.o

debug :
	nemiver ./histogram

plot:
	gnuplot -persist -e "plot 'Plot.dat' with boxes"

