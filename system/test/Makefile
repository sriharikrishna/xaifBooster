MAIN=t

test: $(MAIN)

clean:
	rm -f obj/*.o obj/*.d $(MAIN)

obj doc: ;

.PHONY: obj test doc clean

include ../../Makefile.incl
-include $(DEPINCL)

$(MAIN): obj/$(MAIN).o $(SYSTEM_OBJ_SET) $(DUMMY_FACTORY_OBJ_SET) $(LIBS)
	$(CC) $^ $(LFLAGS) -o $@
