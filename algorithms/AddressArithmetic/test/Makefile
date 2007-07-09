MAIN=t

test: buildStamp.hpp $(MAIN) quickRegression.bash

clean:
	rm -f buildStamp.hpp obj/*.o obj/*.d $(MAIN) quickRegression.bash
	rm -rf tmp

objs : ;

.PHONY: objs test clean

quickRegression.bash: 
	ln -sf $(XAIFBOOSTERROOT)/$(ROOTDIR)/system/test/quickRegression.bash

include ../../../Makefile.incl
-include $(DEPINCL)

# pick up all algorith specific obj files
ALG_OBJ_SET=  							   \
$(wildcard ../src/obj/*.o) 					   \
$(wildcard ../../ControlFlowReversal/src/obj/*.o) 		   \
$(wildcard ../../BasicBlockPreaccumulationTapeAdjoint/src/obj/*.o) \
$(wildcard ../../BasicBlockPreaccumulationTape/src/obj/*.o) 	   \
$(wildcard ../../BasicBlockPreaccumulation/src/obj/*.o)            \
$(wildcard ../../Linearization/src/obj/*.o)

VPATH+=../../CrossCountryInterface/lib
LIBS+=-lxaifBoosterCrossCountryInterface

VPATH+=../../DerivativePropagator/lib
LIBS+=-lxaifBoosterDerivativePropagator

VPATH+=../../InlinableXMLRepresentation/lib
LIBS+=-lxaifBoosterInlinableXMLRepresentation

VPATH+=../../AdjointUtils/lib
LIBS+=-lxaifBoosterAdjointUtils

VPATH+=../../CodeReplacement/lib
LIBS+=-lxaifBoosterCodeReplacement

# setup for ANGEL
ifndef ANGELROOT
  $(error "Error:  environment variable ANGELROOT not defined!")
endif

VPATH+=$(ANGELROOT)/lib
LIBS+=-langel

$(MAIN): $(OBJS) $(ALG_OBJ_SET) $(SYSTEM_OBJ_SET) $(LIBS)
	$(CC) $^ $(LFLAGS) -o $@


