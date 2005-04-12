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
ALG_OBJ_SET=$(wildcard ../src/obj/*.o) $(wildcard ../../Linearization/src/obj/*.o) $(wildcard ../../BasicBlockPreaccumulation/src/obj/*.o)

VPATH+=../../InlinableXMLRepresentation/lib
LIBS+=-lxaifBoosterInlinableXMLRepresentation

VPATH+=../../DerivativePropagator/lib
LIBS+=-lxaifBoosterDerivativePropagator

VPATH+=../../CrossCountryInterface/lib
LIBS+=-lxaifBoosterCrossCountryInterface

# setup for ANGEL
ifndef ANGELROOT
  $(error "Error:  environment variable ANGELROOT not defined!")
endif

VPATH+=$(ANGELROOT)/lib
LIBS+=-langel

$(MAIN): $(OBJS) $(ALG_OBJ_SET) $(SYSTEM_OBJ_SET) $(LIBS)
	$(CC) $^ $(LFLAGS) -o $@


