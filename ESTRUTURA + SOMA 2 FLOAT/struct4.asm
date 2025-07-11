        section .data


fmt0        db    "%f",13,10,0
fmt1        db    "%s",13,10,0
fmt2        db    "%d",13,10,0
fmt3        db    "%c",13,10,0

fmt4        db    "%f",0
fmt5        db    "%s",0
fmt6        db    "%d",0
fmt7        db    "%c",0

fmt8        db   "Entre com o salario:",0
fmt9        db   "Entre com o nome:",0
fmt10       db   "Entre com a idade:",0
fmt12       db   "Entre com o sexo:",0
fmt11       db   "Novos valores",13,10,0

ePtr        dq    0


        struc   empregado
.salario      resd    1
.nome         resb    64
.idade        resd    1
.sexo         resb    1
        endstruc




%define TAM_EMPREGADO 73 ; 4+64+4 +1
        
        section .text
        global  main
        extern  malloc, scanf, printf,getchar

clean_buffer:
        call getchar  ;  deveria ser while(ch=getchar()!='\n');
        ret
        
        
        
main:   push    rbp
        mov     rbp, rsp

        mov rdi, TAM_EMPREGADO
        call malloc
        mov [ePtr],rax
        
        

        ; colocando os valores da estrutura dinâmica

        ;printf("Entre com o salário:");
        mov  rdi, fmt8
        mov  rax,0
        call  printf
        
        ; scanf("%f",&(ePtr->salario));
        mov rdi, fmt4
        mov rbx,[ePtr]
        lea  rsi,[rbx+empregado.salario]
        call scanf
        
        ;printf("Entre com o nome:");
        mov rdi,fmt9
        mov rax,0
        call printf
        
        ; scanf("%f",&(ePtr->nome));
        mov rdi, fmt5
        mov rbx,[ePtr]
        lea rsi, [rbx+empregado.nome]
        call scanf
        
        ;printf("Entre com a  idade:");
        mov rdi,fmt10
        mov rax,0
        call printf
        
        ; scanf("%f",&(ePtr->idade));
        mov rdi, fmt6
        mov rbx,[ePtr]
        lea rsi,[rbx+empregado.idade]
        call scanf

      
        
        ;printf("Entre com o sexo:");
        mov rdi,fmt12
        mov rax,0
        call printf
        
        call clean_buffer
        
        ; scanf("%c",&(ePtr->sexo));
        mov rdi, fmt7
        mov rbx,[ePtr]
        lea rsi,[rbx+empregado.sexo]
        call scanf

        
        ;printf("Novos valores:\n");
        mov rdi,fmt11
        mov rax, 0
        call printf
        
        ; printf("%f",m.salario);
        mov rdi, fmt0
        mov rbx,[ePtr]
        movq  xmm0,[rbx+empregado.salario]  ; aqui temos um valor
        cvtss2sd  xmm0,xmm0  ; senão imprime zero.
        mov   rax,1
        call  printf
        ; printf ("%s",m.nome);        
        mov rdi, fmt1
        mov rbx,[ePtr]
        add rbx,empregado.nome
        mov rsi,rbx  ; note que m.nome é um endereço
        mov   rax,0
        call  printf
        
        mov rdi, fmt2
        mov rbx,[ePtr]
        mov rsi,[rbx+empregado.idade]  ; note que m.idade é um *valor*
        mov   rax,0
        call  printf
        
        mov rdi, fmt3
        mov rbx,[ePtr]
        mov rsi,[rbx+empregado.sexo]  ; note que m.sexo é um *valor*
        mov   rax,0
        call  printf
        
        
        
        leave
        xor     eax, eax
        ret
