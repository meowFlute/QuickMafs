IDIR =./include
CC=gcc
CFLAGS=-I$(IDIR)
LFLAGS=-lc

VER=1
REV=0.0
SONAME=libquickmafs.so.$(VER)

SDIR=./src
ODIR=./src/obj
LDIR =./lib

_DEPS = QuickMafs.h \
		qmafs_func.h \
		#qmafs_context.h

DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = 	qmafs_add.o
				#qmafs_subtract.o \
				#qmafs_multiply.o \
				#qmafs_divide.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -fPIC -o $@ $< $(CFLAGS)

SOBJ = $(patsubst %,$(LDIR)/%,$(SONAME))

$(SOBJ).$(REV): $(OBJ)
	$(CC) -shared -fPIC -Wl,-soname,$(SONAME) -o $@ $< $(LFLAGS)

.PHONY: clean

clean:
	rm -f $(LDIR)/*.so.$(VER).$(REV) $(ODIR)/*.o *~ core $(INCDIR)/*~
