DEIN_DIR = ~/.cache/dein/repos/github.com/Shougo
NEOVIM_DIR = ~/.config/nvim

VIM_DEIN = $(DEIN_DIR)/dein.vim
VIM_DEIN_REPO = https://github.com/Shougo/dein.vim
NEOVIM_INIT_PATH = $(NEOVIM_DIR)/init.vim

INSTALL_TARGETS += vim-install
UPDATE_TARGETS += vim-update

