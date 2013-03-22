; vectord_asm (int dimension, int *y1, int *y2, int *distance2)

segment .data
segment .bss
segment .text

global  vectord_asm

%define dimension	[ebp+8]
%define y1				[ebp+12]
%define y2				[ebp+16]
%define distance2	[ebp+20]


vectord_asm:
  enter   0,0       ;setup routine
  pusha							;save register
	
  mov ebx, y1
  mov edx, y2
  mov ecx, dimension

loopee:
  cmp ecx,0
  jz end

  mov eax,[ebx]
  sub eax,[edx]

  push ebx
  push ecx
  push edx

  mov ecx, distance2
  mov ebx,eax
  imul ebx
  add [ecx], eax

  pop edx
  pop ecx
  pop ebx

  add ebx,4
  add edx,4

  dec ecx
  jmp loopee
	                                                                                                                                                             
end:
	popa
  mov     eax, 0          ;return to C
  leave
	ret

error:
	popa
	mov eax,-1		;fatal error
	leave
	ret			;return to C





