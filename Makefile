TOX=tox
export TOX

include Makefiles/molecule/Makefile

.ONESHELL:
.tox/%/ansible_collections: venv/bin/activate
	. venv/bin/activate
	$(TOX) exec -e $* -- ansible-galaxy collection install -r requirements.yml
	$(TOX) exec -e $* -- ansible-galaxy collection install -r tox/requirements-$*.yml

.PHONY: lint/ansible_collections
.ONESHELL:
lint/ansible_collections: venv/bin/activate
	. venv/bin/activate
	$(TOX) exec -e lint -- ansible-galaxy collection install -r tox/requirements-molecule.yml

.ONESHELL:
venv/bin/activate:  ## Create virtual environment
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt
	. venv/bin/activate && pip install -r requirements-dev.txt

.PHONY: ansible-lint
.ONESHELL:
ansible-lint: venv/bin/activate .tox/lint/ansible_collections lint/ansible_collections ## Run ansible-lint
	. venv/bin/activate
	$(TOX) exec -e lint -- ansible-lint --offline --config .config/ansible-lint.yml

.PHONY: yamllint
.ONESHELL:
yamllint: venv/bin/activate  ## Run yamllint
	. venv/bin/activate
	$(TOX) exec -e lint -- yamllint . --config-file .config/yamllint.yml

.PHONY: lint
lint: collection-dependencies ansible-lint yamllint  ## Run all linting for the project

.PHONY: clean-venv
clean-venv:  ## Clean virtual environment
	rm -rf venv

.PHONY: clean-tox
clean-tox:  ## Clean virtual environment
	rm -rf .tox

.PHONY: clean-tox-%
clean-tox-%:  ## Clean virtual environment
	rm -rf .tox/$*

.PHONY: clean
clean: clean-venv clean-tox  ## Clean

.PHONY: collection-list-%
.ONESHELL:
collection-list-%: venv/bin/activate ## List ansible installed collections
	. venv/bin/activate
	$(TOX) exec -e $* -- ansible-galaxy collection list

.PHONY: collection-dependencies
collection-dependencies:  ## Check if collection dependencies and project requiements are the same
	./hack/collection-dependencies.sh
