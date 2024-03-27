#define _GNU_SOURCE
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int i = 5;

int main(void) {
  #ifdef DECREASE
  i--;
  #endif
  if (i < 0) return 0;
  char *filename; asprintf(&filename, "Sully_%d.c", i);
  int fd = open(filename, O_WRONLY | O_TRUNC | O_CREAT, 0644);
  char *code = "#define _GNU_SOURCE%c#include <stdlib.h>%c#include <unistd.h>%c#include <stdio.h>%c#include <fcntl.h>%c%cint i = %d;%c%cint main(void) {%c  #ifdef DECREASE%c  i--;%c  #endif%c  if (i < 0) return 0;%c  char *filename; asprintf(&filename, %cSully_%%d.c%c, i);%c  int fd = open(filename, O_WRONLY | O_TRUNC | O_CREAT, 0644);%c  char *code = %c%s%c;%c  dprintf(fd, code, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, i, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x0a, 0x0a);%c  close(fd);%c  free(filename);%c  char *command; asprintf(&command, %c/usr/bin/cc -Wall -Werror -Wextra -Wpedantic -D DECREASE Sully_%%d.c -o Sully_%%d && ./Sully_%%d%c, i, i, i);%c  system(command);%c  free(command);%c}%c";
  dprintf(fd, code, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, i, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x0a, 0x0a);
  close(fd);
  free(filename);
  char *command; asprintf(&command, "/usr/bin/cc -Wall -Werror -Wextra -Wpedantic -D DECREASE Sully_%d.c -o Sully_%d && ./Sully_%d", i, i, i);
  system(command);
  free(command);
}
