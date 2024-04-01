SRCS  = Colleen.s \
			  Grace.s \
			  Sully.s

%.o:    %.s
				nasm -f elf64 $< -o $@

all: 		colleen grace sully

colleen: Colleen.o
	      cc -Wall -Werror -Wextra -Wpedantic -z noexecstack Colleen.o -o Colleen

grace:  Grace.o
	      cc -Wall -Werror -Wextra -Wpedantic -z noexecstack Grace.o -o Grace

sully:  Sully.o
	      cc -Wall -Werror -Wextra -Wpedantic -z noexecstack Sully.o -o Sully

clean:
				rm -f Colleen.o Grace.o Sully.o

fclean: clean
	      rm -f Colleen Grace Grace_kid.c Sully Sully_*

re:     fclean all
