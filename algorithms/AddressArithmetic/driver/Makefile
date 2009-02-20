MAIN=oadDriver

driver: obj $(MAIN) quickRegression.bash

$(MAIN).cpp: buildStamp.hpp

CLEANTARGETS+=buildStamp.hpp tmp $(MAIN) quickRegression.bash

objs : ;

.PHONY: objs driver 

quickRegression.bash: 
	ln -sf $(XAIFBOOSTERROOT)/$(ROOTDIR)/system/driver/quickRegression.bash

include ../../../Makefile.incl
-include $(DEPINCL)

# pick up all algorithm specific obj files
ALG_OBJ_SET=  							   \
$(wildcard ../src/obj/*.o) 					   \
$(wildcard ../../ControlFlowReversal/src/obj/*.o) 		   \
$(wildcard ../../BasicBlockPreaccumulationTapeAdjoint/src/obj/*.o) \
$(wildcard ../../BasicBlockPreaccumulationTape/src/obj/*.o) 	   \
$(wildcard ../../BasicBlockPreaccumulation/src/obj/*.o)            \
$(wildcard ../../Linearization/src/obj/*.o)			   \
$(wildcard ../../TypeChange/src/obj/*.o)

LIBS+=../../InlinableXMLRepresentation/lib/libxaifBoosterInlinableXMLRepresentation.a
LIBS+=../../CrossCountryInterface/lib/libxaifBoosterCrossCountryInterface.a
LIBS+=../../DerivativePropagator/lib/libxaifBoosterDerivativePropagator.a
LIBS+=../../AdjointUtils/lib/libxaifBoosterAdjointUtils.a
LIBS+=../../CodeReplacement/lib/libxaifBoosterCodeReplacement.a
LIBS+=../../SaveValuesAcross/lib/libxaifBoosterSaveValuesAcross.a
LIBS+=../../RequiredValues/lib/libxaifBoosterRequiredValues.a

# setup for ANGEL
ifndef ANGELROOT
  $(error "Error:  environment variable ANGELROOT not defined!")
endif

LIBS+=$(ANGELROOT)/lib/libangel.a

$(MAIN): $(OBJS) $(ALG_OBJ_SET) $(SYSTEM_OBJ_SET) $(LIBS)
	$(CC) $^ $(LFLAGS) -o $@


