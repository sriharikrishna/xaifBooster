include ../Makefile.incl

XMLDIR=../xml
TARGETS=\
helper_declaration.inc \
helper_definition.inc \
helper_initialization.inc \
parse_method_decl.inc \
parse_method_stmt.inc 

all: $(TARGETS)

%.inc : $(XMLDIR)/%.xml
	$(COMPLAIN)
	java CodeGenerator $<

.PHONY: all 
	
