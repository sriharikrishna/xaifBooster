# default target
obj: default

clean:
	rm -f obj/*.o obj/*.d

.PHONY: obj clean default

include ../../../Makefile.incl
-include $(DEPINCL)

IPATH+=-I../inc

default: $(OBJS)

