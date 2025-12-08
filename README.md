# README #

**⚠️ EXPERIMENTAL - This collection is currently EXPERIMENTAL and has only been tested on RHEL (Red Hat Enterprise Linux) systems.**

This is a collection of Roles for testing an S4/HANA Clusters.
It is designed to test S4/HANA Clusters comprising of 2 or more nodes where SAP S4/HANA ASCS and ERS instances are managed by RHEL Pacemaker Clusters that use `pcs` commands for Cluster administration.

## Usage

Download the collection as part of the test project and make sure that the inventory file is modified to include your machines which are subjected to these tests.
In order for the tests to work correctly ensure that SAP HA Interface for SAP ABAP application server instances managed by RHEL HA Add-On is configured. This link can be followed to configure the same: https://access.redhat.com/solutions/3606101

## Known Issues and Limitations

The following issues have been identified in this collection. These are documented for awareness as the collection is focused on RHEL compatibility:

### Hardcoded Dependencies on PCS

- The collection has hardcoded dependencies on `pcs` (Pacemaker Configuration System) commands throughout the codebase.
- Commands and modules are PCS-specific and would require redesign to support alternative cluster management tools such as `crmsh`.
- The `sap.sap_operations` collection modules used in this collection are PCS-only and do not support other cluster management interfaces.

### External Collection Dependency

- The collection uses `sap.sap_operations` collection from https://github.com/redhat-sap/rh_operations, which contains core functionality.
- This external dependency requires the external collection to be available and compatible.

### Hardcoded Parameters

- Some parameters and configuration values are hardcoded in the roles and tasks.
- These could be moved into variables for better flexibility at a later stage

### Ansible Core Compatibility

- This collection requires linting compliance with ansible-core versions 2.18 to 2.20.
- Compatibility with other ansible-core versions has not been verified.

## Notes

As this collection is being developed against upstream requirements and is currently focused on RHEL environments, the above limitations are documented for reference and awareness.

