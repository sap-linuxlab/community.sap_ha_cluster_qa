test06
=========

This role tests SAP ERS (Enqueue Replication Server) failover by killing the `enq_replicator` process and verifying that the Pacemaker cluster correctly recovers the ERS instance on a different node.

Requirements
------------

A 2 or more node pacemaker cluster managing S4/HANA ASCS and ERS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.

Role Variables
--------------

This role uses variables provided by the `sap.cluster_qa.pcs_find_ers` role:
- `sap_ers_node_name` - The node where ERS is currently running
- `sap_ers_resource_name` - The name of the ERS resource in the cluster
- `sap_ers_instance_number` - The ERS instance number

Dependencies
------------

- `sap.cluster_qa.pcs_find_ers` - Required to locate the ERS node and resource information
- `sap.sap_operations` - Required for host_info and pcs_status_info modules

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - sap.cluster_qa.test06

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)
