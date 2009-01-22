# default target
default: objs

include ../../../Makefile.incl
-include $(DEPINCL)

LIB_NAME=xaifBoosterSaveValuesAcross
LIBDIR=../lib
THELIB=$(LIBDIR)/lib$(LIB_NAME).a

CLEANTARGETS+=$(LIBDIR)

objs: obj $(LIBDIR) $(THELIB)

$(THELIB): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(LIBDIR):
	mkdir $@

test : ;

.PHONY: objs test default

