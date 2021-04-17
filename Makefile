
DESTINATION = $(HOME)
EXCLUDE = config .git Makefile
CONFIG_FILES = $(shell ls -A config)

sync: config dotfiles
.PHONY: sync

revsync: revconfig
.PHONY: revsync

config:
	$(foreach cfgdir, $(CONFIG_FILES), rsync -av --delete config/$(cfgdir)/ $(DESTINATION)/.config/$(cfgdir);)
.PHONY: config

dotfiles:
	$(foreach dotfile, $(shell ls dot), cp dot/$(dotfile) $(DESTINATION)/.$(dotfile);)
.PHONY: dotfiles

revconfig:
	rsync -av $(patsubst %, $(DESTINATION)/.config/%, $(CONFIG_FILES)) config/
