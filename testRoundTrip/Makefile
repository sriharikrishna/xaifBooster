TARGET=testCode

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

RM=rm -f

$(TARGET).B: $(TARGET).f mfef90
	./mfef90 $(TARGET).f

$(TARGET).xaif : $(TARGET).B whirl2xaif
	./whirl2xaif $(TARGET).B

$(TARGET).xb.xaif : $(TARGET).xaif xaif.xsd xaif_base.xsd xaif_inlinable_intrinsics.xsd xaif_derivative_propagator.xsd xaifBooster
	$(COMPLAIN)
	./xaifBooster -i $(TARGET).xaif -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $(TARGET).xb.xaif -g 15

$(TARGET).xb.x2w.B : $(TARGET).xb.xaif xaif2whirl
	./xaif2whirl $(TARGET).B $(TARGET).xb.xaif

$(TARGET).xb.x2w.w2f.f: $(TARGET).xb.x2w.B whirl2f whirl2f_be
	$(COMPLAIN)
	export LD_LIBRARY_PATH=${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/be:$LD_LIBRARY_PATH; ./whirl2f $(TARGET).xb.x2w.B

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
	$(COMPLAIN)
	$(LN) ${XAIFBOOSTERROOT}/xaifBooster/algorithms/BasicBlockPreaccumulation/test/t  $@

# cleanup
clean:
	$(RM) *.xsd 
	$(RM) mfef90 whirl2xaif xaif2whirl whirl2f_be whirl2f pp.pl xaifBooster 
	$(RM) $(TARGET).*

obj test doc: 

.PHONY: all obj test doc clean
