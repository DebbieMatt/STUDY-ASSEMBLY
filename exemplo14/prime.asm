; printnum.asm    


;#include<stdio.h>
;   int n, i = 3, count, c;
; 
;int main()
;{
; 
;   printf("Entre com o numero de primos:");
;   scanf("%d",&n);
; 
;   if ( n >= 1 )
;   {
;      printf("Os primeiros %d numeros primos sao :\n",n);
;      printf("2\n");
;   }
; 
;   count = 2; 
;   while (count <= n )
;   {
;      for ( c = 2 ; c <= i - 1 ; c++ )
;      {
;         if ( i%c == 0 )
;            break;
;      }
;      if ( c == i )
;      {
;         printf("%d\n",i);
;         count++;
;      }
;      i++;
;   }
; 
;   return 0;
;}

        extern	printf; 
        extern  scanf
        extern  getchar
        section .data	

n     dd  0
i     dd  3   ; i = 3
count dd  0   ;
c     dd  0   ;
msg1:	db "Entre com o numero de primos:", 0	
fmt:    db "%d", 0                  
msg2:   db "Os primeiros %d numeros primos sao: ",13,10,0 
msg3:   db "2",13,10,0
msg4:   db "%d",13,10,0
msg5:   db "Entrei no while count = %d, n = %d",13,10,0
msg6:   db "Entrei no for: c = %d, i = %d",13,10,0

        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
	
	mov	rdi,msg1         ; primeiro parametro para o printf 
	mov	rax,0		; nao tem parametros de ponto flutuante
        call    printf		; chama a funcao em C

        mov     rdi,fmt       ; primeiro parametro para scanf
        mov     rsi, n        ; segundo parametro para scanf (num eh um endereço)
        ;mov     rax, 0
        call    scanf

        mov    eax, dword [n]    ;   if ( n >= 1 )  {
        cmp    eax, 1
        jl     end_if_1    ; pula o if
        
        mov    rdi, msg2     ;   printf("Os primeiros %d numeros primos sao :\n",n);
        mov    rsi, [n]
        mov    rax, 0
        call   printf 
        
        mov    rdi, msg3     ;      printf("2\n");
        mov    rax, 0
        call   printf 
                              ; }
end_if_1:        
        
        mov eax, 2
        mov [count], eax  ; count = 2 ;

while_loop:
        mov  ecx, dword [count] ; 
        mov  edx, dword [n]   ;
        cmp  ecx, edx   ; count <=n
        ja   fim_while_loop  ; se count for maior do que n vai pro fim do laco while
       
        ; DEBUG :  printf("Entrei no while count = %d, n = %d\n", count,n);
        ;mov  rdi, msg5
        ;mov  rsi, [count]
        ;mov  rdx, [n]
        ;call printf
       
       
        mov eax, 2
        mov [c], eax  ; c = 2
        
for_loop:
       mov edx, dword [c]
       mov ecx, dword [i]
       dec rcx      ; i - 1
       cmp rdx, rcx  ;  
       ja  end_for_loop ;  c <= i-1
       
       ;  eh necessario agora dividir i por c e se obter o resto da divisao
       ;  na divisao temos   edx:eax |  reg 
       ;                              __________
       ;                       edx      eax
       ;    o quociente fica em edx
       ;  reg no nosso caso sera ebx, mas poderia ser ecx
       
       ; DEBUG  printf("Entrei no for: c = %d, i = %d \n",c,i);
       
        ;mov  rdi, msg6
        ;mov  rsi, [c]
        ;mov  rdx, [i]
        ;call printf
       
        ; call getchar
       
       mov edx,0
       mov eax, dword [i]
       mov ebx, dword [c]
       div ebx
       cmp edx, 0   ; i%c == 0 ?
       je end_for_loop  ; break 
       mov eax, dword [c]  ; c++
       inc eax
       mov dword [c],eax
       
       
       jmp  for_loop
       
end_for_loop:
        
        ; if (c == i) {
        mov  edx, dword [c]
        mov  ecx, dword [i]
        cmp  edx, ecx
        jne  end_if_2
        
        ; corpo do if
        mov    rdi, msg4     ;   
        mov    rsi, [i]
        mov    rax, 0
        call   printf 
       ; count ++
        
        mov eax, dword [count]
        inc eax
        mov [count],dword eax  ; count ++
            
        
end_if_2 :          ; } 
        
        ; i++
        
        mov eax,dword [i]
        inc eax
        mov dword [i],eax
        
        jmp  while_loop
        
fim_while_loop:        
       
     
        
        
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret			; 