; Assembly:	  nasm -f elf64 -F dwarf sumIntegers.asm
; Link:		  gcc sumIntegers.o -fno-pie -no-pie -o sumIntegers
; Run:		  ./sumIntegers


; Código em C equivalente
; #include <stdio.h>
; int a = 0;
; int b = 0;
; int c = 0;
; int main()
; {
;   printf ("Entre com um inteiro:");
;   scanf ("%d",&a);
;   printf ("Entre com um inteiro:");
;   scanf ("%d",&b);
;   c = a+b;
;   printf("A soma dos dois inteiros eh:%d\n",c);
;   return 0;
; }
	

        extern	printf		                           ; função C a ser chamada
        extern  scanf 
        section .data		                           ; Seção de dados com variáveis globais
a:      dd  0                                          ; variável inteira
b:      dd  0                                          ; variável inteira
c:      dd  0                                          ; variável inteira
msg1:	db "Entre com um inteiro:", 0	               ; string em C
msg2:   db "A soma dos dois inteiros eh %d",13,10,0    ; string em C
fmt:    db "%d", 0                                     ; string de formato para scanf

        section .text                                  ; Seção de código

        global main		                               ; ponto de entrada padrão do gcc
main:				                                   ; rótulo para ponte de entrada padrão
        push    rbp		                               ; criar quadro de pilha para a main
        mov     rbp,rsp
	
        mov	rdi,msg1                                   ; primeiro parâmetro em 64 bits: rdi
	mov	rax,0		                                   ; não há pontos flutuantes então rax = 0
        call    printf		                           ; chama a função printf
         
	mov     rdi,fmt                                    ; rdi = fmt
	mov     rsi, a                                     ; rsi = &a
	mov     rax, 0                                     ; não há pontos flutuantes
	call    scanf 
	
        mov	rdi,msg1                                   ; primeiro parâmetro em 64 bits: rdi
	mov	rax,0		                                   ; não há pontos flutuantes então rax = 0
        call    printf		                           ; chama a função printf

	
	mov     rdi,fmt        ; rdi = fmt
	mov     rsi, b         ; rsi = &b
	mov     rax, 0         ; não há pontos flutuantes
	call    scanf 
	
	xor    rax,rax         ; rax = 0 o mesmo que mov rax,0
	mov    eax,[a]
	mov    ebx,[b]
	add    eax,ebx         ; eax = eax+ebx
	mov    [c],eax         ; c = a+b
	
	mov    rdi,msg2
	mov    rsi,rax         ; variavel inteira c continua em rax
	mov    rax,0
	call   printf
	
	
        leave                  ; restaura para o quadro de pilha anterior
                               ; a mesma coisa que mov rsp,rbp 
                               ;                   pop rbp
	mov	rax,0		           ; valor de retorno em rax
	ret			               ; return
