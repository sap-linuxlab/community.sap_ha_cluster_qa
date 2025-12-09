# README: community.sap_ha_cluster_qa collection #

**⚠️ EXPERIMENTAL - This collection has only been tested on RHEL (Red Hat Enterprise Linux) systems.**

This collection is being developed against upstream requirements and is currently focused on RHEL environments.

This is a collection of Roles for testing an S4/HANA Clusters.
It is designed to test S4/HANA Clusters comprising of 2 or more nodes where SAP S4/HANA ASCS and ERS instances are managed by RHEL Pacemaker Clusters that use `pcs` commands for Cluster administration.

## Usage

Download the collection as part of the test project and make sure that the inventory file is modified to include your machines which are subjected to these tests.
In order for the tests to work correctly ensure that SAP HA Interface for SAP ABAP application server instances managed by RHEL HA Add-On is configured. This link can be followed to configure the same: https://access.redhat.com/solutions/3606101

## Collection Dependancies

This collection is dependant on
- `sap.sap_operations` collection modules

### Ansible Core Compatibility

- This collection requires ansible-core versions 2.18 to 2.20.
- Compatibility with other ansible-core versions has not been verified.


