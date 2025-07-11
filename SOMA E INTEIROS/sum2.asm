;  hello.asm  a first program for nasm for Linux, Intel, gcc
;
; assemble:	nasm -f elf -l hello.lst  hello.asm
; link:		gcc -o hello  hello.o
; run:	        hello 
; output is:	Hello World 

	SECTION .data		
msg1:	     db "Entre com um numero inteiro:",10	
len_msg1:    equ $-msg1
num1_txt:    db "                ",10,0
len_num1:    equ $-num1
fmt:          db "%d",10,0
msg2:        db "A soma de todos os numeros de 1 ao numero dado eh:",10,0
len_msg2:    equ $-msg2
num1:         dq  0
soma:         dq 0



	SECTION .text		; code section
	extern atoi
	extern printf
        global main		; make label available to linker 
main:				; standard  gcc  entry point
	; escreve a msg1
	mov	edx,len_msg1		
	mov	ecx,msg1		
	mov	ebx,1		
	mov	eax,4		
	int	0x80	
	
	
	; le o primeiro numero que o cara entrou
	mov  edx,len_num1
	mov  ecx,num1_txt
	mov  ebx,1
	mov  eax,3
	int  0x80
	
	
	;converte o primeiro numero para int
	;int atoi (const char * str);
	mov rdi, num1_txt
	call atoi
	mov [num1], rax

	;  soma = 0  
	;  cont = 1
	;  while (cont <= n) {
	;     soma = soma + cont
	;     cont++
	;  }
	
	; soma = rbx
	; cont = rcx
	inc rax 
	mov rbx,0
	mov rcx,1
comeco_do_while:
       cmp rcx,rax
       jz fim_while
       add rbx,rcx
       inc rcx
       jmp comeco_do_while
       
fim_while:      
       mov [soma],rbx
	
	
	; escreve a msg2
	mov	edx,len_msg2		
	mov	ecx,msg2		
	mov	ebx,1		
	mov	eax,4		
	int	0x80	
	
	
	mov rdi, fmt
	mov rsi, [soma]
	mov rax,0
	call printf
	
	
	
	
	;sprintf(str,"%d",value) converts to decimal base.
	;mov rdi, sum_txt
	;mov rsi, fmt
	;mov rdx, rbx
	;call sprintf
	
	
	
	; escreve o resultado da soma convertido
	;mov edx,len_sum
	;mov ecx,sum_txt
	;mov ebx,1
	;mov eax,4
	;int 0x80
	
	
	
	
	
	; termina o programa
	mov	ebx,0		
	mov	eax,1		
	int	0x80		
