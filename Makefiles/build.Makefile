.PHONY: build
.ONESHELL:
build: venv/bin/activate  ## Build ansible collections
	. venv/bin/activate
	$(TOX) run -e build
