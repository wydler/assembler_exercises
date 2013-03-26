; vectord_asm (int dimension, int *y1, int *y2, int *distance2)

segment .data
segment .bss
segment .text

global  vectord_asm

%define dimension	[ebp+8]
%define y1		[ebp+12]
%define y2		[ebp+16]
%define distance2	[ebp+20]


vectord_asm:
        enter   0,0            ;setup routine
        pusha			;save register
	
; Please continue here!
	mov eax, distance2
	mov ebx, 0
	mov [eax], ebx
	mov eax, y1
	mov ebx, y2
	mov ecx, dimension
loopy:
	cmp ecx, 0
	jz done
	pusha
	mov ecx, [eax]	;load y1 and y2
	mov edx, [ebx]
	sub edx, ecx	;edx=y1-y2
	mov eax, edx	;setup (y1+y2)^2
	mov ebx, edx
	imul eax, ebx	;do square -> edx:eax
	mov ebx, distance2	;load pointer to distance
	add eax, [ebx]		;add previous distance
	mov [ebx], eax		;write back
	popa
	add eax, 4
	add ebx, 4
	dec ecx
	jmp loopy
done:

; end of your program

	popa
        mov     eax, 0          ;return to C
        leave
	ret

error:
	popa
	mov eax,-1		;fatal error
	leave
	ret			;return to C





