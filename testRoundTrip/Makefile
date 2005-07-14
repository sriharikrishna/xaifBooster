######################################################
# pick your compiler
######################################################
F95=ifort -g -fpe0 -O0
CC=icc

#F95=f95 -g -w=unused
#CC=gcc
######################################################

ifdef REVERSE_MODE
MODULES=                        \
w2f__types.o                    \
active_module.o                 \
OpenAD_checkpoints.o            \
OpenAD_dct.o                    \
OpenAD_rev.o                    \
OpenAD_tape.o                   \
iaddr.o                         \
all_globals_mod.xb.x2w.w2f.pp.o \
all_globals_cp_mod.o 
PP_FLAGS=
ifeq ($(SUB_MODE),joint)
CP_FLAG=-I
else
CP_FLAG=
endif
else
MODULES=                        \
w2f__types.o                    \
active_module.o                 \
all_globals_mod.xb.x2w.w2f.pp.o 
PP_FLAGS=-f
endif

all: head.xb.x2w.w2f.pp.f

ifndef OPENADROOT
  $(error "Error:  environment variable OPENADROOT not defined!")
endif

ifndef XAIFSCHEMAROOT
  $(error "Error:  environment variable XAIFSCHEMAROOT not defined!")
endif

ifndef XAIFBOOSTERROOT
  $(error "Error:  environment variable XAIFBOOSTERROOT not defined!")
endif

LN=ln -sf

RM=rm -rf

######################################################
# transformation
######################################################

# paste the globals module into the head file 
# so we can do the single file transformation
head_sf.f : all_globals_mod.f head.f 
	cat $^ > $@

# F -> WHIRL
head_sf.B: head_sf.f mfef90
	./mfef90 -F -N132 $<

# WHIRL -> XAIF
head_sf.xaif : head_sf.B whirl2xaif
	./whirl2xaif -o $@ $<

# XAIF -> XAIF'
head_sf.xb.xaif : head_sf.xaif xaif.xsd xaif_base.xsd xaif_inlinable_intrinsics.xsd xaif_derivative_propagator.xsd xaif_output.xsd xaifBooster
	./xaifBooster -i $< -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -o $@ $(CP_FLAG)

# XAIF' -> WHIRL'
head_sf.xb.x2w.B : head_sf.xb.xaif xaif2whirl
	./xaif2whirl --structured head_sf.B $<

# WHIRL' -> F'
head_sf.xb.x2w.w2f.f: head_sf.xb.x2w.B whirl2f whirl2f_be
	./whirl2f -openad $<

# postprocess F'
head_sf.xb.x2w.w2f.pp.f: head_sf.xb.x2w.w2f.f multi-pp.pl
	perl multi-pp.pl $(PP_FLAGS) $<

# extract the transformed globals module so we the right order of 
# compilation with respect to the globals checkpoint module
all_globals_mod.xb.x2w.w2f.pp.f: head_sf.xb.x2w.w2f.pp.f
	cat $< | sed -n '/MODULE all_globals_mod/,/END MODULE/p' > $@

# remove the transformed globals module from the transformed head file
head.xb.x2w.w2f.pp.f: head_sf.xb.x2w.w2f.pp.f
	cat $< | sed '/MODULE all_globals_mod/,/END MODULE/d' > $@

# setup some links
%.xsd:
	$(LN) ${XAIFSCHEMAROOT}/schema/$@ .

mfef90: 
	$(LN) ${OPENADROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/crayf90/sgi/mfef90 .

whirl2xaif xaif2whirl: 
	$(LN) ${OPENADROOT}/OpenADFortTk/OpenADFortTk-i686-Linux/bin/$@ .

%.pl: 
	$(LN) ${OPENADROOT}/OpenADFortTk/OpenADFortTk-i686-Linux/bin/$@ .

whirl2f whirl2f_be:
	$(LN) ${OPENADROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f/$@ .

xaifBooster:
	./pickAlgorithm.bash

######################################################
# compilation
######################################################

# make the driver
driver: $(MODULES) head.xb.x2w.w2f.pp.o driver.o 
	$(F95) $^ -o $@ 

run: params.conf tmpOutput driver
	./driver

%.o:%.f
	$(F95) -fixed -c $<

%.o:%.f90
	$(F95) -free -c $<

######################################################
# miscellaneous
######################################################

tmpOutput: 
	mkdir -p $@

testAllclean:
	$(RM) head_sf.* head.* driver* params.conf all_globals_* ad_template.f *mod-whirl tmpOutput

clean: testAllclean
	$(RM) *.xsd 
	$(RM) mfef90 whirl2xaif xaif2whirl whirl2f_be whirl2f *.pl xaifBooster .lastRun
	$(RM) *.mod *.o

obj test doc: 

.PHONY: all obj test doc clean testAllclean run
