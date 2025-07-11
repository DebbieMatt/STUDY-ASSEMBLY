#include <stdio.h>

int main (void)
{
  int num,i;
  printf("Entre com um numero:");
  scanf("%d",num);  
  for (i = 0; i< num ; i++)
  {
    printf("%d", i);
    printf (" ");    
  }
  printf("\n");
  return 0;
}