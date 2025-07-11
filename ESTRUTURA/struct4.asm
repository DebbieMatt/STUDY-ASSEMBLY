;Defining The Structure
;In C

;struct foo
;{
;    short  a;          /* 2 bytes */
;    int    b;          /* 4 bytes */
;   char   c;          /* 1 byte  */
;    int    d;          /* 4 bytes */
;    char   e[ 6 ];     /* 6 bytes */
;                       /* Total:  17 bytes, do the math */
;};
  
  

;In Assembly Language

;struc   mystruct
;	a:	resw	1
;	b:	resd	1
;	c:	resb	1
;	d:	resd	1
;	e:	resb	6
;endstruc
  
  

;Instatiating The Structure
;In C

;struct foo s;
  

;In Assembly Language


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
struc   mystruct
	a:	resw	1
	b:	resd	1
	c:	resb	1
	d:	resd	1
	e:	resb	6
endstruc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
section .data
aData:  dw      0

struct:
    istruc mystruct
        at a, dw        -1
        at b, dd        0x12345678
        at c, db        ' '
        at d, dd        23
        at e, db        'Gary', 0
    iend

mysize: dd     $ - struct
msg:    db     'Tamanho da estrutura eh %d', 10, 0
msg1:   db     'struct + b = %d', 10, 0
msg2:   db     'pStru + b = %d', 10, 0

zData:  dw     0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
aBss:   resw    1

pStru:	resd	1         ; 

zBss:   resd    1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text
    global main
    extern printf
    extern scanf
    extern malloc

main:                                 

        mov     rdi,msg
        mov     rsi,[mysize]
        mov     rax,0
        call    printf
        

;; Para estruturas estaticas
	mov	eax, 7                    
	mov	dword [ struct + b ], eax  ; move um valor na estrutura  *(struct+b) = eax
	xor     rsi,rsi
        mov     esi, dword [ struct + b ]       ; seg parametro para printf pega o valor   esi = *(struct+b)
        mov     rdi, msg1                     ;  prim parametro para printf
        mov     rax,0
        call    printf                     ; print it out
        ; printf("struct + b = %d",*(struct+b));
        
;; para estruturas dinamicas

        mov	rax, 17                    ; tamanho da estrutura
        mov     rdi,rax                    ; malloc(17)
        call    malloc                     ; get the memory allocated
        mov     dword [ pStru ], eax       ; pStru = malloc(17)
        

        mov	ebx, dword [ pStru ]       ; ebx = pStru
        mov     dword [ ebx + b ], 44h     ; pStru->b = 44h
        xor     rsi,rsi  ; rsi=0 
        mov     esi, dword [ ebx + b ]          ; pega o valor
            ;printf("pStru + b = %d", pStru ->b);
        mov     rdi, msg2
        mov     rax,0
        call    printf                     ; print it out
        

;; The final part of the program must be a call to the operating system to exit
;;; the program.
        mov     ebx,0   ;successful termination of program
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kernel

;; Notice the file just ends.

  

