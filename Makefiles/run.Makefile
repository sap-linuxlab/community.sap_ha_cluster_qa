TEST_ANSIBLE_ARCHITECTURE ?= x86_64
TEST_ANSIBLE_GROUP ?= s4hana-2n
ANSIBLE_CONFIG=./test/ansible.cfg

run-playbook-%:
	ANSIBLE_CONFIG=${ANSIBLE_CONFIG} \
	$(TOX) exec -e run  -- \
	ansible-playbook \
		--inventory test/inventory/${TEST_ANSIBLE_ARCHITECTURE}.yml \
		--limit ${TEST_ANSIBLE_GROUP} \
		./ansible_collections/sap/cluster_qa/playbooks/$*.yml
