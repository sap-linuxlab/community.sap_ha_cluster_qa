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

This role sets the following facts:

- `sap_ers_resource_name` - The name of the ERS resource in the cluster
- `sap_ers_node_name` - The node where ERS is currently running
- `sap_ers_sid` - The SAP system ID (SID) of the ERS instance
- `sap_ers_instance_name` - The instance name of the ERS
- `sap_ers_instance_number` - The instance number of the ERS
- `sap_ers_start_profile` - The path to the ERS start profile file
- `sap_sid` - General SAP system ID (same as sap_ers_sid)
- `sap_instance_name` - General instance name (same as sap_ers_instance_name)
- `sap_instance_number` - General instance number (same as sap_ers_instance_number)

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