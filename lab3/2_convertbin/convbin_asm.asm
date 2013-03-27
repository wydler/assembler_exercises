segment .data
segment .bss
segment .text

global  convbin

%define result		[ebp+12]
%define value_a		[ebp+8]

convbin:
	enter 0,0	; setup routine
	pusha		; save register

	mov edx, value_a	; get value
	mov ecx, result		; save result pointer
	add ecx, 31			; increase pointer to last position

	mov [ecx+1], byte 0

loopee:
	mov eax, edx
	and eax, 1
	cmp eax, 1
	je setone
	mov [ecx], byte '0'
	jmp loopee_e

setone:
	mov [ecx], byte '1'
	jmp loopee_e

loopee_e:
	cmp ecx, result
	je done
	shr edx, 1
	dec ecx
	jmp loopee

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
