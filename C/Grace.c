#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

/*
  Simple comment
*/

#define MAIN() int main(void) { int fd = open("Grace_kid.c", O_WRONLY | O_TRUNC | O_CREAT, 0644); char *code = "#include <fcntl.h>%c#include <unistd.h>%c#include <stdio.h>%c%c%c*%c  Simple comment%c*%c%c%c#define MAIN() int main(void) { int fd = open(%cGrace_kid.c%c, O_WRONLY | O_TRUNC | O_CREAT, 0644); char *code = %c%s%c; dprintf(fd, code, 0x0a, 0x0a, 0x0a, 0x0a, 0x2f, 0x0a, 0x0a, 0x2f, 0x0a, 0x0a, 0x22, 0x22, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a); close(fd); }%c#define _UNUSED 0%c#define _UNUSED2 1%c%cMAIN()%c"; dprintf(fd, code, 0x0a, 0x0a, 0x0a, 0x0a, 0x2f, 0x0a, 0x0a, 0x2f, 0x0a, 0x0a, 0x22, 0x22, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a); close(fd); }
#define _UNUSED 0
#define _UNUSED2 1

MAIN()
