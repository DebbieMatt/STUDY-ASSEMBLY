# STUDY of ASSEMBLY

![AssemblyScript](https://img.shields.io/badge/assembly%20script-%23000000.svg?style=for-the-badge&logo=assemblyscript&logoColor=white)
![Status](https://img.shields.io/static/v1?label=STATUS&message=INCOMPLETO&color=orange&style=for-the-badge)

> Consiste em um repositório destinado a armazenar códigos e programas realizados na aula de Arquitetura de Computadores.

## 💻 Pré-requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:

- Você instalou a versão mais recente de `GCC` e rodar em compilador/editor de texto, como: <a href= "https://kate-editor.org/pt-br/" > Editor Kate </a>
  
- Você tem uma máquina `Windows / Linux / Mac`.
- Você leu [Especificações de Instrução e Execução de programas Assembly](https://github.com/DebbieMatt/STUDY-ASSEMBLY/blob/06d41ada4297e9db33d40f4e6aaa40116676b09e/Microsoft%20Word%20-%20resumo_assembly.pdf).

## 🚀 Instalando o Trabalho Final

Para clonar o código do caixa de supermercado, no Linux / macOS / Windows, basta abrir o terminal e colar o seguinte comando:

```
git clone https://github.com/DebbieMatt/STUDY-ASSEMBLY.git
```

## 📫 Contribuindo para a manutenção

Para contribuir com projeto final e nos auxiliar a continuar desenvolvendo melhor, aprimorando e torna-lo mais eficientes, siga estas etapas:

1. Bifurque este repositório.
2. Crie um branch: `git checkout -b <nome_branch>`.
3. Faça suas alterações e confirme-as: `git commit -m '<mensagem_commit>'`
4. Envie para o branch original: `git push origin <nome_do_projeto> / <local>`
5. Crie a solicitação de pull.

Como alternativa, consulte a documentação do GitHub em [como criar uma solicitação pull](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).


## Comandos padrão para execução do programa no terminal

> Cada código neste repositório tem sua própria linha de comando, que deve ser executado no terminal para que compile e execute em sua máquina.

`nasm -f elf64 -F stabs hello.asm -o hello.o` - Este comando é para executar o seu primeiro programa chamado `Hello Word`.

Abrir o local onde esta armazenado o código:

![Print](https://github.com/DebbieMatt/STUDY-ASSEMBLY/blob/b9047be4bae481fcef6aac8b3a2ec733bfced354/Print.png)

Seguidamente, inserir o seguinte código:

`ld -m elf_x86_64 hello.o -o hello`

Por fim, chamar a arquivo executável:

`./hello` 

### Tabela de chamadas do sistema Linux: [LINK](https://faculty.nps.edu/cseagle/assembly/sys_call.html).
Para melhor orientar a compreensão do código.

## 🤝 Colaboradores

Agradecemos às seguintes pessoas que contribuíram para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/DebbieMatt" title="Colaboradora">
        <img src="https://avatars.githubusercontent.com/u/112919058?v=4" width="100px;" alt="Foto da Débora"/><br>
        <sub>
          <b>Débora Mateus</b>
    </td>
  </tr>
</table>

## 😄 Seja um dos contribuidores

Quer fazer parte desse projeto? Clique [AQUI](CONTRIBUTING.md) e leia como contribuir.

## 📝 Licença

Esse projeto está sob licença. Veja o arquivo [LICENÇA](LICENSE.md) para mais detalhes.
