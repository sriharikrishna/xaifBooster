# default target
default: obj

include ../../../Makefile.incl
-include $(DEPINCL)

LIB_NAME=xaifBoosterCodeReplacement

MAIN=../lib/lib$(LIB_NAME).a

obj: $(MAIN)

$(MAIN): $(OBJS)
	$(COMPLAIN)
	$(AR) $(ARFLAGS) $@ $^

clean:
	rm -f obj/*.o obj/*.d $(MAIN)

test doc: ;

.PHONY: obj test doc clean default
