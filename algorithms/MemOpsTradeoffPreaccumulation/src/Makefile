# default target
default: obj

include ../../../Makefile.incl
-include $(DEPINCL)

obj: $(OBJS)

clean:
	rm -f obj/*.o obj/*.d

doc:
	cd ../doc && doxygen

.PHONY: obj test doc clean
