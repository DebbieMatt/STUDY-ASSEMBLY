#include <stdio.h>

struct empregado {
    double salario;
    int    idade;
};

struct empregado  emp;

int main (void)
{
  printf("Entre com o salario:");
  scanf("%lf",&emp.salario);
  printf("Entre com a idade:");
  scanf("%d",&emp.idade);
  printf("salario: %lf\n",emp.salario);
  printf("idade: %d\n",emp.idade);
  return 0;
}  
    
    