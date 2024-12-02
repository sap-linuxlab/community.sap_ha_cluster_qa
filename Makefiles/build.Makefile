.PHONY: build
build:  ## Build ansible collections
	export COLLECTION_GALAXY_YML=ansible_collections/sap/cluster_qa/galaxy.yml
	ansible-galaxy collection build  --output-path build --force "ansible_collections/sap/cluster_qa"
