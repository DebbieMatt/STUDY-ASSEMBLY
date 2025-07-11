        section .data

fmt0        db    "%f",13,10,0
fmt1        db    "%s",13,10,0
fmt2        db    "%d",13,10,0
fmt3        db    "%c",13,10,0

fmt4        db    "%f",0
fmt5        db    "%s",0
fmt6        db    "%d",0
fmt7        db    "%c",0

fmt8        db   "Entre com o novo salario:",0
fmt9        db   "Entre com o novo nome:",0
fmt10       db   "Entre com a nova idade:",0

fmt11       db   "Novos valores",13,10,0

ePtr        dd    0


        struc   empregado
.salario      resd    1
.nome         resb    64
.idade        resd    1
.sexo         resb    1
        endstruc

emp       istruc  empregado
        at empregado.salario, dd 1000000.0 
        at empregado.nome, db "Dr Milionario",0
        at empregado.idade, dd 100
        at empregado.sexo, db 'm'
        iend

; os offsets são empregado.salario = 0 
;                empregado.nome = 4
;                empregado.idade = 65
;                empregado.sexo  = 66

        
        
        
; note que o . depois do 1000000 é importante, senão o 
; montador não reconhece 1000000 como float.
        
;emp poderia ser definida também desta forma:
;emp       istruc  empregado
;        at salario, dd 1000000.0 
;        at nome, db "Dr Milionario",0
;        at idade, dd 100
;        at sexo, db 'm'
;        iend
; os offsets seriam salario = 0 
;                   nome = 4
;                   idade = 65
;                   sexo  = 66

%define TAM_EMPREGADO 73
        
        section .text
        global  main
        extern  malloc, scanf, printf
main:   push    rbp
        mov     rbp, rsp

        ; printf("%f\n",emp.salario);
        mov rdi, fmt0
        movq  xmm0,[emp+empregado.salario]
        cvtss2sd  xmm0,xmm0  ; senão imprime zero.
        mov   rax,1
        call  printf
        ; printf ("%s\n",emp.nome);        
        mov rdi, fmt1
        mov rsi,emp+empregado.nome  ; note que emp.nome é um endereço
        mov   rax,0
        call  printf
        
        mov rdi, fmt2
        mov rsi,[emp+empregado.idade]  ; note que emp.idade é um *valor*
        mov   rax,0
        call  printf
        
        mov rdi, fmt3
        mov rsi,[emp+empregado.sexo]  ; note que emp.sexo é um *valor*
        mov   rax,0
        call  printf

        ; trocando os valores da estrutura estática

        ;printf("Entre com o novo salário:");
        mov  rdi, fmt8
        mov  rax,0
        call  printf
        
        ; scanf("%f",&(emp.salario));
        mov rdi, fmt4
        mov  rsi,emp+empregado.salario
        mov rax,0
        call scanf
        
        ;printf("Entre com o novo nome:");
        mov rdi,fmt9
        mov rax,0
        call printf
        
        ; scanf("%s",&(emp.nome));
        mov rdi, fmt5
        mov rsi, emp+empregado.nome
        mov rax,0
        call scanf
        
        ;printf("Entre com a nova idade:");
        mov rdi,fmt10
        mov rax,0
        call printf
        
        ; scanf("%d",&(emp.idade));
        mov rdi, fmt6
        mov rsi, emp+empregado.idade
        call scanf
        
        ;printf("Novos valores:\n");
        mov rdi,fmt11
        mov rax, 0
        call printf
        
        
        
        ; printf("%f",emp.salario);
        mov rdi, fmt0
        movq  xmm0,[emp+empregado.salario]
        cvtss2sd  xmm0,xmm0  ; senão imprime zero.
        mov   rax,1
        call  printf
        
        ; printf ("%s",emp.nome);        
        mov rdi, fmt1
        mov rsi,emp+empregado.nome  ; note que m.nome é um endereço
        mov   rax,0
        call  printf
        
        mov rdi, fmt2
        mov rsi,[emp+empregado.idade]  ; note que emp.idade é um *valor*
        mov   rax,0
        call  printf
        
        mov rdi, fmt3
        mov rsi,[emp+empregado.sexo]  ; note que emp.sexo é um *valor*
        mov   rax,0
        call  printf
        
        
        leave
        xor     eax, eax
        ret
