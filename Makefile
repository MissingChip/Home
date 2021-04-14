
DESTINATION = $(HOME)
EXCLUDE = config .git Makefile
CONFIG_FILES = $(shell ls -A config)

sync: config dotfiles
.PHONY: sync

revsync: revconfig
.PHONY: revsync

config:
	rsync -av $(patsubst %, config/%/, $(CONFIG_FILES)) $(DESTINATION)/.config/
.PHONY: config

dotfiles:
	rsync -av $(patsubst %, --exclude="%", $(EXCLUDE)) ./ $(DESTINATION)
.PHONY: dotfiles

revconfig:
	rsync -av $(patsubst %, $(DESTINATION)/.config/%, $(CONFIG_FILES)) config/
