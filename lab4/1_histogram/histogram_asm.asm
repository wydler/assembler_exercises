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

	mov ecx, size			; get size pointer
	mov edx, random			; get random array pointer

loopee:
	mov eax, [edx]			; get current random value
	push edx				; save edx

	mov ebx, mean			; get mean pointer
	mov edx, [ebx]			; get mean value
	add edx, eax			; add to sum
	mov [ebx], edx			; write new value

	mov edx, 4				; set edx to 4
	mul edx					; multiply eax with edx
	pop edx					; restore edx

	mov ebx, histogram 		; get histogram pointer
	add ebx, eax			; add pointer address

	push eax				; save eax
	mov eax, [ebx]			; get value of histogram address
	inc eax					; increment value
	mov [ebx], eax			; set histogram value
	pop eax					; restore value

	add edx, 4				; increase random pointer
	loopnz loopee           ; jump to loopee if ecx not zero

done:
	mov ecx, size			; get size value
	mov ebx, mean			; set mean pointer
	mov eax, [ebx]			; set mean value
	mov edx, 0				; reset edx register
	idiv ecx				; (eax:edx)/ecx
	mov [ebx], eax			; write mean value
	popa
	mov	eax, 0	;return to C
	leave
	ret

error:
	popa
	mov eax,-1	;fatal error
	leave
	ret		;return to C
