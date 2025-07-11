;void scrwrite (char *str, size_t size)
;                  rdi        rsi
global scrwrite
global kbdread
scrwrite:
    mov  edx, esi  ; move o tamanho para edx
    mov  ecx, edi  ; move para ecx o ponteiro da string
    mov  ebx, 1    ; descritor de arquvo = 1 = stdout
    mov  eax, 4    ; função 4 = write
    int  0x80
    ret


;void kbdread (char *str, size_t size)
;                 rdi       rsi
kbdread:
    mov edx, esi ; move o tamanho para edx
    mov ecx, edi ; ponteiro para o buffer para onde a leitura vai
    mov ebx, 2   ; descritor de arquivo = 2 = stdin
    mov eax, 3  ;  função 3 = read
    int 0x80
    ret
