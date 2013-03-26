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
	enter	12,0	; setup routine
	pusha		; save register

	mov eax, Matrix_A
	mov eax, [eax]		; Matrix_A.row
	mov ebx, Matrix_B
	mov ebx, [ebx]		; Matrix_B.row
	cmp eax, ebx
	jne fatal_error

	mov ebx, Matrix_A
	mov ebx, [ebx+2*4]	; Matrix_A.column
	mov ecx, Matrix_B
	mov ecx, [ecx+2*4]	; Matrix_B.column
	cmp ebx, ecx
	jne fatal_error

	; rows in eax - cols in ebx

	mov edx, Matrix_Sum
	mov [edx], eax		; set Matrix_Sum.row
	mov [edx+2*4], ebx	; set Matrix_Sum.column

	mov ecx, 0
loopy:
	cmp ecx, 100
	je done
	pusha
		mov eax, Matrix_A
		add eax, 12		; eax now points to Matrix_A.mat
		mov eax, [eax+ecx*2]	; load current element to eax
		mov ebx, Matrix_B
		add ebx, 12		; ebx now points to Matrix_B.mat
		mov ebx, [ebx+ecx*2]	; load current element to ebx

		add eax, ebx		; add both elements

		mov ebx, Matrix_Sum
		add ebx, 12
		mov [ebx+ecx*2], eax
	popa
	inc ecx
	jmp loopy

done:
	popa
	mov eax, 0	; return back to C
	leave
	ret

fatal_error:
	popa
	mov eax, -1	; fatal error
	leave
	ret
