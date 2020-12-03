CC=emcc
CFLAGS=-O0 -g -fdebug-compilation-dir=.
DWP=llvm-dwp-10
SIZE=llvm-size-10

SOURCES=$(wildcard *.c)
OBJECTS=$(SOURCES:.c=.o)

all: index.html index.wasm.dwp

index.wasm.dwp: $(OBJECTS:.o=.dwo)
	$(DWP) -o $@ $^

index.html index.js index.wasm: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

%.o %.dwo: %.c
	$(CC) $(CFLAGS) -gsplit-dwarf -c -o $@ $<

cleanall: clean
	$(MAKE) all

start: all
	python3 -m http.server 8081

clean:
	@rm -f *.{dw[op],html,js,o,wasm}
