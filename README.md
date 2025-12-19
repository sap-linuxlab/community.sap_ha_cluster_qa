# community.sap_ha_cluster_qa Ansible collection #

**⚠️ EXPERIMENTAL - This collection has only been tested on RHEL (Red Hat Enterprise Linux) systems.**

This collection is being developed against upstream requirements and is currently focused on RHEL environments.

This is a collection of Roles for testing an S4/HANA Clusters.
It is designed to test S4/HANA Clusters comprising of 2 or more nodes where SAP S4/HANA ASCS and ERS instances are managed by RHEL Pacemaker Clusters that use `pcs` commands for Cluster administration.

## Usage

Download the collection as part of the test project and make sure that the inventory file is modified to include your machines which are subjected to these tests.
In order for the tests to work correctly ensure that SAP HA Interface for SAP ABAP application server instances managed by RHEL HA Add-On is configured. This link can be followed to configure the same: https://access.redhat.com/solutions/3606101

### Setup and Configuration

1. **Install Collection Dependencies:**
   ```bash
   ansible-galaxy collection install -r requirements.yml
   ```

2. **Configure Inventory:**
   - Edit `tests/inventory/x86_64.yml` or `tests/inventory/ppc64le.yml` to include your cluster nodes
   - Ensure `ansible_user` is set correctly for each host (default is `root`)

3. **Ansible Configuration:**
   - The project includes an `ansible.cfg` file in the root directory with pre-configured paths
   - All paths are relative, so no user-specific customization is needed
   - The configuration automatically finds:
     - Collections in the current directory and `./collections` subdirectory
     - Roles in the collection structure
     - System-wide collections and roles

4. **Running Tests:**
   ```bash
   # Run a specific test
   ansible-playbook -i tests/inventory/x86_64.yml ansible_collections/sap/cluster_qa/playbooks/test09.yml
   
   # Run all tests (test01 through test09, skipping test07)
   ansible-playbook -i tests/inventory/x86_64.yml ansible_collections/sap/cluster_qa/playbooks/run_all_tests.yml
   ```

## Collection Dependencies

This collection is dependent on
- `sap.sap_operations` collection modules

### Ansible Core Compatibility

- This collection requires ansible-core versions 2.18 to 2.20.
- Compatibility with other ansible-core versions has not been verified.


