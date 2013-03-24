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

	mov edx, myData	; load pointer to struct in edx
	mov bx, [edx]	; extract count to bx
	add edx, 2	; edx now points to first value
	mov cx, 0	; reset counter
	mov ax, 0	; reset sum

	pusha
loopy:
		cmp bx, cx	; already looped through all values?
		je done		; -> exit loop
		add ax, [edx]	; add value to sum
		add edx, 2	; set edx to next value
		inc cx
		jmp loopy
done:
		mov edx, result	; save sum to result
		mov [edx], ax
	popa
	
	; prepare for division (count already in bx)
	mov ecx, result	; load result to ax
	mov ax, [ecx]

	mov dx, 0
	idiv bx		; divide (dx:ax)/bx = ax (dx is remainder)

	mov [ecx], ax	; write back

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

