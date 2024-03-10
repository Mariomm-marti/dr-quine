#include <stdio.h>

#define A() int main(void) { char *code = "#include <stdio.h>%c%c#define A() int main(void) { char *code = %c%s%c; printf(code, 0x0a, 0x0a, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a); }%c#define B second%c#define C third%c%cA()%c"; printf(code, 0x0a, 0x0a, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a); }
#define B second
#define C third

A()
