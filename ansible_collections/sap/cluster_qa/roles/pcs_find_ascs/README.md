pcs_find_ascs
=========

This role finds the pacemaker cluster node where ascs is running.

Requirements
------------

The resource which is managing the ascs instance should have the keyword `ascs` in lower case.
Pacemaker cluster with ascs resource.
No other resource managed by ocf:heartbeat:SAPInstance should have the same keyword as `ascs`

Role Variables
--------------

This role sets the following facts:

- `sap_ascs_resource_name` - The name of the ASCS resource in the cluster
- `sap_ascs_node_name` - The node where ASCS is currently running
- `sap_ascs_sid` - The SAP system ID (SID) of the ASCS instance
- `sap_ascs_instance_name` - The instance name of the ASCS
- `sap_ascs_instance_number` - The instance number of the ASCS
- `sap_ascs_start_profile` - The path to the ASCS start profile file
- `sap_sid` - General SAP system ID (same as sap_ascs_sid)
- `sap_instance_name` - General instance name (same as sap_ascs_instance_name)
- `sap_instance_number` - General instance number (same as sap_ascs_instance_number)

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
