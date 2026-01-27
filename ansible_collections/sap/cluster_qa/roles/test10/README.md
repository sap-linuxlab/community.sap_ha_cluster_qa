test10
=========

This role tests the irrecoverable outage of the Message Server when using the `Start_Program` profile parameter. It verifies that the HA solution correctly detects the Message Server failure and triggers an appropriate failover response.

**Test Purpose:**
- Verify that `Start_Program` parameter (not `Restart_Program`) is configured for Message Server
- Test irrecoverable Message Server outage handling
- Verify HA solution detects Message Server failure and triggers ASCS failover
- Ensure ASCS failover respects ERS location constraints (ASCS cannot move to ERS node)

**Test Procedure:**
1. **Validate Start_Program parameter** is configured in ASCS profile (auto-configure if missing)
2. Kill Message Server process once (irrecoverable failure)
3. Wait for HA solution to detect the failure
4. Verify HA solution triggers ASCS failover to available node
5. Ensure ASCS and ERS remain on different nodes

**Key Difference from test09:**
- test09 uses `Restart_Program` - Message Server restarts automatically multiple times
- test10 uses `Start_Program` - Message Server does NOT restart automatically, HA must failover immediately

Requirements
------------

A 3 or more node pacemaker cluster managing S4/HANA ASCS and ERS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.

**Prerequisites:**
- **SAP Profile Parameter "Start_Program" must be configured for Message Server** (auto-configured by test if missing)
- If `Restart_Program` is configured, it will be automatically replaced with `Start_Program`
- SAP system running in stable mode with HA solution activated
- 3+ node cluster setup required

**Expected Outcomes:**
- **Start_Program parameter validation passes** (auto-configured if missing)
- Message Server process is killed successfully
- HA solution detects Message Server failure within a few minutes
- ASCS failover is triggered automatically (ASCS moves to different node)
- ASCS never moves to ERS node
- ASCS/ERS separation is maintained throughout

**Auto-Configuration Feature:**
If the `Start_Program` parameter is not found, the test will automatically:
- Check for existing `Restart_Program` parameter for Message Server
- **Replace `Restart_Program` with `Start_Program`** if found (to avoid conflicts)
- Insert `_MS = ms.sap$(SAPSYSTEMNAME)_$(INSTANCE_NAME)` variable definition if needed
- Add `Start_Program_00 = local $(_MS) pf=$(_PF)` parameter if no existing Start_Program or Restart_Program
- Create backup of original profile before modification
- **Restart ASCS and ERS resources** to apply the new configuration
- **Wait for cluster to detect resource restarts** and recovery
- **Wait for ASCS and ERS resources to be fully started** by the cluster
- **Re-discover ASCS location** after cluster recovery (may cause failover)
- Verify successful configuration before proceeding

**Important Note:** When the `Start_Program` parameter is automatically configured, both ASCS and ERS resources will be restarted, which causes the cluster to detect resource changes and may trigger failover. The test intelligently waits for complete cluster recovery before proceeding.

**Configuration Logic:**
- If `Restart_Program_XX = local $(_MS) pf=$(_PF)` exists → Replace with `Start_Program_XX = local $(_MS) pf=$(_PF)`
- If no Start_Program or Restart_Program exists → Add both `_MS` variable and `Start_Program_00` parameter

**Expected HA Behavior:**
Two reactions are allowed for the HA-Solution:
1. The HA-Solution restarts the ASCS on the same node. Only if the restart fails a certain amount of times, a failover of the ASCS is triggered. The target node must not be the node with the active ERS.
2. Since the message server is not supposed to be restarted by the SAP Startup Framework (Start_Program used), the HA-Solution should detect this in a few minutes and trigger a failover of the ASCS instance automatically.

Dependencies
------------

- `sap.cluster_qa.pcs_find_ascs` - Required to locate the ASCS node and resource information
- `sap.cluster_qa.pcs_find_ers` - Required to locate the ERS node and resource information  
- `sap.sap_operations` - Required for host_info and pcs_status_info modules

Example Playbook
----------------

    - hosts: servers
      roles:
         - sap.cluster_qa.test10

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)
