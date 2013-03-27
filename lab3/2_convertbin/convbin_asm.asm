segment .data
segment .bss
segment .text

global  convbin

%define result		[ebp+12]
%define value_a		[ebp+8]

convbin:
	enter 0,0	; setup routine
	pusha		; save register

	mov edx, value_a	; value in edx

	mov ecx, result		; pointer to last char (string shall be reversed)
	add ecx, 31			; set pointer to last char

	mov [ecx+1], byte 0	; null termination

loopy:
	mov eax, edx	; logical 'and' edx to get lowest bit
	and eax, 1
	jz isnull

isset:
	mov [ecx], byte '1'
	jmp nextbit

isnull:
	mov [ecx], byte '0'
	jmp nextbit

nextbit:
	cmp ecx, result	; exit loop on last bit
	je done
	dec ecx		; update pointer to output 'next' char
	rcr edx, 1	; right shift value
	jmp loopy

done:
	popa
	mov eax, 0	; return back to C
	leave
	ret
error:
	popa
	mov eax, -1	; return back to C
	leave
	ret
