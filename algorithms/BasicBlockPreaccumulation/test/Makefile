MAIN=t

test: $(MAIN) quickRegression.bash

clean:
	rm -f obj/*.o obj/*.d $(MAIN) quickRegression.bash
	rm -rf tmp

obj doc: ;

.PHONY: obj test doc clean

quickRegression.bash: 
	ln -sf $(XAIFBOOSTERROOT)/$(ROOTDIR)/system/test/quickRegression.bash

include ../../../Makefile.incl
-include $(DEPINCL)

# make name patterns for algorithm specific factory object files
ALG_FACTORY_OBJ_NAMEPATTERNS=$(addprefix %, $(notdir $(wildcard ../src/srcFactories/obj/*.o)))

# make name patterns for Linearization algorithm specific factory object files
LINEARIZATION_FACTORY_OBJ_NAMEPATTERNS=$(addprefix %, $(notdir $(wildcard ../../Linearization/src/srcFactories/obj/*.o)))

# make set  for Linearization algorithm specific factory object files
LINEARIZATION_FACTORY_OBJ_SET=$(wildcard ../../Linearization/src/srcFactories/obj/*.o)

# pick up Linearization factory objects for factories 
# that we don't define
REMANING_LINEARIZATION_FACTORY_OBJ_SET=$(filter-out $(ALG_FACTORY_OBJ_NAMEPATTERNS),$(LINEARIZATION_FACTORY_OBJ_SET))

NON_DUMMY_FACTORY_OBJ_NAMEPATTERNS=$(ALG_FACTORY_OBJ_NAMEPATTERNS) $(LINEARIZATION_FACTORY_OBJ_NAMEPATTERNS) 

# pick up dummy factories for the rest, 
# i.e. the ones not in ALG_FACTORY_OBJ_NAMEPATTERNS
REMANING_DUMMY_FACTORY_OBJ_SET=$(filter-out $(NON_DUMMY_FACTORY_OBJ_NAMEPATTERNS),$(DUMMY_FACTORY_OBJ_SET))

# setup for ANGEL
UNDEF_ENV_VARS=""
ifndef ANGELROOT
UNDEF_ENV_VARS+=" ANGELROOT "
endif

ANGEL_LIB=-langel
ANGEL_LIB_DIR=$(ANGELROOT)/lib 

# pick up all algorith specific obj files
ALG_OBJ_SET=$(wildcard ../src/obj/*.o) $(wildcard ../src/srcFactories/obj/*.o) $(wildcard ../../Linearization/src/obj/*.o) $(wildcard ../../CrossCountryInterface/src/obj/*.o)

VPATH+=$(ANGEL_LIB_DIR)
LIBS+=$(ANGEL_LIB)

ifneq ($(UNDEF_ENV_VARS),"")
export COMPLAIN=@echo "***detect undefined environment variables: "$(UNDEF_ENV_VARS); exit 1
endif

$(MAIN): $(OBJS) $(ALG_OBJ_SET) $(REMANING_LINEARIZATION_FACTORY_OBJ_SET) $(SYSTEM_OBJ_SET) $(REMANING_DUMMY_FACTORY_OBJ_SET) $(LIBS)
	$(COMPLAIN)
	$(CC) $^ $(LFLAGS) -o $@


