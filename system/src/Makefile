# default target
default: obj

include ../../Makefile.incl
-include $(DEPINCL)

obj: $(OBJS)
	cd srcDummyFactories && $(MAKE) 

clean:
	rm -f obj/*.o obj/*.d
	cd srcDummyFactories && $(MAKE) clean 

test doc: ;

.PHONY: obj test doc clean




