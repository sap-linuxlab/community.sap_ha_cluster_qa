
ansible-lint:  ## Run ansible-lint
	ansible-lint .

yamllint:  ## Run yamllint
	yamllint . --config-file .config/yamllint.yml


lint: ansible-lint yamllint  ## Run all linting for the project
