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
%define number    [ebp+16]

stringcopy:
  enter   0,0           ; setup routine
  pusha                 ; save register
  
  ; Adressen in Akkumulatoren laden
  mov eax,buf_in
  mov ebx,buf_out
  mov ecx,0
  jmp copy

copy:
  mov dl,[eax]
  cmp dl,0
  je end

  mov [ebx], dl
  inc eax
  inc ebx
  inc ecx
  jmp copy
  
end:
  mov edx,number
  mov [edx],ecx

  popa
  mov eax,0             ;return 0 = no error
  leave
  ret

error:
	popa
  mov     eax, -1           ; return -1 = error
  leave
	ret



