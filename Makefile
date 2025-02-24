##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Makefile
##

NAME = wolfram-exe

all: $(NAME) 

$(NAME):	compile
	cp `stack path --local-install-root`/bin/$(NAME) .

compile:
	stack build

clean:
	$(RM) $(NAME)

re:	clean all