TEST04
=========

It is the purpose of a HA-Solution to move the ASCS from one cluster node to another. A manual move of the ASCS is considered as basic operation within the cluster. This test ensures, that the manual switch can be performed without any errors.

This Role automatically creates 10 number of transaction locks on the ASCS Instance, triggers a failover of that ASCS instance on the other node and then verifies the locks of both the ASCS and ERS instance before and after the move.

Requirements
------------

Sudo required to run this role

Ansible collection sap.sap_operations from galaxy is required, see collection requirements.yml file

Verify that the SAP system runs in a stable mode, and that HA-Solution is activated. The HA Setup
with 2 cluster nodes must be used.

Role Variables
--------------

None

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles:
         - sap.cluster_qa.tec04

License
-------

GPL-3.0-only

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)
