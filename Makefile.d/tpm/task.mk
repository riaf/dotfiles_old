.PHONY: tpm-install
tpm-install: $(TPM_ROOT)

.PHONY: tpm-update
tpm-update:
	cd $(TPM_ROOT); git pull --rebase origin master

$(TPM_ROOT):
	git clone https://github.com/tmux-plugins/tpm $(TPM_ROOT)

