obj test doc clean: 
	cd utils && $(MAKE) $@
	cd system && $(MAKE) $@
	cd algorithms && $(MAKE) $@
	cd testRoundTrip && $(MAKE) $@

.PHONY: obj test doc clean codegen
