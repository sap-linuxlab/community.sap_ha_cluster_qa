pcs_find_ers
=========

This role finds the pacemaker cluster node where ers is running.

Requirements
------------

The resource which is managing the ers instance should have the keyword `ers` in lower case.
Pacemaker cluster with ers resource.
No other resource managed by ocf:heartbeat:SAPInstance should have the same keyword as `ers`

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
         - sap.cluster_qa.pcs_find_ers

License
-------

GPL-3.0-only

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)