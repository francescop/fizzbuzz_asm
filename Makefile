.PHONY: all clean

YASM=yasm
FLAGS=-g dwarf2 -f elf64
PROGRAM=fizzbuzz

all: compile link

compile:
	$(YASM) $(FLAGS) $(PROGRAM).asm -l $(PROGRAM).lst

link:
	ld -g -o $(PROGRAM) $(PROGRAM).o

clean:
	rm -f $(PROGRAM) $(PROGRAM).lst $(PROGRAM).o
