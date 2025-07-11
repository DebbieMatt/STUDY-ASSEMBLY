
extern void scrwrite (char *str, int size);
extern void kbdread (char *str, int size);


void print_str (char *str)
{
   while (*str != '\0') {
       scrwrite(*str,1);
       str++;
    }    
}   

void read_str (char *str)
{ 
  static char ch;
  do {
    kbdread(ch,1);
    if (ch == '\n')
       break;
    *str++ = ch;  
  } while(1); 
  *str = '\0'; // termina a string com nulo.
}


/*
void ascii2int(char *str,int *i)
{
    *i = 0;
    while (*str != 0)
    {
        
    }
}
*/