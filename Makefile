default: build

build:
	chicken-install -n

install:
	chicken-install

uninstall:
	chicken-uninstall sdl2

clean:
	rm -f *.import.scm *.types *.c *.o *.so
