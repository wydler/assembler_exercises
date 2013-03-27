;mean_asm.asm 11.10.2011

segment .data

segment .bss

segment .text

global  mean

%define myData	[ebp+8]
%define result	[ebp+12]

mean:
  enter 0,0               ; setup routine
  pusha                   ; save register

  mov eax, 0              ; reset eax register
  mov ebx, 0              ; reset ebx register
  mov edx, myData         ; set data pointer
  mov cx, [edx]           ; get count value

loopee:
  add edx, 2              ; increase pointer +2
  mov ax, [edx]           ; get value at pointer
  cwde                    ; expand to 32-bit
  add ebx, eax            ; add to sum
  loopnz loopee           ; jump to loopee if cx not zero

end:
  mov edx, myData         ; set data pointer
  mov ecx, 0              ; reset ecx register
  mov cx, [edx]           ; get count value
  mov edx, 0              ; reset edx register
  mov eax, ebx            ; move sum to eax register
  idiv ecx                ; (eax:edx)/ecx
  cwde                    ; expand to 32-bit
  mov ebx, result         ; get result pointer
  mov [ebx], eax          ; write mean to pointer
  popa
  mov eax, 0              ; return back to C
  leave
  ret

error:
  popa
  mov eax, -1 ; return back to C
  leave
  ret