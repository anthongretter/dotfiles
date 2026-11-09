VARIANTS    := fern garda cosmic
TARGET_HOME ?= $(shell echo $$HOME)
HOST        := $(shell cat /etc/hostname)

.PHONY: $(addprefix install-,$(VARIANTS)) \
        $(addprefix uninstall-,$(VARIANTS)) \
        $(addprefix restow-,$(VARIANTS)) \
        $(addprefix update-,$(VARIANTS)) \
        update-all install uninstall restow setup-cosmic theme-cosmic

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

# cosmic is a partial entry: sync only the files in its manifest, not all
# of ~/.config. (An explicit rule wins over the update-% pattern.)
update-cosmic:
	grep -v '^#' cosmic/_setup/files.txt | while read -r f; do \
		mkdir -p "cosmic/$$(dirname "$$f")"; \
		rm -rf "cosmic/$$f"; \
		cp -a "$(TARGET_HOME)/$$f" "cosmic/$$f"; \
	done

# Build/install what can't be stowed: mpvpaper, the patched lock screen,
# the wallpaper video and its service. See cosmic/README.md.
setup-cosmic:
	cosmic/_setup/install.sh

# Switch the cosmic entry's look: make theme-cosmic THEME=blackpearl
# (themes are the directories in cosmic/_setup/themes; gruvbox is the default)
theme-cosmic:
	cosmic/_setup/theme.sh $(THEME)

# Update all variants at once (for files common to every variant, e.g. user-dirs)
update-all: $(addprefix update-,$(VARIANTS))

# --- Hostname-based shortcuts (uses /etc/hostname) ---

install:
	stow -d . -t $(TARGET_HOME) $(HOST)

uninstall:
	stow -D -d . -t $(TARGET_HOME) $(HOST)

restow:
	stow -R -d . -t $(TARGET_HOME) $(HOST)
