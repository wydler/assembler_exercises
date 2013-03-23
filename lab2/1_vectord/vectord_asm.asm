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
	
  ;save vectors in register
  mov ebx, y1
  mov edx, y2
  ;save dimesion into counter register
  mov ecx, dimension

loopee:
  cmp ecx,0           ;check if dim 0
  jz end              ;then jump to end

  mov eax,[ebx]       ;get first vector element
  sub eax,[edx]       ;subtract the second from the first

  ;save registers for further usage
  push ebx
  push ecx
  push edx

  mov ecx, distance2  ;get distance pointer
  mov ebx,eax         ;duplicate value of eax into ebx
  imul ebx            ;sqrt
  add [ecx], eax      ;add sqrt to distance

  ;restore saved registers
  pop edx
  pop ecx
  pop ebx

  ;increment vector pointers
  add ebx,4
  add edx,4

  dec ecx             ;decrement counter
  jmp loopee          ;jump to loop start
	                                                                                                                                                             
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





