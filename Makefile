ANSIBLE_COLLECTIONS_PATH_VENV=venv
export ANSIBLE_COLLECTIONS_PATH_VENV

COLLECTION_PATH=.
export COLLECTION_PATH

.ONESHELL:
venv/bin/activate:  ## Create virtual environment
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt
	. venv/bin/activate && pip install -r requirements-dev.txt

.PHONY: requirements.yml
requirements.yml:  ## Install ansible collections requirements
	. venv/bin/activate && \
	ANSIBLE_COLLECTIONS_PATH=${ANSIBLE_COLLECTIONS_PATH_VENV} ansible-galaxy collection install -r requirements.yml --collections-path ${ANSIBLE_COLLECTIONS_PATH_VENV}

.PHONY: ansible-lint
ansible-lint: venv/bin/activate  ## Run ansible-lint
	. venv/bin/activate && ANSIBLE_COLLECTIONS_PATH=${COLLECTION_PATH}:${ANSIBLE_COLLECTIONS_PATH_VENV} ansible-lint --offline --config .config/ansible-lint.yml

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

.PHONY: collection-list
collection-list:  ## List ansible installed collections
	. venv/bin/activate && \
	ANSIBLE_COLLECTIONS_PATH=${COLLECTION_PATH}:${ANSIBLE_COLLECTIONS_PATH_VENV} \
	ansible-galaxy collection list
