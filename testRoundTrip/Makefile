ifndef TARGET
TARGET=head
endif

ifndef TARGET_DRIVER
TARGET_DRIVER=driver_tlm
endif

ifdef REVERSE_MODE
REVERSE_MODULES=OpenAD_checkpoints.o OpenAD_dct.o OpenAD_rev.o OpenAD_tape.o iaddr.o
TARGET_DRIVER=driver_adm_split
else
PP_FLAGS=-f
endif

all: $(TARGET).prh.xb.x2w.w2f.urh.pp.f

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

F95=ifort -g  

CC=icc

RM=rm -rf

$(TARGET).prh.f: $(TARGET).f prh.pl
	perl prh.pl $<

$(TARGET).prh.B: $(TARGET).prh.f mfef90
	./mfef90 -F -N132 $<

$(TARGET).prh.xaif : $(TARGET).prh.B whirl2xaif
	./whirl2xaif -o $@ $<

$(TARGET).prh.xb.xaif : $(TARGET).prh.xaif xaif.xsd xaif_base.xsd xaif_inlinable_intrinsics.xsd xaif_derivative_propagator.xsd xaif_output.xsd xaifBooster
	$(COMPLAIN)
#	./xaifBooster -i $< -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $@ -g 15
	./xaifBooster -i $< -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $@

$(TARGET).prh.xb.x2w.B : $(TARGET).prh.xb.xaif xaif2whirl
	./xaif2whirl --structured $(TARGET).prh.B $<

$(TARGET).prh.xb.x2w.w2f.f: $(TARGET).prh.xb.x2w.B whirl2f whirl2f_be
	$(COMPLAIN)
	LD_LIBRARY_PATH=${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/be:${LD_LIBRARY_PATH}; ./whirl2f -openad $<

$(TARGET).prh.xb.x2w.w2f.urh.f: $(TARGET).prh.xb.x2w.w2f.f urh.pl
	perl urh.pl $<

$(TARGET).prh.xb.x2w.w2f.urh.pp.f: $(TARGET).prh.xb.x2w.w2f.urh.f pp.pl
	perl pp.pl $(PP_FLAGS) $<

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

%.pl: 
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/OpenADFortTk/postprocess/$@ .

whirl2f whirl2f_be:
	$(COMPLAIN)
	$(LN) ${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f/$@ .

xaifBooster:
	./pickAlgorithm.bash

# make the $TARGET_DRIVER)
$(TARGET_DRIVER): w2f__types.o active_module.o all_globals_mod.o all_globals_cp_mod.o $(REVERSE_MODULES) $(TARGET_DRIVER).o $(TARGET).prh.xb.x2w.w2f.urh.pp.o 
	$(F95) $^ -o $@ 

run: params.conf tmpOutput $(TARGET_DRIVER)
	./$(TARGET_DRIVER)

%.o:%.f
	$(F95) -fixed -c $<

%.o:%.f90
	$(F95) -free -c $<

tmpOutput: 
	mkdir -p $@

testAllclean: 
	$(RM) $(TARGET).* $(TARGET_DRIVER)* params.conf all_globals_* ad_template.f *mod-whirl tmpOutput

clean: testAllclean
	$(RM) *.xsd 
	$(RM) mfef90 whirl2xaif xaif2whirl whirl2f_be whirl2f *.pl xaifBooster .lastRun
	$(RM) *.mod *.o

obj test doc: 

.PHONY: all obj test doc clean testAllclean run
