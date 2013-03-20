;add_asm.asm 23.09.2009
;value_a, value_b are the two integers
;Return the sum by using
;the pointer "result" (32 bit integer)

segment .data

segment .bss

segment .text

        global  add_asm

%define result		[ebp+16]
%define value_b		[ebp+12]
%define value_a		[ebp+8]


add_asm:
        enter   0,0               ; setup routine
        pusha			  ; save register

;Please continue


;End of your program

	popa
        mov     eax, 0           ; return back to C
        leave
	ret
