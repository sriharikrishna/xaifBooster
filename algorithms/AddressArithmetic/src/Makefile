# default target
default: obj

include ../../../Makefile.incl
-include $(DEPINCL)

obj: $(OBJS)

clean:
	rm -f obj/*.o obj/*.d

test : ;

.PHONY: obj test clean
