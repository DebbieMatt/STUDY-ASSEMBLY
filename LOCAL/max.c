#include "stdio.h"

int maximo(int a , int b, int c);

main ()
{
  int x,y,z;
  int m;
  printf("Entre tres valores inteiros: ");
  scanf ("%d %d %d",&x,&y,&z);
  m = maximo(x,y,z);
  printf("O maximo eh: %d\n",m);
    
}
