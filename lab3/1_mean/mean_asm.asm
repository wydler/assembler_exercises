;mean_asm.asm 11.10.2011


segment .data

segment .bss

segment .text

	global  mean

%define myData	[ebp+8]
%define result	[ebp+12]

mean:
	enter 0,0	; setup routine
	pusha		; save register

;Please continue

	mov edx, result	; clear result
	mov [edx], dword 0

	mov edx, myData	; load pointer to struct in edx
	mov ax, [edx]	; extract count to ebx
	cwde		; cast 16 to 32 bit
	mov ebx, eax

	add edx, 2	; edx now points to first value
	mov cx, 0	; reset counter
	mov ax, 0	; reset sum

loopy:
	cmp bx, cx	; already looped through all values?
	je done		; -> exit loop
	pusha
		mov ax, [edx]	; add value to sum
		cwde		; cast 16 to 32 bit
		mov edx, result	; add value to result
		add eax, [edx]
		mov [edx], eax	; save sum to result
	popa
	add edx, 2	; set edx to next value
	inc cx
	jmp loopy
done:
	
	; prepare for division (count already in bx)
	mov ecx, result	; load result to ax
	mov eax, [ecx]
	cdq		; expand eax -> edx:eax
	idiv ebx	; divide (edx:eax)/ebx = eax (edx is remainder)

	mov [ecx], eax	; write back

;End of your program

	popa
	mov eax, 0	; return back to C
	leave
	ret

error:
	popa
	mov eax, -1	; return back to C
	leave
	ret

