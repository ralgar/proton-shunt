CC=x86_64-w64-mingw32-gcc

default: proton-shunt.exe

proton-shunt.exe: main.c
	$(CC) -pedantic-errors -o proton-shunt.exe main.c

clean:
	rm -f proton-shunt.exe
