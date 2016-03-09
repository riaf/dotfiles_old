.PHONY: config-install
config-install: $(CONFIG_FILES)

~/.config/%: $(CONFIG_DIR)/%
	ln -sf $< $@

