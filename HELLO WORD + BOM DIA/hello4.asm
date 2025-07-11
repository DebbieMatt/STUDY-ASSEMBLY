;  hello.asm  a first program for nasm for Linux, Intel, gcc
;
; assemble:	nasm -f elf -l hello.lst  hello.asm
; link:		gcc -o hello  hello.o
; run:	        hello 
; output is:	Hello World 

	SECTION .data		
msg1:	db "Ja passou do meio dia (S/N)?",10	
len1:	equ $-msg1
msg2:   db " ",10
len2:   equ $-msg2
msg3:   db "Boa tarde.",10
len3:   equ $-msg3
msg4:   db  "Bom dia.",10
len4:   equ $-msg4
msg5:   db  "Digite S ou N.",10
len5:   equ $-msg5
				

	SECTION .text		; code section
        global main		; make label available to linker 
main:				; standard  gcc  entry point
	; escreve a msg1
	mov	edx,len1		
	mov	ecx,msg1		
	mov	ebx,1		
	mov	eax,4		
	int	0x80	
	
	; smb://10.0.20.160
	
	; le a msg2 entrada pelo usuario
	mov  edx,len2
	mov  ecx,msg2
	mov  ebx,1
	mov  eax,3
	int  0x80

	mov byte  al, [msg2]
	cmp al, 'S'
	jz  boa_tarde
	cmp al, 's'
	jz boa_tarde
	cmp al, 'N'
	jz bom_dia
	cmp al, 'n'
	jz bom_dia
	
	;escreve digite n ou s
	mov	edx,len5		
	mov	ecx,msg5		
	mov	ebx,1		
	mov	eax,4		
	int	0x80
	jmp main
	
bom_dia:	
	; escreve Bom dia
	mov	edx,len4		
	mov	ecx,msg4		
	mov	ebx,1		
	mov	eax,4		
	int	0x80	
	
	
	jmp  fim
	
boa_tarde:	
	; escreve Boa tarde
	mov	edx,len3		
	mov	ecx,msg3		
	mov	ebx,1		
	mov	eax,4		
	int	0x80	

fim:	
	; termina o programa
	mov	ebx,0		
	mov	eax,1		
	int	0x80		
