# community.sap_ha_cluster_qa Ansible collection #

This collection is being developed against upstream requirements and is currently focused on RHEL environments.

This is a collection of Roles for testing an S4/HANA Clusters.
It is designed to test S4/HANA Clusters comprising of 2 or more nodes where SAP S4/HANA ASCS and ERS instances are managed by RHEL Pacemaker Clusters that use `pcs` commands for Cluster administration.

## Supported operating systems

| Operating system | Cluster tooling | Status |
| --- | --- | --- |
| Red Hat Enterprise Linux (RHEL) | Pacemaker with `pcs` | Supported |
| Other Linux distributions (for example SUSE Linux Enterprise Server) | Pacemaker with `crmsh` or other tooling | Not supported yet |

This collection is validated for **RHEL** environments where:

- Pacemaker is administered with the `pcs` command-line interface
- SAP HA Interface for SAP ABAP application server instances is managed by the RHEL HA Add-On

Support for non-RHEL operating systems (for example SLES with `crmsh`) is out of scope for the current release. Enabling that support would require at least:

1. Abstracting cluster administration commands so `pcs`-specific tasks can be replaced or branched for `crmsh` (or another tool)
2. Reviewing and reducing reliance on `pcs`-only modules from dependent collections such as `sap.sap_operations`
3. Expanding inventory and documentation for the target OS and cluster stack
4. Re-validating the test roles against that platform

## Usage

Download the collection as part of the test project and make sure that the inventory file is modified to include your machines which are subjected to these tests.
In order for the tests to work correctly ensure that SAP HA Interface for SAP ABAP application server instances managed by RHEL HA Add-On is configured. This link can be followed to configure the same: https://access.redhat.com/solutions/3606101

## Collection Dependencies

This collection is dependant on
- `sap.sap_operations` collection modules

### Ansible Core Compatibility

- This collection requires ansible-core versions 2.18 to 2.20.
- Compatibility with other ansible-core versions has not been verified.
