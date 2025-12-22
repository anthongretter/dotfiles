VAR           ?= $(shell cat /etc/hostname)
TARGET_HOME   ?= $(shell echo $$HOME)

install:
	stow -d . -t $(TARGET_HOME) $(VAR)

uninstall:
	stow -D -d . -t $(TARGET_HOME) $(VAR)

restow:
	stow -R -d . -t $(TARGET_HOME) $(VAR)
