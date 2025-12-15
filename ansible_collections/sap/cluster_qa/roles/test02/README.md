TEC02
=========

This Role extracts information to verify that there are no errors in the HA configuration as per HACheckConfig module in HA interface

Requirements
------------

A 2 or more node pacemaker cluster managing S4/HANA ASCS, ERS, PAS and AAS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.


Role Variables
--------------

N/A

Dependencies
------------

`saphostcontrol` should be installed

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - sap.cluster_qa.tec02

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)
