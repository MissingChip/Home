
DESTINATION = $(HOME)
EXCLUDE = config .git Makefile
CONFIG_FILES = $(shell ls -A config)

sync: config dotfiles
.PHONY: sync

config:
	rsync -av $(patsubst %, config/%/, $(CONFIG_FILES)) $(DESTINATION)/.config
.PHONY: config

dotfiles:
	rsync -av $(patsubst %, --exclude="%", $(EXCLUDE)) ./ $(DESTINATION)
.PHONY: dotfiles

