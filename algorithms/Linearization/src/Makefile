# default target
obj: default

clean:
	rm -f obj/*.o obj/*.d

test doc: ;

.PHONY: test obj clean default doc

include ../../../Makefile.incl
-include $(DEPINCL)

default: $(OBJS)

