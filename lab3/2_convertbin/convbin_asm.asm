segment .data
segment .bss
segment .text

        global  convbin

%define result		[ebp+12]
%define value_a		[ebp+8]

convbin:
        enter   0,0               ; setup routine
        pusha			  ; save register

;Please continue!

;end of your program

	popa
        mov     eax, 0           ; return back to C
        leave
	ret
error:
	popa
        mov     eax, -1           ; return back to C
        leave
	ret





