# STUDY of ASSEMBLY

## Comandos padrão para execução do programa no terminal

`nasm -f elf64 -F stabs hello.asm -o hello.o`

Abrir o local onde esta armazenado o código:

![Print](https://github.com/DebbieMatt/STUDY-ASSEMBLY/blob/b9047be4bae481fcef6aac8b3a2ec733bfced354/Print.png)

Seguidamente, inserir o seguinte código:

`ld -m elf_x86_64 hello.o -o hello`

Por fim, chamar a arquivo executável:

`./hello` 

### Tabela de chamadas do sistema Linux: [LINK](https://faculty.nps.edu/cseagle/assembly/sys_call.html).
Para melhor orientar a compreensão do código.
