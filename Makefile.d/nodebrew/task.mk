.PHONY: nodebrew-install
nodebrew-install: $(NODEBREW_ROOT)

.PHONY: nodebrew-update
nodebrew-update:
	$(NODEBREW) selfupdate

$(NODEBREW_ROOT):
	curl -L $(NODEBREW_INSTALLER) | perl - setup

