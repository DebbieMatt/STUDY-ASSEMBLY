;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
struc   linklist
	next:	resd	1
	nr:     resd    1
endstruc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
%define NULL            0
%define LLSIZE          8
section .data
limit   dd              5
msg     db              'No da lista contem: %d', 10, 0
section .bss
head    resd            1
newItem resd            1

section .text
    global main
    extern printf
    extern malloc

main:
        mov     dword [ head ], NULL        ; head = 0
        mov     dword [ newItem ], NULL     ; newItem = 0 
        xor     rcx,rcx
        mov     ecx, [ limit ]  ; ecx = 5

makeNode:
        push    rcx     ; empilha rcx
        mov     rdi, LLSIZE
        call    malloc                      ; rax = malloc(LLSIZE)
        pop     rcx
        cmp     dword [ head ], NULL        ; if (head == NULL) {
        jne     notFirst 
        mov     [ head ], eax               ;      head = rax;
                                            ;
notFirst:
        mov     ebx, eax                    ; 
        mov     [ ebx ], dword NULL         ; eax-> next = NULL    
        mov     [ ebx + nr ], ecx           ; eax-> nr  = ecx
        
        cmp     dword [ newItem ], NULL
        je      notFirst2
        mov     edi, dword [ newItem ]
        mov     dword [ edi + next ], ebx

notFirst2:
        mov     dword [ newItem ], ebx ; 
        ; newItem = ebx (malloc(LLSIZE)

        loop    makeNode                    ; make next node, if not done yet.

        mov     ecx, dword [ limit ]
        mov	ebx,dword [ head ]
printNode:
        push    rcx
        xor     rdi, rdi
        xor     rsi,rsi
        xor     rdx,rdx
        
        mov     dword [ newItem ], ebx      
        mov      esi,    dword [ ebx + nr ]
        mov      edi, msg
        mov      rax,0
        call    printf
        
        mov     ebx, dword [ ebx ]
        pop     rcx
        loop    printNode

done:
        mov     ebx,0   ;successful termination of program
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kernel
