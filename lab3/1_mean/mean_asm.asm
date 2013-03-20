;mean_asm.asm 11.10.2011


segment .data

segment .bss

segment .text

        global  mean

%define myData		[ebp+8]
%define result		[ebp+12]

mean:
        enter   0,0               ; setup routine
        pusha			  ; save register

;Please continue
	
;End of your program 

	popa
        mov     eax, 0           ; return back to C
        leave
	ret

error:
	popa
        mov     eax, -1           ; return back to C
        leave
	ret

