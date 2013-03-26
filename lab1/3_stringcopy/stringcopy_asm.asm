  ;stringcopy_asm.asm 30.08.2010
;copy one string (character array) to another
;count the number of copied characters

;int stringcopy( char *buf_in, char *buf_out, int *number);

segment .data

segment .bss

segment .text
        global  stringcopy

%define buf_in		[ebp+8]
%define buf_out		[ebp+12]
%define number      [ebp+16]

stringcopy:
        enter   0,0               ; setup routine
        pusha         ; save register

;Please continue
	mov ecx, 0		;counter
	mov ebx, buf_in		;ebx points to source
	mov edx, buf_out	;edx points to destination
loopy:
	mov al, [ebx]		;load char from source to accumulator
	mov [edx], al		;move char to destination
	inc ebx			;increment both pointers
	inc edx
	cmp al, 0		;jump to 'done' if zero char detected
	jz done
	inc ecx			;increment counter
	jmp loopy

done:
	mov ebx, number		;load pointer to number
	mov [ebx], ecx		;write number
;End of your program

	popa
	mov eax,0		;return 0 = no error
        leave
	ret

error:
	popa
        mov     eax, -1           ; return -1 = error
        leave
	ret
