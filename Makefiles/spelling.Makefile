NPM?=npm
export NPM

node_modules:  # Install node modules
	$(NPM) install

.PHONY: cspell
cspell: node_modules  # Run cspell
	$(NPM) run cspell

.PHONY: cspell-precommit
cspell-precommit: node_modules  # Run cspell
	$(NPM) run cspell-precommit

.SILENT:
cspell-addwords: node_modules  # Add new words to cspell project dictionary
	@$(NPM) run --silent cspell:addwords >> .config/cspell-words.txt
