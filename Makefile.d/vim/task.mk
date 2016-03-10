.PHONY: vim-install
vim-install: $(VIM_DEIN) $(NEOVIM_DIR) $(NEOVIM_INIT_PATH)

.PHONY: vim-update
vim-update:
	cd $(VIM_DEIN); git pull --rebase origin master

$(VIM_DEIN):
	mkdir -p $(DEIN_DIR)
	git clone $(VIM_DEIN_REPO) $@

$(NEOVIM_DIR):
	ln -snfv ~/.vim $(NEOVIM_DIR)

$(NEOVIM_INIT_PATH):
	ln -snfv ~/.vimrc $(NEOVIM_INIT_PATH)

