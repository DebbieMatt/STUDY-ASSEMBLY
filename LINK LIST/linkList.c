#include <stdio.h>
#include <stdlib.h>


struct  linklist {
   struct linklist *next;
   int	nr;
};

int main (void)
{
    struct linklist *head;
    struct linklist *newItem;
    struct linklist *lastItem;
    int limit;
  
    limit = 5;
    head = NULL;
    newItem = NULL;
    lastItem = NULL;
   // cria a lista 
  do {
    newItem = malloc (sizeof(struct linklist));
    newItem-> next = NULL;
    newItem -> nr = limit;
    if ( head == NULL) {
        head = newItem;
        lastItem = head;
    }    
    else {
      lastItem -> next = newItem;
      lastItem = newItem;
    }
    limit --;  
      
  }while (limit > 0);       
      // percorre a lista
  limit = 5;
  lastItem = head;
  
  do {
      printf("Elemento: %d\n", lastItem -> nr );
      lastItem = lastItem -> next;
  }while (lastItem != NULL);

}  