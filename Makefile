VARIANTS    := fern garda
TARGET_HOME ?= $(shell echo $$HOME)
HOST        := $(shell cat /etc/hostname)

.PHONY: $(addprefix install-,$(VARIANTS)) \
        $(addprefix uninstall-,$(VARIANTS)) \
        $(addprefix restow-,$(VARIANTS)) \
        $(addprefix update-,$(VARIANTS)) \
        update-all install uninstall restow

# --- Per-variant targets ---

install-%:
	stow -d . -t $(TARGET_HOME) $*

uninstall-%:
	stow -D -d . -t $(TARGET_HOME) $*

restow-%:
	stow -R -d . -t $(TARGET_HOME) $*

# Pull live $HOME files back into the repo for the given variant
update-%:
	for f in $$(ls -A $*); do cp -rf $(TARGET_HOME)/$$f ./$*/; done

# Update all variants at once (for files common to every variant, e.g. user-dirs)
update-all: $(addprefix update-,$(VARIANTS))

# --- Hostname-based shortcuts (uses /etc/hostname) ---

install:
	stow -d . -t $(TARGET_HOME) $(HOST)

uninstall:
	stow -D -d . -t $(TARGET_HOME) $(HOST)

restow:
	stow -R -d . -t $(TARGET_HOME) $(HOST)
