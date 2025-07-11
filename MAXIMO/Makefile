max:    max.o  maximo.o
	gcc -o max max.o maximo.o
max.o:  max.c
	gcc -c max.c
maximo.o:  maximo.asm
	nasm -f elf64 maximo.asm -o maximo.o