TARGET=head

ifdef REVERSE_MODE
REVERSE_MODULES=OpenAD_checkpoints.o OpenAD_dct.o OpenAD_rev.o OpenAD_tape.o iaddr.o
TARGETDRIVER=driver_adm
else
TARGETDRIVER=driver
PP_FLAGS=-f
endif

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

F95=f95 -g

CC=gcc

RM=rm -f

$(TARGET).B: $(TARGET).f mfef90
	./mfef90 -F -N80 $(TARGET).f

$(TARGET).xaif : $(TARGET).B whirl2xaif
	./whirl2xaif -o $(TARGET).xaif $(TARGET).B

$(TARGET).xb.xaif : $(TARGET).xaif xaif.xsd xaif_base.xsd xaif_inlinable_intrinsics.xsd xaif_derivative_propagator.xsd xaif_output.xsd xaifBooster
	$(COMPLAIN)
#	./xaifBooster -i $(TARGET).xaif -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $(TARGET).xb.xaif -g 15
	./xaifBooster -i $(TARGET).xaif -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $(TARGET).xb.xaif

$(TARGET).xb.x2w.B : $(TARGET).xb.xaif xaif2whirl
	./xaif2whirl --structured $(TARGET).B $(TARGET).xb.xaif

$(TARGET).xb.x2w.w2f.f: $(TARGET).xb.x2w.B whirl2f whirl2f_be
	$(COMPLAIN)
	LD_LIBRARY_PATH=${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/be:${LD_LIBRARY_PATH}; ./whirl2f -openad $(TARGET).xb.x2w.B

$(TARGET).xb.x2w.w2f.pp.f: $(TARGET).xb.x2w.w2f.f pp.pl
	perl pp.pl $(PP_FLAGS) $(TARGET).xb.x2w.w2f.f

# setup some links
%.xsd:
	$(COMPLAIN)
	$(LN) ${XAIFSCHEMAROOT}/schema/$@ .

mfef90: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/crayf90/sgi/mfef90 .

whirl2xaif xaif2whirl: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/OpenADFortTk/obj/i686-Linux/obj/$@ .

pp.pl: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/OpenADFortTk/postprocess/$@ .

whirl2f whirl2f_be:
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f/$@ .

xaifBooster:
	./pickAlgorithm.bash

# make the $TARGETDRIVER)
$(TARGETDRIVER): w2f__types.o active_module.o $(REVERSE_MODULES) $(TARGETDRIVER).o $(TARGET).xb.x2w.w2f.pp.o 
	$(F95) $^ -o $@

run: params.conf tmpOutput $(TARGETDRIVER)
	./$(TARGETDRIVER)

# this is not free form fortran
w2f__types.o : w2f__types.f
	$(F95) -c $<

# this is not free form fortran either
$(TARGET).xb.x2w.w2f.pp.o : $(REVERSE_MODULES) $(TARGET).xb.x2w.w2f.pp.f 
	$(F95) -c $(TARGET).xb.x2w.w2f.pp.f

%.o:%.f
	$(F95) -free -c $<

%.o:%.f95
	$(F95) -c $<

# link the sample files if necessary
$(TARGETDRIVER).f : 
	ln -s simple.$(TARGETDRIVER).f $(TARGETDRIVER).f

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
	$(RM) *.mod *.o

obj test doc: 

.PHONY: all obj test doc clean testclean testAllclean run
