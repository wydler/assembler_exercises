;mean_asm.asm 11.10.2011

segment .data

segment .bss

segment .text

global  mean

%define myData	[ebp+8]
%define result	[ebp+12]

mean:
  enter 0,0               ; setup routine
  pusha			              ; save register

  mov eax, 0              ; set register to 0
  mov edx, myData         ; set pointer to data
  mov cx, [edx]           ; get count value
  mov ebx, 0              ; set register to 0

loopee:
  add edx, 2              ; increment pointer position
  mov bx, [edx]           ; get value as position
  add eax, ebx            ; add value to others
  loopnz loopee           ; loop until counter 0

end:
  mov ebx, myData         ; get data pointer
  mov cx, [ebx]           ; get count value
  mov edx, 0              ; set register to 0
  idiv cx                 ; div sum by count
  mov ebx, result         ; get result pointer
  mov [ebx], eax          ; save result to pointer
	popa
  mov eax, 0              ; return back to C
  leave
	ret

error:
	popa
	mov eax, -1	; return back to C
	leave
	ret

