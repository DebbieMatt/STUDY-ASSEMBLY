; printnum.asm    


; Codigo C equivalente
;  #include <stdio.h>
;
;
;int main (void)
;{
;  int num,i;
;  printf("Entre com um numero:");
;  scanf("%d",num);  
;  for (i = 0; i< num ; i++)
;  {
;    printf("%d", i);
;    printf (" ");    
;  }
;  printf("\n");
;  return 0;
;}
	

        extern	printf; 
        extern  scanf
        section .data	

num   dd  0
i     dd  0   ; i = 0
msg1:	db "Entre um numero:", 0	
fmt:    db "%d", 0                  
msg2:   db " ",0 
msg3:   db 13,10,0


        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
	
	mov	rdi,msg1         ; primeiro parametro para o printf 
	mov	rax,0		; nao tem parametros de ponto flutuante
        call    printf		; chama a funcao em C

        mov     rdi,fmt       ; primeiro parametro para scanf
        mov     rsi, num        ; segundo parametro para scanf (num eh um endereço)
        ;mov     rax, 0
        call    scanf

        
        
        

for_loop:
        mov     ecx, dword [num] 
        mov     edx, dword [i]
        cmp    ecx, edx        
        jna     fim_for_loop  ; i< num <==>  num >= i <==> num > i

        mov   rdi, fmt
        mov   rsi, [i]
        mov   rax, 0
        call  printf
        
        mov  rdi, msg2
        mov  rax, 0
        call printf
        
        mov   eax, dword [i] ; i++
        inc  eax
        mov  dword [i], eax
        
        jmp  for_loop
        
fim_for_loop:        
       
        mov   rdi, msg3
        mov   rax,0 
      
        call    printf  
        
        
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret			; 