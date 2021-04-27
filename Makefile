
DESTINATION := $(HOME)
DEST_CONFIG := $(DESTINATION)/.config
OUR_CONFIG := config
SYNC_FILES := $(wildcard sync.*)
EXCLUDE := dot config .git Makefile README.md $(SYNC_FILES)
CONFIG_FILES := $(shell ls -A $(OUR_CONFIG))
RAW_DOTFILES := $(filter-out $(EXCLUDE), $(shell ls -A))
COOK_DOTFILES := $(shell ls -A dot)

DEST_CONFIG_FILES := $(CONFIG_FILES:%=$(DEST_CONFIG)/%)
DEST_RAW_DOTFILES := $(RAW_DOTFILES:%=$(DESTINATION)/%)
DEST_COOK_DOTFILES := $(COOK_DOTFILES:%=$(DESTINATION)/.%)

DELETE = true
ifeq ($(DELETE), true)
RSYNCFLAGS := -a --delete
else
RSYNCFLAGS := -a
endif

	# Make uses `sh` by default, the following chooses the user's shell and runs it on any file matching sync.*
	# This might not be desired behavior, maybe you want to always use sh. I might change it to something like that.
sync: $(DEST_CONFIG_FILES) $(DEST_RAW_DOTFILES) $(DEST_COOK_DOTFILES) $(SYNC_FILES)
	$(shell echo $$SHELL) $(SYNC_FILES)
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
	rsync $(RSYNCFLAGS) $</ $@/

