#include <stdio.h>
  double a,b;
  double sum, dif, mult, div;
 
int main()
{

  printf("Entre com o valor de a:");
  scanf ("%f",&a);
  printf("Entre com o valor de b:");
  scanf ("%f", &b);
   sum = a+b;
   dif = a - b;
   mult = a * b;
   div = a/b ;
  printf("Soma: %f\n",sum);
  prinff("Diferença: %f\n",dif);
  printf("Multiplicação: %f\n",mult);
  printf("Divisao: %f\n",div);
  
}

