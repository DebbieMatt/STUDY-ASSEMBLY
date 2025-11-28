# STUDY OF ASSEMBLY

![AssemblyScript](https://img.shields.io/badge/assembly%20script-%23000000.svg?style=for-the-badge&logo=assemblyscript&logoColor=white)
![Status](https://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=orange&style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)

> Repositório dedicado ao estudo e prática de programação em Assembly x86-64, desenvolvido como parte da disciplina de Arquitetura de Computadores. Contém exemplos práticos, exercícios e implementações de algoritmos em baixo nível.

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Estrutura do Repositório](#-estrutura-do-repositório)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Como Usar](#-como-usar)
- [Exemplos de Código](#-exemplos-de-código)
- [Recursos Adicionais](#-recursos-adicionais)
- [Contribuindo](#-contribuindo)
- [Licença](#-licença)

## 🎯 Sobre o Projeto

Este repositório contém uma coleção abrangente de programas em Assembly x86-64, abordando desde conceitos básicos até implementações mais avançadas. Os códigos foram desenvolvidos utilizando o assembler NASM (Netwide Assembler) e são voltados para sistemas Linux 64-bit.

### Objetivos de Aprendizado

- Compreender a arquitetura x86-64 e seu conjunto de instruções
- Dominar operações básicas: entrada/saída, aritmética e manipulação de dados
- Implementar estruturas de dados em baixo nível
- Trabalhar com ponto flutuante e operações matemáticas
- Manipular arquivos e gerenciar memória

## 📁 Estrutura do Repositório

```
STUDY-ASSEMBLY/
├── HELLO WORD/              # Primeiro programa: Hello World
├── HELLO WORD + BOM DIA/    # Variações do programa inicial
├── ARITMÉTICA/              # Operações aritméticas básicas
├── INTEIROS E SOMA/         # Trabalho com números inteiros
├── SOMA/                    # Exemplos de adição
├── SOMA E INTEIROS/         # Operações combinadas
├── FLOAT/                   # Números de ponto flutuante
├── LÊ 2 FLOATS/            # Entrada de números decimais
├── SOMA 2 FLOAT/           # Operações com float
├── ESTRUTURA + SOMA 2 FLOAT/ # Structs e floats
├── ESTRUTURA/               # Estruturas de dados
├── ARRAY/                   # Arrays e vetores
├── MATRIZ/                  # Matrizes bidimensionais
├── BUBBLESORT/             # Algoritmo de ordenação
├── LINK LIST/              # Listas encadeadas
├── EXPRESSÃO/              # Avaliação de expressões
├── MAXIMO/                 # Busca de valores máximos
├── DISTANCIA/              # Cálculos de distância
├── LOCAL/                  # Variáveis locais
├── IMPRIME TIPOS/          # Impressão de diferentes tipos
├── IMPRIMI NUMERO/         # Saída numérica
├── ESCREVER E LER ARQUIVO/ # Operações de I/O em arquivos
├── FLUXOGRAMA + FPGA EXECUTANDO/ # Diagramas e implementações
├── PRIMEIROS PROGRAMAS DE ASSEMBLY/ # Códigos iniciais
├── Pratica3/               # Exercícios práticos
├── exemplo11/              # Exemplos numerados
├── exemplo14/
├── exemplo20/
├── SLIDES ASSEMBLY/        # Material de apoio
└── Documentos/
    ├── Microsoft Word - resumo_assembly.pdf
    ├── Organização estruturada de computadores - Tanenbaum.pdf
    ├── assembly64.pdf
    └── tabela_chamada_sistema
```

## 💻 Pré-requisitos

Antes de começar, certifique-se de ter os seguintes componentes instalados:

### Software Necessário

- **NASM (Netwide Assembler)**: Assembler para código Assembly
- **GCC (GNU Compiler Collection)**: Para linkedição
- **LD (GNU Linker)**: Vinculador de objetos
- **Editor de Texto**: [Kate](https://kate-editor.org/pt-br/), VSCode, Vim ou similar

### Sistema Operacional

- `Linux` (recomendado - Ubuntu, Debian, Fedora, etc.)
- `macOS` (com adaptações)
- `Windows` (via WSL - Windows Subsystem for Linux)

### Instalação das Ferramentas

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install nasm gcc build-essential
```

#### Fedora
```bash
sudo dnf install nasm gcc
```

#### macOS
```bash
brew install nasm gcc
```

## 🚀 Instalação

### Clone o Repositório

```bash
git clone https://github.com/DebbieMatt/STUDY-ASSEMBLY.git
cd STUDY-ASSEMBLY
```

## 📖 Como Usar

### Processo de Compilação e Execução

O processo padrão para compilar e executar programas Assembly segue três etapas:

#### 1. Montagem (Assembly)
Converte o código Assembly em código objeto:

```bash
nasm -f elf64 -F stabs nome_arquivo.asm -o nome_arquivo.o
```

**Parâmetros:**
- `-f elf64`: Formato de saída ELF 64-bit
- `-F stabs`: Inclui informações de debug
- `-o`: Especifica o arquivo de saída

#### 2. Linkedição (Linking)
Vincula o código objeto criando o executável:

```bash
ld -m elf_x86_64 nome_arquivo.o -o nome_arquivo
```

**Parâmetros:**
- `-m elf_x86_64`: Especifica a arquitetura alvo
- `-o`: Nome do executável final

#### 3. Execução
Execute o programa compilado:

```bash
./nome_arquivo
```

### Exemplo Prático: Hello World

```bash
# Navegue até o diretório
cd "HELLO WORD"

# Compile o código
nasm -f elf64 -F stabs hello.asm -o hello.o

# Linkedite
ld -m elf_x86_64 hello.o -o hello

# Execute
./hello
```

## 💡 Exemplos de Código

### Estrutura Básica de um Programa Assembly

```asm
section .data
    ; Dados inicializados (variáveis globais)
    mensagem db 'Hello, World!', 0xA
    tamanho equ $ - mensagem

section .bss
    ; Dados não inicializados (buffer)
    buffer resb 64

section .text
    global _start

_start:
    ; Código principal
    ; Escrever na saída padrão (stdout)
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, mensagem   ; ponteiro para string
    mov rdx, tamanho    ; tamanho da string
    syscall

    ; Sair do programa
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; código de saída: 0
    syscall
```

### Principais Syscalls Linux x86-64

| Número | Nome | Descrição |
|--------|------|-----------|
| 0 | read | Lê dados de um file descriptor |
| 1 | write | Escreve dados em um file descriptor |
| 2 | open | Abre um arquivo |
| 3 | close | Fecha um file descriptor |
| 60 | exit | Termina o processo |

Para a tabela completa, consulte: [Linux System Call Table](https://faculty.nps.edu/cseagle/assembly/sys_call.html)

## 📚 Recursos Adicionais

### Documentação Incluída

- **resumo_assembly.pdf**: Resumo das instruções e conceitos fundamentais
- **assembly64.pdf**: Guia completo de Assembly x86-64
- **Organização estruturada de computadores - Tanenbaum.pdf**: Referência bibliográfica
- **tabela_chamada_sistema**: Referência rápida de syscalls

### Links Úteis

- [NASM Documentation](https://www.nasm.us/doc/)
- [Intel® 64 and IA-32 Architectures Software Developer Manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
- [Linux System Call Table](https://faculty.nps.edu/cseagle/assembly/sys_call.html)
- [x86-64 Assembly Language Programming with Ubuntu](http://www.egr.unlv.edu/~ed/assembly64.pdf)

## 🤝 Contribuindo

Contribuições são muito bem-vindas! Este projeto pode ser melhorado com novos exemplos, correções e otimizações.

### Como Contribuir

1. **Fork este repositório**
2. **Crie uma branch para sua feature:**
   ```bash
   git checkout -b feature/minha-contribuicao
   ```
3. **Commit suas mudanças:**
   ```bash
   git commit -m 'feat: adiciona exemplo de recursão'
   ```
4. **Push para a branch:**
   ```bash
   git push origin feature/minha-contribuicao
   ```
5. **Abra um Pull Request**

### Diretrizes de Contribuição

- Siga o padrão de nomenclatura existente
- Comente seu código adequadamente
- Inclua exemplos de uso quando aplicável
- Teste seus programas antes de submeter
- Atualize a documentação se necessário

Para mais detalhes, veja [CONTRIBUTING.md](CONTRIBUTING.md)

## 👥 Colaboradores

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/DebbieMatt" title="Autora do Projeto">
        <img src="https://avatars.githubusercontent.com/u/112919058?v=4" width="100px;" alt="Foto da Débora"/><br>
        <sub>
          <b>Débora Mateus</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.

---

<div align="center">

**[⬆ Voltar ao topo](#study-of-assembly)**

Desenvolvido com 💙 por [Débora Mateus](https://github.com/DebbieMatt)

</div>
