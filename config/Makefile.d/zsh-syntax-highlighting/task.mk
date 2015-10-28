.PHONY: zsh-syntax-highlighting-install
zsh-syntax-highlighting-install: $(ZSH_SYNTAX_HIGHLIGHTING_DIR)

.PHONY: zsh-syntax-highlighting-update
zsh-syntax-highlighting-update: $(ZSH_SYNTAX_HIGHLIGHTING_DIR)
	cd $< && git pull --rebase --prune origin master

$(ZSH_SYNTAX_HIGHLIGHTING_DIR):
	git clone $(ZSH_SYNTAX_HIGHLIGHTING_REPO) $@
