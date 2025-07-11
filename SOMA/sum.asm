;  hello.asm  a first program for nasm for Linux, Intel, gcc
;
; assemble:	nasm -f elf -l hello.lst  hello.asm
; link:		gcc -o hello  hello.o
; run:	        hello 
; output is:	Hello World 

	SECTION .data		
msg1:	     db "Entre com um numero inteiro:",10	
len_msg1:	     equ $-msg1
num1_txt:    db "                ",10,0
len_num1:    equ $-num1
num2_txt:    db "                ",10,0
len_num2:    equ $-num2
sum_txt      db "                ",10,0
fmt:          db "%d",10,0
fmt2:         db "%s\n",10,0
len_sum:      equ $-sum_txt
msg2:        db "A soma dos dois numeros eh:",10,0
len_msg2:    equ $-msg2
num1:         dd  0
num2:         dd  0
soma:         dd 0



	SECTION .text		; code section
	extern atoi
	extern sprintf
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

	; escreve a msg1 novamente
	mov	edx,len_msg1		
	mov	ecx,msg1		
	mov	ebx,1		
	mov	eax,4		
	int	0x80	
	
	; le o segundo numero que o cara entrou
	mov  edx,len_num2
	mov  ecx,num2_txt
	mov  ebx,1
	mov  eax,3
	int  0x80
	
	push rbp
	
	
	
	;converte o primeiro numero para int
	;int atoi (const char * str);
	mov rdi, num1_txt
	call atoi
	mov [num1], rax
	
	;converte o segundo numero para int
	mov rdi, num2_txt
	call atoi
	mov [num2], rax
	
	
	;recupera e soma os dois numeros
	mov rbx,[num1]
	mov rcx,[num2]
	add rbx,rcx
	
	mov [soma], rbx
	
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
	
	pop rbp
	
	
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
