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
	mov eax, [eax]			; rows of matrix a
	mov ebx, Matrix_B
	mov ebx, [ebx]			; rows of matrix b
	cmp eax, ebx
	jne fatal_error

	mov eax, Matrix_A
	mov eax, [eax+8]			; cols of matrix a
	mov ebx, Matrix_B
	mov ebx, [ebx+8]			; cols of matrix b
	cmp eax, ebx
	jne fatal_error

	mov eax, Matrix_A		
	mov ecx, [eax]			; rows of matrix
	mov edx, 0				; current pointer value

row_loop:
	push ecx
	push edx
		mov eax, Matrix_A
		mov ecx, [eax+8]		; cols of matrix b

col_loop:
		mov eax, Matrix_A
		add eax, 12
		add eax, edx			; offset
		mov ax, [eax]			; cols of matrix a
		mov ebx, Matrix_B
		add ebx, 12
		add ebx, edx			; offset
		mov bx, [ebx]			; cols of matrix b

		add ax, bx

		mov ebx, Matrix_Sum		; get matrix pointer
		add ebx, 12
		add ebx, edx			; offset
		mov [ebx], ax 			; write add value

		add edx, 2 				; inc col
		loopnz col_loop

row_loop_end:
	pop edx
	pop ecx

	add edx, 20					; inc row
	loopnz row_loop           ; jump to loopee if cx not zero

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
