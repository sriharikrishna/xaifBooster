# default target
default: obj

include ../../Makefile.incl
-include $(DEPINCL)

MAIN=$(UTILS_LIB_DIR)/lib$(UTILS_LIB_NAME).a

obj: $(MAIN)

$(MAIN): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

clean:
	rm -f obj/*.o obj/*.d $(MAIN)

test doc: ;

.PHONY: obj test doc clean default



