; vectord_asm (int dimension, int *y1, int *y2, int *distance2)

segment .data
segment .bss
segment .text

global  vectord_asm

%define dimension	[ebp+8]
%define y1		[ebp+12]
%define y2		[ebp+16]
%define distance2	[ebp+20]


vectord_asm:
        enter   0,0            ;setup routine
        pusha			;save register
	
; Please continue here!
	
	
; end of your program
	                                                                                                                                                             

	popa
        mov     eax, 0          ;return to C
        leave
	ret

error:
	popa
	mov eax,-1		;fatal error
	leave
	ret			;return to C





