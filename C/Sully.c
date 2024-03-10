#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int i = 5;

int main(void) {
  if (i < 0) return 0;
  char *filename; asprintf(&filename, "Sully_%d.c", i - 1);
  int fd = open(filename, O_WRONLY | O_TRUNC | O_CREAT, 0644);
  char *code = "#include <stdlib.h>%c#include <unistd.h>%c#include <stdio.h>%c#include <fcntl.h>%c%cint i = %d;%c%cint main(void) {%c  if (i < 0) return 0;%c  char *filename; asprintf(&filename, %cSully_%%d%c, i - 1);%c  int fd = open(filename, O_WRONLY | O_TRUNC | O_CREAT, 0644);%c  char *code = %c%s%c;%c  dprintf(fd, code, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, i - 1, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x0a, 0x0a);%c  close(fd);%c  free(filename);%c  char *command; asprintf(&command, %c/usr/bin/cc -Wall -Werror -Wextra -Wpedantic Sully_%%d.c -o Sully_%%d && ./Sully_%%d%c, i - 1, i - 1, i - 1);%c  system(command);%c  free(command);%c}%c";
  dprintf(fd, code, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, i - 1, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x22, code, 0x22, 0x0a, 0x0a, 0x0a, 0x0a, 0x22, 0x22, 0x0a, 0x0a, 0x0a, 0x0a);
  close(fd);
  free(filename);
  char *command; asprintf(&command, "/usr/bin/cc -Wall -Werror -Wextra -Wpedantic Sully_%d.c -o Sully_%d && ./Sully_%d", i - 1, i - 1, i - 1);
  system(command);
  free(command);
}
