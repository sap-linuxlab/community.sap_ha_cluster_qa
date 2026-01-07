test09
=========

This role tests the SAP Message Server automatic restart mechanism and its interaction with the HA solution. It verifies that recoverable Message Server outages are handled correctly by the SAP Start Service and that unrecoverable failures trigger appropriate HA responses.

**Test Purpose:**
- **Verify Restart_Program parameter configuration** for Message Server (auto-configure if missing)
- Verify Message Server automatic restart functionality via SAP Start Service
- Test interaction between SAP automatic restart and HA solution
- Ensure HA solution responds appropriately when automatic restart fails
- Validate that ASCS failover respects ERS location constraints

**Test Procedure:**
1. **Validate Restart_Program parameter** is configured in ASCS profile (auto-insert if missing)
2. Kill Message Server process repeatedly (up to 6 times by default)
3. Monitor SAP Start Service automatic restart behavior
4. Verify HA solution response when automatic restart threshold is exceeded
5. Ensure ASCS and ERS remain on different nodes throughout

Requirements
------------

A 3 or more node pacemaker cluster managing S4/HANA ASCS and ERS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.

**Prerequisites:**
- **SAP Profile Parameter "Restart_Program" must be configured for Message Server** (auto-configured by test if missing)
- SAP system running in stable mode with HA solution activated
- 3+ node cluster setup required

**Reference:** [SAP Support Content: Message Server Restart](https://help.sap.com/docs/SUPPORT_CONTENT/si/3362959619.html?locale=en-US)

**Restart_Program Configuration Example:**
```
Restart_Program_01 = local $(DIR_EXECUTABLE)/msg_server pf=$(DIR_PROFILE)/$(SAPSYSTEMNAME)_$(INSTANCE_NAME)_$(HOSTNAME)
```

Role Variables
--------------

This role uses variables provided by the `sap.cluster_qa.pcs_find_ascs` and `sap.cluster_qa.pcs_find_ers` roles:
- `sap_ascs_node_name` - The node where ASCS is currently running
- `sap_ers_node_name` - The node where ERS is currently running
- `sap_ascs_resource_name` - The name of the ASCS resource in the cluster
- `sap_ascs_instance_number` - The ASCS instance number
- `max_kill_attempts` - Maximum Message Server kill attempts (default: 6)
- `sap_ascs_start_profile` - Path to ASCS profile file (used for Restart_Program validation)

**Expected Outcomes:**
- **Restart_Program parameter validation passes** (auto-configured if missing)
- Message Server restarts automatically via SAP Start Service (recoverable errors)
- Process ID changes with each restart
- Restart events logged in sapstartsrv.log/sapstart.log
- HA solution triggers ASCS restart/failover after restart threshold exceeded
- ASCS never moves to ERS node

**Auto-Configuration Feature:**
If the `Restart_Program` parameter is not found, the test will automatically:
- Check for existing `Start_Program` parameter for Message Server
- **Replace `Start_Program` with `Restart_Program`** if found (to avoid conflicts)
- Insert `_MS = ms.sap$(SAPSYSTEMNAME)_$(INSTANCE_NAME)` variable definition if needed
- Add `Restart_Program_00 = local $(_MS) pf=$(_PF)` parameter if no existing Start_Program
- Create backup of original profile before modification
- **Restart sapstartsrv service** to apply the new configuration
- **Wait for cluster to detect ASCS resource failures** after service restart
- **Wait for ASCS resource to be fully started** by the cluster
- **Re-discover ASCS location** after cluster recovery (may cause failover)
- Verify successful configuration before proceeding

**Important Note:** When the `Restart_Program` parameter is automatically configured, the sapstartsrv service will be restarted, which causes the cluster to detect resource failures and may trigger ASCS failover to another node. The test intelligently waits for complete cluster recovery before proceeding.

**Configuration Logic:**
- If `Start_Program_XX = local $(_MS) pf=$(_PF)` exists → Replace with `Restart_Program_00 = local $(_MS) pf=$(_PF)`
- If no Start_Program exists → Add both `_MS` variable and `Restart_Program_00` parameter

Dependencies
------------

- `sap.cluster_qa.pcs_find_ascs` - Required to locate the ASCS node and resource information
- `sap.cluster_qa.pcs_find_ers` - Required to locate the ERS node and resource information  
- `sap.sap_operations` - Required for host_info and pcs_status_info modules

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - sap.cluster_qa.test09

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
Kirill Satarin (@kksat) 