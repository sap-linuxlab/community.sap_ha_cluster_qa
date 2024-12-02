.PHONY: build
build:  ## Build ansible collections
	$(TOX) run -e build
