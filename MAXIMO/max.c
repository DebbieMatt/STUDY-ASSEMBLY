#include "stdio.h"

long int maximo(int a , int b, int c);

long int main ()
{
  long int x,y,z;
  long int m;
  printf("Entre tres valores inteiros: ");
  scanf ("%ld %ld %ld",&x,&y,&z);
  m = maximo(x,y,z);
  printf("O maximo eh: %ld\n",m);
  return 0;
    
}
