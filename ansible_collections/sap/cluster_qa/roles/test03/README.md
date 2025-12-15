TEC03
=========

This Role extracts information to verify that the shared Library (HA-Interface) is being loaded correctly

Requirements
------------

A 2 or more node pacemaker cluster managing S4/HANA ASCS, ERS, PAS and AAS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.


Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

`saphostcontrol` should be installed

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - sap.cluster_qa.tec03

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)
