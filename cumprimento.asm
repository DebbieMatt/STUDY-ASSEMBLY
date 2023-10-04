;  hello.asm  a first program for nasm for Linux, Intel, gcc
;
; assemble:	       nasm -f elf -l hello.lst  hello.asm
; link:		       gcc -o hello  hello.o
; run:	           ./hello
; output is:	   Hello World

	SECTION .data                                    ; secao de dados
msg1:	db "Ja passou do meio dia (S/N)?",10         ; string a ser impressa 10 = cr
len1:	equ $-msg1                                   ; "$" significa aqui
                                                     ; len eh um valor, nao eh o endereco
msg2:   db " ",10
len2:   equ $-msg2
msg3:   db "Boa tarde.",10
len3:   equ $-msg3
msg4:   db  "Bom dia.",10
len4:   equ $-msg4


	SECTION .text		      ; code section
        global _start		  ; make label available to linker

_start:				          ; standard  gcc  entry point
	                          ; escreve a msg1
	mov	edx,len1
	mov	ecx,msg1
	mov	ebx,1
	mov	eax,4
	int	0x80

							; le a msg2 entrada pelo usuario

	mov  edx,len2           ; arg3, tamanho da string a ser impressa
	mov  ecx,msg2           ; arg2, ponteiro para string
	mov  ebx,1              ; arg1, escreve na tela
	mov  eax,3              ; sys_read call: chamada ao sistema para ler
	int  0x80               ; interrupcao 80 hex, chama o kernel do S. O.

	mov byte  al, [msg2]    ;
	cmp al, 'S'             ;
	jz  boa_tarde           ;
	cmp al, 's'             ;
	jz boa_tarde            ;

bom_dia:				     ; escreve Bom dia

	mov	edx,len4             ; arg3, tamanho da string a ser impressa
	mov	ecx,msg4             ; arg2, ponteiro para string
	mov	ebx,1                ; arg1, escreve na tela
	mov	eax,4                ; write system call: chamada ao sistema para escrever
	int	0x80                 ; interrupcao 80 hex, chama o kernel do S. O.


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
	mov	ebx,0               ; codigo de saida: 0 = normal
	mov	eax,1               ; chamada para o sistema operacional
	int	0x80                ; interrupcao 80 hex: chama o kernel do S. O.
