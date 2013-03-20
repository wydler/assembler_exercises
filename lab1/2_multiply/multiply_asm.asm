; multiply_asm.asm 23.09.2009
; Please return the product of value_a and value_b
; by using the pointer "result" which is 64 bit wide 

; int multiply ( int a, int b ,long long int *result);

segment .data

segment .bss

segment .text

        global  multiply

%define result		[ebp+16]
%define value_b		[ebp+12]
%define value_a		[ebp+8]


multiply:
        enter   0,0               ; setup routine
        pusha			  ; save register

;Please continue


;End of your program

	popa
        mov     eax, 0           ; return with no error
        leave
	ret

error:
	popa
        mov     eax, -1           ; return with error
        leave
	ret



