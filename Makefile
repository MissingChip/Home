
DESTINATION = $(HOME)
EXCLUDE = config .git Makefile
CONFIG_FILES = $(shell ls -A config)

sync: config dotfiles
.PHONY: sync

revsync: revconfig
.PHONY: revsync

config:
	for cfgdir in $(CONFIG_FILES) ; do \
		rsync -av --delete config/$$cfgdir/ $(DESTINATION)/.config/$$cfgdir ; \
	done
.PHONY: config

dotfiles:
	for dotfile in $(shell ls dot) ; do \
		cp dot/$$dotfile $(DESTINATION)/.$$dotfile ; \
	done

.PHONY: dotfiles

revconfig:
	rsync -av $(patsubst %, $(DESTINATION)/.config/%, $(CONFIG_FILES)) config/
