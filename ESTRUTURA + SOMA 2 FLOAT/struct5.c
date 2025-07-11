#include <stdio.h>
#include <stdlib.h>

struct empregado {
    float salario;
    char   nome[64];
    int    idade;
    char   sexo;
};

struct empregado  *ePtr; 

    
int main (void)
{
  ePtr = malloc(sizeof(struct empregado)); 
    
    
  printf("Entre com o salario:");
  scanf("%f",&(ePtr->salario));
  printf("Entre com o nome:");
  scanf("%s",&(ePtr->nome));
  printf("Entre com a idade:");
  scanf("%d",&(ePtr->idade));


  printf("Novos valores:\n");
   
  printf("%f\n",ePtr->salario);
  printf("%s\n",ePtr->nome);
  printf("%d\n",ePtr->idade);
  printf("%c\n",ePtr->sexo);
   
  return 0;
    
}  
    
    