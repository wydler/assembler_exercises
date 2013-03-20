;Program for a matrix addition. The structure of the matrixes is defined
;in a c-program by the datatype 'struct'. Parameter of the program are three
;pointers to three of the described structures. The function value 
;describes an error code with the following meaning:

;Return value = 0 -> everything all right
;Return value =-1 -> fatal error (matrixes do not fit)



;
; initialised data in segment .data
;
segment .data
;
; non initialised data in segment .bss
;
segment .bss

; *
; * function Ass_Matrix
; * Add two matrixes; the number of rows and columns have to be the same
; * The matrixes are organized in the datatype struct "matrix"
; *
; * 	typedef struct{
; * 	  unsigned int row;
; * 	  unsigned int maxcolumn;
; * 	  unsigned int column;
; *	  unsigned short mat[10][10];
; * 	  } matrix;
; *
; * The elements of the matrixes are signed 16 Bit numbers
; * Parameters:
; *   a - 1. matrix
; *   b - 2. matrix
; *   sum -> Destination -> Sum of a + b
; *
; * extern int PRE_CDECL Ass_Matrix( Matrix a, Matrix b, Matrix sum ) POST_CDECL;
;
; code is put in the .text segment
;
segment .text
        global  Ass_Matrix

%define	Matrix_Sum	[ebp+16]
%define Matrix_B	[ebp+12]
%define Matrix_A	[ebp+8]
%define row		[ebp-4]
%define maxcolumn	[ebp-8]
%define column		[ebp-12]

Ass_Matrix:
        enter   12,0              ; setup routine
        pusha			  ; save register

    


	popa
        mov     eax, 0            ; return back to C
        leave
	ret

fatal_error:
	popa
	mov 	eax, -1		  ; fatal error
	leave
	ret



