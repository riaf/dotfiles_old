.PHONY: vim-install
vim-install: $(VIM_DEIN)

.PHONY: vim-update
vim-update:
	cd $(VIM_DEIN); git pull --rebase origin master

$(VIM_DEIN):
	mkdir -p $(DEIN_DIR)
	git clone $(VIM_DEIN_REPO) $@

