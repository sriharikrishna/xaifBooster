obj test doc clean:
	cd utils && $(MAKE) $@
	cd system && $(MAKE) $@

.PHONY: obj test doc clean
