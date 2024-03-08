
.PHONY: molecule
# If the first argument is "molecule"...
ifeq (molecule,$(firstword $(MAKECMDGOALS)))
  # disregard everything except 'molecule' as do nothing targets
  DUMMY_TARGETS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(DUMMY_TARGETS):;@:)
  WORKDIR?=$(realpath tests)
	export WORKDIR
endif

.ONESHELL:
molecule: venv/bin/activate .tox/molecule/ansible_collections  ## Run Ansible Molecule commands in python virtual environment in "$WORKDIR" folder
# This target is required to use virtual environment for molecule - otherwise there are dependency conflicts with installed python packages
# One has to run molecule commands following way
# make molecule -- create -s cluster
# '--' ensures that non '-' chars will be lost when converting to maketargets
# By default will be called in 'tests' directory
# Working directory for molecule can be changed with environment variable WORKDIR like so
# both ways are equivalent:
# WORKDIR=roles/unpack make -- molecule --help
# make molecule -- --help WORKDIR=roles/unpack
	ansible_collections  . venv/bin/activate
	$(TOX) -s exec -e molecule -- molecule $(filter-out molecule,${MAKECMDGOALS})

.ONESHELL:
.PHONY: molecule-ovirt-auth
molecule-ovirt-auth: venv/bin/activate .tox/molecule/ansible_collections  ## Make sure that can authenticate to ovirt
	. venv/bin/activate
	$(TOX) -s exec -e molecule -- ansible-playbook $(CURDIR)/ansible_collections/sap/cluster_qa/playbooks/ovirt_auth.yml 

