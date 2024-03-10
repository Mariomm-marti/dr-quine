SRCS  = Colleen.c \
			  Grace.c \
			  Sully.c

%.o:    %.c
				/usr/bin/cc -Wall -Werror -Wextra -Wpedantic -c $< -o $@

all: 		colleen grace sully

colleen: Colleen.o
	      /usr/bin/cc -Wall -Werror -Wextra -Wpedantic Colleen.o -o Colleen

grace:  Grace.o
	      /usr/bin/cc -Wall -Werror -Wextra -Wpedantic Grace.o -o Grace

sully:  Sully.o
	      /usr/bin/cc -Wall -Werror -Wextra -Wpedantic Sully.o -o Sully

clean:
				/bin/rm -f Colleen.o Grace.o Sully.o

fclean: clean
	      /bin/rm -f Colleen Grace Grace_kid.c Sully Sully_*

re:     fclean all
