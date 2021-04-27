
DESTINATION := $(HOME)
DEST_CONFIG := $(DESTINATION)/.config
OUR_CONFIG := config
EXCLUDE := dot config .git Makefile README.md
CONFIG_FILES := $(shell ls -A $(OUR_CONFIG))
RAW_DOTFILES := $(filter-out $(EXCLUDE), $(shell ls -A))
COOK_DOTFILES := $(shell ls -A dot)

DEST_CONFIG_FILES := $(CONFIG_FILES:%=$(DEST_CONFIG)/%)
DEST_RAW_DOTFILES := $(RAW_DOTFILES:%=$(DESTINATION)/%)
DEST_COOK_DOTFILES := $(COOK_DOTFILES:%=$(DESTINATION)/.%)

DELETE = true
ifeq ($(DELETE), true)
DELETE_ARG := --delete
else
DELETE_ARG := 
endif

sync: $(DEST_CONFIG_FILES) $(DEST_RAW_DOTFILES) $(DEST_COOK_DOTFILES)
.PHONY: sync

$(DESTINATION):
	mkdir -p $(DESTINATION)

$(DEST_CONFIG):
	mkdir -p $(DEST_CONFIG)

$(DESTINATION)/.%: .% | $(DESTINATION)
	cp $< $@

$(DESTINATION)/.%: dot/% | $(DESTINATION)
	cp $< $@

$(DEST_CONFIG)/%: $(OUR_CONFIG)/% | $(DEST_CONFIG)
	rsync -a $(DELETE_ARG) $</ $@/

