TARGET=head
TARGETDRIVER=driver

all: $(TARGET).xb.x2w.w2f.pp.f

export UNDEF_ENV_VARS=""
ifndef RICETOOLROOT
UNDEF_ENV_VARS+=" RICETOOLROOT "
endif

ifndef XAIFSCHEMAROOT
UNDEF_ENV_VARS+=" XAIFSCHEMAROOT "
endif

ifndef XAIFBOOSTERROOT
UNDEF_ENV_VARS+=" XAIFBOOSTERROOT "
endif

ifneq ($(UNDEF_ENV_VARS),"")
export COMPLAIN=@echo "***detect undefined environment variables: "$(UNDEF_ENV_VARS); exit 1
endif	

LN=ln -sf

F95=f95

RM=rm -f

$(TARGET).B: $(TARGET).f mfef90
	./mfef90 $(TARGET).f

$(TARGET).xaif : $(TARGET).B whirl2xaif
	./whirl2xaif $(TARGET).B

$(TARGET).xb.xaif : $(TARGET).xaif xaif.xsd xaif_base.xsd xaif_inlinable_intrinsics.xsd xaif_derivative_propagator.xsd xaif_output.xsd xaifBooster
	$(COMPLAIN)
#	./xaifBooster -i $(TARGET).xaif -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $(TARGET).xb.xaif -g 15
	./xaifBooster -i $(TARGET).xaif -g 16 -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $(TARGET).xb.xaif

$(TARGET).xb.x2w.B : $(TARGET).xb.xaif xaif2whirl
	./xaif2whirl $(TARGET).B $(TARGET).xb.xaif

$(TARGET).xb.x2w.w2f.f: $(TARGET).xb.x2w.B whirl2f whirl2f_be
	$(COMPLAIN)
	LD_LIBRARY_PATH=${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/be:${LD_LIBRARY_PATH}; ./whirl2f $(TARGET).xb.x2w.B

$(TARGET).xb.x2w.w2f.pp.f: $(TARGET).xb.x2w.w2f.f pp.pl
	perl pp.pl $(TARGET).xb.x2w.w2f.f

# setup some links
%.xsd:
	$(COMPLAIN)
	$(LN) ${XAIFSCHEMAROOT}/schema/$@ .

mfef90: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/crayf90/sgi/mfef90 .

whirl2xaif xaif2whirl: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/whirl2xaif/obj/i686-Linux/obj/$@ .

pp.pl: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/whirl2xaif/postprocess/$@ .

whirl2f whirl2f_be:
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f/$@ .

xaifBooster:
	./pickAlgorithm.bash

# make the $TARGETDRIVER)
$(TARGETDRIVER): w2f__types.o active_module.o $(TARGETDRIVER).o $(TARGET).xb.x2w.w2f.pp.o 
	$(F95) $^ -o $@

run: params.conf tmpOutput
	./driver

# this is not free form fortran
w2f__types.o : w2f__types.f
	$(F95) -c $<

# this is not free form fortran either
$(TARGET).xb.x2w.w2f.pp.o : $(TARGET).xb.x2w.w2f.pp.f
	$(F95) -c $<

%.o:%.f
	$(F95) -free -c $<

# link the sample files if necessary
$(TARGETDRIVER).f : 
	ln -s simpleDriver.f $(TARGETDRIVER).f

# link the sample files if necessary
$(TARGET).f : 
	ln -s simple.f $(TARGET).f

# link the sample files if necessary
params.conf : 
	ln -s simple.params.conf params.conf

tmpOutput: 
	mkdir -p $@

testclean:
	$(RM) $(TARGET).B $(TARGET).x* $(TARGETDRIVER) $(TARGETDRIVER).o 
	$(RM) -rf tmpOutput 

testAllclean: testclean
	$(RM) $(TARGET).f $(TARGETDRIVER).f params.conf
	$(RM) -rf  tmpOutput verifiedOutput 

# cleanup
clean: testAllclean
	$(RM) *.xsd 
	$(RM) mfef90 whirl2xaif xaif2whirl whirl2f_be whirl2f pp.pl xaifBooster 
	$(RM) w2f__types.o active_module.o w2f__types.mod active_module.mod 

obj test doc: 

.PHONY: all obj test doc clean testclean testAllclean run
