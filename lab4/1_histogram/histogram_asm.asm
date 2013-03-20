segment .data
segment .bss
segment .text

global  histogram_asm

%define size	  [ebp+8]
%define random    [ebp+12]
%define histogram [ebp+16]


histogram_asm:
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





