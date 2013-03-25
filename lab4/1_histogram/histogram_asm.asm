segment .data
segment .bss
segment .text

global  histogram_asm

%define size		[ebp+8]
%define random		[ebp+12]
%define histogram	[ebp+16]
%define mean		[ebp+20]

histogram_asm:
	enter 0, 0	;setup routine
	pusha		;save register

; Please continue here!

; zero mean
	mov eax, mean
	mov [eax], dword 0

; zero histogram
	mov edx, histogram
	mov ecx, 0
cleanelement:
	cmp ecx, 256
	je cleanelementdone
	mov [edx+ecx*4], dword 0
	inc ecx
	jmp cleanelement
cleanelementdone:

; count values into histogram and accumulate mean
	mov edx, random
	mov ecx, 0
loopy:
	cmp ecx, size
	je done
	pusha
		mov ebx, [edx+ecx*4]	; random value in ebx
		
		mov edx, mean		; pointer to mean in edx
		mov eax, [edx]		; load mean
		add eax, ebx		; and add current value
		mov [edx], eax		; write back

		mov ecx, histogram	; pointer to histogram
		mov eax, [ecx+ebx*4]	; dereference pointer using index
		inc eax			; count value
		mov [ecx+ebx*4], eax	; write back
	popa
	inc ecx
	jmp loopy
done:

; divide mean through size (uses the 386's 32bit divide)
	mov ebx, size

	mov ecx, mean	; load accumulated mean to eax
	mov eax, [ecx]

	mov edx, 0
	idiv ebx	; divide (edx:eax)/ebx = eax (edx is remainder)

	mov [ecx], eax	; write back

; end of your program

	popa
	mov	eax, 0	;return to C
	leave
	ret

error:
	popa
	mov eax,-1	;fatal error
	leave
	ret		;return to C
