##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Makefile
##

NAME_EXEC = wolfram-exe

NAME = wolfram

all: $(NAME_EXEC) 

$(NAME_EXEC):	compile
	cp `stack path --local-install-root`/bin/$(NAME_EXEC) .
	mv $(NAME_EXEC) $(NAME)

compile:
	stack build

clean:
	$(RM) $(NAME)

fclean: clean
	stack clean

re:	clean all