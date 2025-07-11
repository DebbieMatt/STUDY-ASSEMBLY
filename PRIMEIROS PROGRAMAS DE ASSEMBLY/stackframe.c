int func1(int a, int b);
int func2(int g);
int main(void) {
    int a, b, c;
    a = 2; 
    b= 3;
    c = func1(a,b);
    return c;
  }

 int func1(int a, int b) {
     int c,d;
     c = a+b;
     d = func2(c);
     return c+d;
}

int func2(int g)
{
  int e = g+2; 
  return e*e;
}