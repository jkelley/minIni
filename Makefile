# Makefile for the minini project
#

CFLAGS = -O
SRCDIR=dev
CC = gcc
AR = ar rcs

all: libminini.a minIni.o test

minIni.o:
	$(CC) -c -o minIni.o $(SRCDIR)/minIni.c

libminini.a: minIni.o
	$(AR) libminini.a minIni.o

test: minIni.o
	$(CC) -o $(SRCDIR)/test $(SRCDIR)/test.c minIni.o 

# Install header file and static library
PREFIX ?= /usr/local
install: libminini.a
	install -d $(PREFIX)/lib/
	install -m 644 libminini.a $(PREFIX)/lib/
	install -d $(PREFIX)/include/
	install -m 644 minIni.h $(PREFIX)/include/

clean:
	rm -f *.a *.o test

.PHONY: clean install

