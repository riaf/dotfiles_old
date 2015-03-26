.PHONY: zsh-compile
zsh-compile:
	find $(ZSH_DIR)/ -type f -name "*.zsh" -print0 | xargs -0 -I{} zsh -c "zcompile {}"

