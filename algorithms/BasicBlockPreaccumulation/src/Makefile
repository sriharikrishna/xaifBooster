# default target
default: obj

include ../../../Makefile.incl
-include $(DEPINCL)

obj: $(OBJS)
	cd srcFactories && $(MAKE) 

clean:
	rm -f obj/*.o obj/*.d
	cd srcFactories && $(MAKE) clean 

test doc: ;

.PHONY: obj test doc clean
