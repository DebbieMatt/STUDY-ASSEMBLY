; arith.asm    


; Codigo C equivalente
;  #include <stdio.h>
;int main()
;{
;   int first, second, add, subtract, multiply;
;   float divide;
; 
;   printf("Entre dois inteiros\n");
;   scanf("%d%d", &first, &second);
; 
;   add = first + second;
;   subtract = first - second;
;   multiply = first * second;
;   divide = (float)second /(float) first ;   //typecasting
; 
;   printf("Soma = %d\n",add);
;   printf("Diferenca = %d\n",subtract);
;   printf("Multiplicacao = %d\n",multiply);
;   printf("Divisao = %.2f\n",divide);
; 
;   return 0;
;}
;
	

        extern	printf; 
        extern  scanf
        section .data	

first   dd  0
second  dd  0
_add     dd  0
subtract dd 0
multiply dd 0
divide   dq 0


msg1:	db "Entre dois inteiros:", 0	
fmt:    db "%d%d", 0                  
msg2:   db "Soma = %d",13,10,0 
msg3:   db "Diferenca = %d",13,10,0
msg4:   db "Multiplicacao = %d",13,10,0
msg5:   db "Divisao = %.2f",13,10,0


        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
	
	mov	rdi,msg1         ; primeiro parametro para o printf 
	mov	rax,0		; nao tem parametros de ponto flutuante
        call    printf		; chama a funcao em C

        mov     rdi,fmt       ; primeiro parametro para scanf
        mov     rsi, first        ; segundo parametro para scanf (first eh um endereço)
        mov     rdx, second      ; terceiro parametro para scanf (second eh um endereco)
        ;mov     rax, 0
        call    scanf
   
        ;   add = first + second;
        mov    rax,[first]
        mov    rbx,[second]
        add    rax,rbx
        mov    [_add], rax
        
        ;   subtract = first - second;
        mov    rax,[first]
        mov    rbx,[second]
        sub    rax,rbx
        mov    [subtract], rax
        
        ;   multiply = first * second;
        ;   mul  reg
        ;   edx:eax <--  eax* reg
        ;  no exemplo abaixo reg vale ebx
        ;  
        mov  rax,0
        mov  rbx,0
        mov  eax,[first]
        mov  ebx,[second]
        mul  ebx
        mov  [multiply], eax
        
        ;  divisao em ponto flutuante: primeiro eh necessario
        ; converter o inteiro para ponto flutuante e carrega-lo na pilha
      
        
        ;A  FPU (floting point unit) tem  8 registradores, st0 ate st7, que formam uma pilha . 
        ;Numeros sao empilhados na pilha a partir da memoria , e sao desempilhados da pilha para a memoria. 
        ;As instruçoes FPU as instruçoes da FPU irao primeiro desepilhar os dois primeiros itens da pilha, agir neles
        ;e empilhar o resultado de volta na pilha.
        ; divide = first / (float)second;   //typecasting
        
        
        fild	dword [first] ; f (coprocessador) integer load (armazena em st0)
        fild    dword [second] ; f (coprocessador) integer load (armazena em st1)
        fdiv    st0,st1
        fst     qword [divide]  ; armazena st1 em divide (e desempilha st1), note que divide é qword
        
        mov     rdi, msg2
        mov     rsi, [_add]  ; variavel add (que na realidade eh o conteudo de a).
        mov     rax, 0
        call    printf  
        
        mov     rdi, msg3
        mov     rsi, [subtract]  ; variavel subtract (que na realidade eh o conteudo de subtract).
        mov     rax, 0
        call    printf  
        
        mov     rdi, msg4
        mov     rsi, [multiply]  ; variavel multiply (que na realidade eh o conteudo de multiply).
        mov     rax, 0
        call    printf  
        
        mov     rdi, msg5
        movq     xmm0, qword [divide]  ; variavel divide (que na realidade eh o conteudo de divide).
        mov     rax, 1
        call    printf  
        
        
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret			; 