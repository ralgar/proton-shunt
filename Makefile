CC=x86_64-w64-mingw32-gcc

default: proton-shunt.exe

all: proton-shunt.exe test.exe

proton-shunt.exe: main.c
	$(CC) -Wall -Wextra -pedantic-errors -o proton-shunt.exe main.c

test.exe: tests/test.c
	$(CC) -Wall -Wextra -pedantic-errors -o tests/test.exe tests/test.c

clean:
	rm -f proton-shunt.exe
	rm -f tests/test.exe
