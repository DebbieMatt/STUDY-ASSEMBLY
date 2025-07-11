; float1.asm    


; Codigo C equivalente
;#include <stdio.h>
 
;int main()
;{
;  double a,b;
;  double sum, dif, mult, div;
;
;  printf("Entre com o valor de a:");
;  scanf ("%f",&a);
;  printf("Entre com o valor de b:");
;  scanf ("%f", &b);
;   sum = a+b;
;   dif = a - b;
;   mult = a * b;
;   div = a/b ;
;  printf("Soma: %f\n",sum);
;  prinff("Diferença: %f\n",dif);
;  printf("Multiplicação: %f\n",mult);
;  printf("Divisao: %f\n",div);
;  
;}
	
        
        extern	printf; 
        extern  scanf
        section .data		; 
msg1:	db "Entre com o valor de a:", 0	; 
msg2:   db "Entre com o valor de b:",0;
msg3:   db "Soma: %f",13,10,0
msg4:   db "Diferença: %f",13,10,0
msg5:   db "Multiplicação: %f",13,10,0
msg6:   db "Divisao: %f",13,10,0
fmt:    db "%f", 0                  ; String de formato do scanf, "\n",'0'
a       dq  0
b       dq  0
sum     dq  0
dif     dq  0
mult    dq  0
divisao     dq  0

      

        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
       
       
        mov  rdi,msg1
        mov  rax, 0
        call printf
       
        mov  rdi, fmt
        mov  rsi, a
        mov  rax,1
        call scanf
       
        mov  rdi,msg2
        mov  rax, 0
        call printf
       
        mov  rdi, fmt
        mov  rsi, b
        mov rax,1
        call scanf
       
        fld   qword[a]  ; armazena a no topo da pilha (st0)
        fadd  qword[b]  ; st0 += b
        fst   qword[sum] ;  sum = st0  (st0 não eh desempilhado)
        
        fsub qword [b]  ; st0 -= b
        fst  qword [dif] ; dif = st0
        
        fmul qword [b]  ; st0 *= b
        fst  qword [mult] ; mult = st0
        
        fdiv qword [b]  ; st0 /= b
        fst  qword [divisao]
        
        
        mov  rdi,msg3
        movq  xmm0,[a]
        mov  rax, 1
        call printf
        
        
            mov  rdi,msg4
        movq  xmm0,[b]
        mov  rax, 1
        call printf
   
	        mov  rdi,msg5
        movq  xmm0,[mult]
        mov  rax, 1
        call printf
	
		        mov  rdi,msg6
        movq  xmm0,[divisao]
        mov  rax, 1
        call printf
	
	pop  rbp
	ret
	
	