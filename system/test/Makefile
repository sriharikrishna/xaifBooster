MAIN=t

test: $(MAIN)

clean:
	rm -f obj/*.o obj/*.d $(MAIN) 
	rm -rf tmp

oabj doc: ;

.PHONY: obj test doc clean

include ../../Makefile.incl
-include $(DEPINCL)

$(MAIN): obj/$(MAIN).o $(SYSTEM_OBJ_SET) $(LIBS)
	$(CC) $^ $(LFLAGS) -o $@
