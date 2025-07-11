#include <stdio.h>

struct empregado {
    float salario;
    char   nome[64];
    int    idade;
    char   sexo;
};

struct empregado  emp = {
    1000000.0,
    "Dr Milionário",
    100,
    'M'};

int main (void)
{
  printf("%f\n",emp.salario);
  printf("%s\n",emp.nome);
  printf("%d\n",emp.idade);
  printf("%c\n",emp.sexo);
   
    
    
  printf("Entre com o salario:");
  scanf("%f",&(emp.salario));
  printf("Entre com o nome:");
  scanf("%s",&(emp.nome));
  printf("Entre com a idade:");
  scanf("%d",&(emp.idade));


  printf("Novos valores:\n");
   
  printf("%f\n",emp.salario);
  printf("%s\n",emp.nome);
  printf("%d\n",emp.idade);
  printf("%c\n",emp.sexo);
   
  return 0;
    
}  
    
    

    