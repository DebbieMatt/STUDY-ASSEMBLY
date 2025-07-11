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
msg     db              "No da lista contem: %d",13, 10, 0
msg2    db               "debug: %d",13,10,0
section .bss
head    resd            1
newItem resd            1
lastItem resd           1

section .text
    global main
    extern printf
    extern malloc

main:
        mov     dword [ head ], NULL        ; head = 0
        mov     dword [ newItem ], NULL     ; newItem = 0 
        mov     dword [lastItem ], NULL     ; lastItem = 0
       
    
do_while_1:
        
        mov     rdi, LLSIZE
        call    malloc                      ; eax = malloc(LLSIZE)
        mov    dword [newItem], eax         ; newItem = eax  
        
        mov     ecx, dword [limit]          ; ecx = limit
        
        mov     ebx, eax                    ; 
        mov     [ ebx ], dword NULL         ; eax-> next = NULL    
        mov     [ ebx + nr ], ecx           ; eax-> nr  = ecx
        ;;; debug
        push rdx
        push rax
        xor rdx,rdx
        mov edx, [ebx+nr]
       mov   rdi,msg2
       mov   rsi, rdx   
       mov   rax,0
       call printf  
        pop rax
        pop rdx
        
        
        cmp     dword [ head ], NULL        ; if (head == NULL) {
        jne     parte_else 
        mov     [ head ], eax               ;      head = eax;
        mov     [lastItem], eax             ;      lastItem = eax; }
        jmp     fim_if
        
parte_else:
        mov   ebx, dword [lastItem]
        mov   edx, [newItem]
        mov    [ebx], edx      ; lastItem -> next = newItem 
        mov   dword [lastItem], edx;  lastItem = newItem;
fim_if: 
        mov     ecx, dword [limit]
        dec ecx
        mov    dword [limit],ecx
        cmp  ecx,0
        jne do_while_1
  
  
        mov   ecx, 5
        mov   dword [limit], ecx   ; limit = 5
        
        mov	ebx,dword [ head ]
        mov     [lastItem], ebx    ; lastItem = head
        
printano:
      
      xor rdx,rdx
      mov edx, [ebx+nr]   ;  edx = lastItem -> nr

       mov   rdi,msg
       mov   rsi, rdx   
       mov   rax,0
       call printf      ; printf("Elemento: %d\n", lastItem -> nr );
      
       mov    ebx,[lastItem]
       mov   ebx, [ebx] ; ebx = lastItem ->next
       mov   [lastItem],ebx  ; lastItem = ebx.  note que mov[lastItem], ebx nao funciona
       
       
       mov  ecx, dword [limit]
       dec  ecx
       mov  dword [limit], ecx
       
       cmp  ecx,0
       jne  printano
        
        
        mov     ebx,0   ;successful termination of program
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kernel
