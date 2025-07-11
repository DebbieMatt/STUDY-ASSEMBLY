    extern printf
    extern scanf
    section .data
str0:   db     "Enter a positive integer: ",0
str1:   db     "%d",0
str2 :  db     "%d is a prime number.",13,10,0
str3 :  db     "%d is not a prime number.",13,10,0
str4 :  db     "ponto 1",13,10,0
n      dd     0
i      dd     0
flag   dd     0



    section .text
global main
main:
       push rbp
       mov rbp,rsp
     
        mov rdi, str0
        mov rax,0
        call printf

        
 
        mov rdi, str1
        mov rsi,n
        mov rax,0
        call scanf 
 
       ; traducao do código 
 
 	mov	edx,2
	mov	[i],edx	  ; (i=2)
loop_for_1: 
        mov	ebx,[i]
	inc	ebx
	mov	[i],ebx	;  ++i
	mov	eax,[n]
	shr	eax,1	 ;eax = n/2
	mov	edx,[i]
	cmp	edx,eax
	ja	fim_for_1
	mov     edx, 0
	mov	eax,[n]
	mov	ecx,[i]
	div	ecx
	cmp	edx,0    ; resto em edx
	jne	fim_if_1
	mov	eax,1
	mov 	[flag],eax	;flag = 1
	jmp	fim_for_1
fim_if_1:
	jmp loop_for_1
fim_for_1:    
         mov eax,[flag]
         cmp eax,0
         jnz parte_else_if_2
         mov rdi, str2
         mov rsi,[n]
         mov rax,0
         call printf
         jmp fim_if_2
parte_else_if_2:
         mov rdi,str3
         mov rsi,[n]
         mov rax,0
         call printf

fim_if_2:
 
 
 
 
           leave
           mov rax,0
           ret
