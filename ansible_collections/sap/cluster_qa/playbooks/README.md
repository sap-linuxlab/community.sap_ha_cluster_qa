# RHEL 8 SAP HANA Pacemaker Cluster Tests

### This Repo contains raw playbooks to test the working of a 2 node SAP HANA System replication in a RHEL HA pacemaker cluster.
Important Note: This repo is tested and found to be working only on RHEL 8.4 and RHEL 8.6 

## Requirements
1. Ansible pre-installed on control node
2. Cluster nodes as managed hosts and set in the inventory file.


## Inventory example

[s4hana2]

s4hana03

s4hana04


## Playbook example
~~~
---
- name: Playbook to test the working state of the Pacemaker HANA cluster Nodes
  hosts: all 
- import_playbook: 01-acquire-and-set-facts.yml 
- import_playbook: 02-fence-test.yml
- import_playbook: 01-acquire-and-set-facts.yml 
- import_playbook: 03-hdb-stop-test.yml
- import_playbook: 01-acquire-and-set-facts.yml 
- import_playbook: 04-hdb-kill-test.yml
- import_playbook: 01-acquire-and-set-facts.yml 
- import_playbook: 05-node-crash-test.yml
- import_playbook: 01-acquire-and-set-facts.yml 
### ....and so on as per which tests you decide


~~~

Info: As the cluster state changes after each test the first playbook "01-acquire-and-set-facts.yml" must be run again to acquire the updated state before running the next test

## Latest Playbook
In this repo the playbook 20-full-sap-hana-ha-final-test.yml contains the complete set of tests with different combinations of AUTOMATED_REGISTER and PREFER_SITE_TAKEOVER values. But Generally any environment may not need to test all the 4 combinations, therefore the final test playbook can be adjusted as per your environment.


## Saving the log file with time and date
### One way to save the log files is to have the following line in ~/.bashrc of the user running playbook
export ANSIBLE_LOG_PATH=$PWD/test-runs/2nH.`date +%Y-%m-%d-%H:%M:%S`.log
export ANSIBLE_FORCE_COLOR=true
