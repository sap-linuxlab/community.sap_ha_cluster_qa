pcs_find_ascs
=========

This role finds the pacemaker cluster node where ascs is running.

Requirements
------------

The resource which is managing the ascs instance should have the keyword `ascs` in lower case.
Pacemaker cluster with ascs resource.

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
         - sap.cluster_qa.pcs_find_ascs

License
-------

GPL-3.0-only

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)
