CONFIG_FILES = $(addprefix ~/.config/, $(notdir $(wildcard $(CONFIG_DIR)/*)))

INSTALL_TARGETS += config-install
