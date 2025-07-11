extern void scrwrite (char *str, int size);
extern void kbdread (char *str, int size);

char *str1 = "digite seu nome:";
char str2[32];
char *str3 = "bom dia ";
void main (void)
{
   scrwrite(str1,sizeof(str1));
   kbdread(str2,32);
   scrwrite(str3,sizeof(str3));
   scrwrite(str2,32);
}


