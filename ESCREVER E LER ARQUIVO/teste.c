#define MAX_INT_SZ 32
extern void scrwrite (char *str, int size);
extern void kbdread (char *str, int size);

/*
void wrchar(char ch)
{
 scrwrite(&ch,1);       
}

char rdchar(void)
{
 char ch;   
 kbdread(&ch,1);
 return ch;
}


int strsz (char *str)
{
  int sz=0;
  while (*str++ != '\0') sz++;
  return sz;
}


int isnumber(char ch)
{    
 return (ch>='0' && ch<= '9');   
}

void fillbuffer (char *buf, char ch, int sz)
{
  int i;
  for (i = 0 ; i< sz-1 ; i++)
  {
     buf[i] = ch;
  }
  buf[i] = '\0';
}

int intrd (void)
{
 int num = 0;
 int cvt = 0;
 char buffer[MAX_INT_SZ];
 int i=0;
 char ch;
 
 fillbuffer(buffer,' ',MAX_INT_SZ);
 kbdread (buffer, MAX_INT_SZ);
 do {
   ch = buffer[i];
   printf("Caracter convertido:%c\n",ch);
   if (ch == '\r' || ch == '\n')
       break;
   if (isnumber(ch)){
      cvt = ch - '0';   
      num = num*10 + cvt;
   }
   i++;
 } while(i<MAX_INT_SZ);
 return num;   
}    

void intwr (int i)
{
  char buf[MAX_INT_SZ];
  int count = MAX_INT_SZ;
  int cvt;
  int szused = 0;
  
  fillbuffer(buf,' ',MAX_INT_SZ);
  while ((count--) && (i !=0)) {
      cvt = i%10;
      buf[count-1] = cvt + '0';
      i = i/10;
      szused++;
  }
  scrwrite(buf,MAX_INT_SZ);
  puts(buf);
}


char *s1 = "Entre com um inteiro";
int  myint;
char *s2 = "Voce entrou:";

Obs:  as funções para conversões de inteiro serão explicadas em
aula.

*/

char *s1 = "Entre com uma mensagem:";
int  myint;
char *s2 = "Voce entrou:";

void main (void)
{
  int t;
  char msg[MAX_INT_SZ];
  char *spointer = s1;
  t = strsz(spointer);
  scrwrite(s1,t);
  //t= intrd();
  kbdread (msg, MAX_INT_SZ);
 // spointer = s2;
 // t = strsz(spointer);
 // scrwrite(s2,t);
  //intwr(myint);
  scrwrite(msg, MAX_INT_SZ);
}


