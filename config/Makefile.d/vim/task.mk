.PHONY: vim-install
vim-install: $(VIM_NEOBUNDLE)

.PHONY: vim-update
vim-update:
	cd $(VIM_NEOBUNDLE); git pull --rebase origin master
	sh $(VIM_NEOBUNDLE)/bin/neoinstall

$(VIM_NEOBUNDLE):
	mkdir -p $(VIM_BUNDLE_DIR)
	git clone $(VIM_NEOBUNDLE_REPO) $@
	sh $@/bin/neoinstall

