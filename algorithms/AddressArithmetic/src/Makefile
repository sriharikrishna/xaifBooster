# default target
default: obj

include ../../../Makefile.incl
-include $(DEPINCL)

objs: obj $(OBJS)

clean:
	rm -f obj/*.o obj/*.d

test : ;

.PHONY: objs test clean
