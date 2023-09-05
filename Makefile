.ONESHELL:
venv/bin/activate:  ## Create virtual environment
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt
	. venv/bin/activate && pip install -r requirements-dev.txt

.PHONY: ansible-lint
ansible-lint: venv/bin/activate  ## Run ansible-lint
	. venv/bin/activate && ANSIBLE_COLLECTIONS_PATH=./ ansible-lint --offline --config .config/ansible-lint.yml

.PHONY: yamllint
yamllint: venv/bin/activate ## Run yamllint
	. venv/bin/activate && yamllint . --config-file .config/yamllint.yml

.PHONY: lint
lint: ansible-lint yamllint  ## Run all linting for the project

.PHONY: clean-venv
clean-venv:  ## Clean virtual environment
	rm -rf venv

.PHONY: clean
clean: clean-venv  ## Clean
