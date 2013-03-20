#
# Linux makefile
# Use with make 
#


.SUFFIXES: .o .asm .cpp .c

AS=yasm
ASFLAGS= -f elf -g dwarf2
CFLAGS= -g 
CC=gcc
#CXX=g++
#CXXFLAGS=

.asm.o:
	$(AS) $(ASFLAGS) $*.asm 

#.cpp.o:
#	$(CXX) -c $(CXXFLAGS) $*.cpp

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: matrix_add 

matrix_add : Matrix_Add.o Ass_Matrix.o 
	$(CC) $(CFLAGS) -o matrix_add Matrix_Add.o Ass_Matrix.o 


Ass_Matrix.o :  Ass_Matrix.asm


Matrix_Add.o : Matrix_Add.c


clean :
	rm *.o

debug :
	#ddd -gdb ./matrix_add
	kdbg ./matrix_add
