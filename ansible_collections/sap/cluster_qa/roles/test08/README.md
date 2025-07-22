test08
=========

This role tests SAP ASCS failover by simulating a hardware failure through crashing the ASCS node using the `sysrq-trigger` command. It verifies that the Pacemaker cluster correctly detects the node failure and recovers the ASCS instance on a different node.

**Key Features:**
- Simulates complete hardware failure by crashing the ASCS node
- Automatically handles crashed node by continuing execution on surviving nodes
- Uses delegation to run monitoring tasks on available nodes
- Includes error handling to prevent playbook failure

Requirements
------------

A 2 or more node pacemaker cluster managing S4/HANA ASCS and ERS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.

**Warning**: This test will crash the node where ASCS is running, simulating a complete hardware failure. Ensure this is run in a test environment only.

**Node Handling**: After the ASCS node crashes, it becomes unresponsive. The test automatically:
- Excludes the crashed node from subsequent tasks
- Delegates monitoring tasks to surviving nodes
- Uses `any_errors_fatal: false` to prevent complete playbook failure

Role Variables
--------------

This role uses variables provided by the `sap.cluster_qa.pcs_find_ascs` role:
- `sap_ascs_node_name` - The node where ASCS is currently running
- `sap_ascs_resource_name` - The name of the ASCS resource in the cluster
- `sap_ascs_instance_number` - The ASCS instance number

Dependencies
------------

- `sap.cluster_qa.pcs_find_ascs` - Required to locate the ASCS node and resource information
- `sap.sap_operations` - Required for pcs_status_info module

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - sap.cluster_qa.test08

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat)
