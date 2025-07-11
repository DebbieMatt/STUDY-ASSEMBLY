#include "stdio.h"


struct   empregado {
           float salario ;
           char nome[64];
           int idade ;
            char sexo ;
        };

        
struct   empregado emp = { 
          1000000.0 ,
          "Dr Milionario",
          100,
           'm'
      };
      
void main(void)
{
  printf("%f\n",emp.salario);   
  printf ("%s\n",emp.nome);   
  printf ("%d\n",emp.idade);   
  printf ("%c\n",emp.sexo); 
  printf("Entre com o novo salário:");
  scanf("%f",&(emp.salario));
  printf("Entre com o novo nome:");
  scanf("%s",&(emp.nome));
  printf("Entre com a nova idade:");
  scanf("%d",&(emp.idade));
  printf("Novos valores:\n");
  printf("%f\n",emp.salario);   
  printf ("%s\n",emp.nome);   
  printf ("%d\n",emp.idade);   
  printf ("%c\n",emp.sexo); 
    
}