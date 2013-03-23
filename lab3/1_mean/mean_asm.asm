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

  mov eax, 0
  mov edx, myData
  mov cx, [edx]
  mov ebx, 0

loopee:
  add edx, 2
  mov bx, [edx]
  add eax, ebx
  loopnz loopee

end:
  mov ebx, myData
  mov cx, [ebx]
  mov edx, 0
  idiv cx
  mov ebx, result
  mov [ebx], eax
	popa
  mov eax, 0              ; return back to C
  leave
	ret

error:
	popa
	mov eax, -1	; return back to C
	leave
	ret

