.PHONY: phpdoc-install
phpdoc-install: $(PHPDOC_DIR)

$(PHPDOC_DIR):
	mkdir -p $(PHPDOC_TMP)
	mkdir -p `dirname $(PHPDOC_DIR)`
	curl $(PHPDOC_URL) | tar zxf - -C $(PHPDOC_TMP)
	mv $(PHPDOC_TMP)/php-chunked-xhtml $(PHPDOC_DIR)
	rm -rf $(PHPDOC_TMP)

