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

# pick up all algorith specific obj files
ALG_OBJ_SET=$(wildcard ../src/obj/*.o) $(wildcard ../../BasicBlockPreaccumulation/src/obj/*.o) $(wildcard ../../Linearization/src/obj/*.o) 

CCIF_LIB=-lxaifBoosterCrossCountryInterface
CCIF_LIB_DIR=../../CrossCountryInterface/lib 

VPATH+=$(CCIF_LIB_DIR) 
LIBS+=$(CCIF_LIB)

IXMLR_LIB=-lxaifBoosterInlinableXMLRepresentation
IXMLR_LIB_DIR=../../InlinableXMLRepresentation/lib 

VPATH+=$(IXMLR_LIB_DIR) 
LIBS+=$(IXMLR_LIB)

# setup for ANGEL
UNDEF_ENV_VARS=""
ifndef ANGELROOT
UNDEF_ENV_VARS+=" ANGELROOT "
endif

ANGEL_LIB=-langel
ANGEL_LIB_DIR=$(ANGELROOT)/lib 

VPATH+=$(ANGEL_LIB_DIR) 
LIBS+=$(ANGEL_LIB)

ifneq ($(UNDEF_ENV_VARS),"")
export COMPLAIN=@echo "***detect undefined environment variables: "$(UNDEF_ENV_VARS); exit 1
endif

$(MAIN): $(OBJS) $(ALG_OBJ_SET) $(SYSTEM_OBJ_SET) $(LIBS)
	$(COMPLAIN)
	$(CC) $^ $(LFLAGS) -o $@


