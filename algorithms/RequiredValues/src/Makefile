# default target
default: objs

include ../../../Makefile.incl
-include $(DEPINCL)

LIB_NAME=xaifBoosterRequiredValues
LIBDIR=../lib
THELIB=$(LIBDIR)/lib$(LIB_NAME).a

CLEANTARGETS+=$(LIBDIR)

objs: obj $(LIBDIR) $(THELIB)

$(THELIB): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(LIBDIR):
	mkdir $@
	
driver : ;

.PHONY: objs driver default

