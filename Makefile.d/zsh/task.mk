.PHONY: zplug-install
zplug-install: $(ZPLUG_DIR)

.PHONY: zplug-update
zplug-update:
	cd $(ZPLUG_DIR); git pull --rebase origin master

$(ZPLUG_DIR):
	git clone $(ZPLUG_REPO) $(ZPLUG_DIR)

