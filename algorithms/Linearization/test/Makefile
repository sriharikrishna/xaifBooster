MAIN=t

test: $(MAIN) quickRegression.bash

clean:
	rm -f obj/*.o obj/*.d $(MAIN) quickRegression.bash 
	rm -rf tmp

obj doc: ;

.PHONY: obj test doc clean

quickRegression.bash: 
	ln -sf $(XAIFBOOSTERROOT)/xaifBooster/system/test/quickRegression.bash

include ../../../Makefile.incl
-include $(DEPINCL)

# make name patterns for algorithm specific factory object files
ALG_FACTORY_OBJ_NAMEPATTERNS=$(addprefix %, $(notdir $(wildcard ../src/srcFactories/obj/*.o)))

# pick up dummy factories for the rest, 
# i.e. the ones not in ALG_FACTORY_OBJ_NAMEPATTERNS
REMANING_DUMMY_FACTORY_OBJ_SET=$(filter-out $(ALG_FACTORY_OBJ_NAMEPATTERNS),$(DUMMY_FACTORY_OBJ_SET))

# pick up all algorith specific obj files
ALG_OBJ_SET=$(wildcard ../src/obj/*.o) $(wildcard ../src/srcFactories/obj/*.o)

$(MAIN): $(OBJS) $(ALG_OBJ_SET) $(SYSTEM_OBJ_SET) $(REMANING_DUMMY_FACTORY_OBJ_SET) $(LIBS)
	$(COMPLAIN)
	$(CC) $^ $(LFLAGS) -o $@


