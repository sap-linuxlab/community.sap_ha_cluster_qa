
.ONESHELL:
venv/bin/activate:  ## Create virtual environment
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt
	. venv/bin/activate && pip install -r requirements-dev.txt

.PHONY: ansible-lint
.ONESHELL:
ansible-lint: venv/bin/activate  ## Run ansible-lint
	. venv/bin/activate
	tox exec -e lint -- ansible-galaxy collection install -r requirements.yml
	tox exec -e lint -- ansible-lint --offline --config .config/ansible-lint.yml

.PHONY: yamllint
.ONESHELL:
yamllint: venv/bin/activate ## Run yamllint
	. venv/bin/activate
	tox exec -e lint -- yamllint . --config-file .config/yamllint.yml

.PHONY: lint
lint: ansible-lint yamllint  ## Run all linting for the project

.PHONY: clean-venv
clean-venv:  ## Clean virtual environment
	rm -rf venv

.PHONY: clean-tox
clean-tox:  ## Clean virtual environment
	rm -rf .tox

.PHONY: clean
clean: clean-venv clean-tox  ## Clean

.PHONY: collection-list
collection-list:  ## List ansible installed collections
	. venv/bin/activate && \
	tox exec -e lint -- ansible-galaxy collection list
