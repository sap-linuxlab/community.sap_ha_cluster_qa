TEC01
=========

This Role extracts information to verify the Name and version of the 3rd-party HA software and ensure it is delivered correctly. The name and the version of the used HA software is important information when the configuration of an SAP system should be shown.

Requirements
------------

A 2 or more node pacemaker cluster managing S4/HANA ASCS and ERS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.


Role Variables
--------------

N/A

Dependencies
------------

`saphostcontrol` should be installed on all nodes

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - sap.cluster_qa.tec01

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)