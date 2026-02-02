test07
=========

This role tests database connection handling during HA failover scenarios. It configures the HA test tool, applies load to the environment through database connections, performs failover operations, and verifies the interaction between database connectivity and the HA solution.

**Test Purpose:**
- Configure and validate HA test tool for database connection monitoring
- Apply load to the environment through database connections and transactions
- Test database connection behavior during HA failover scenarios
- Verify HA solution response to database connection handling during failover
- Ensure database connections are properly re-established after failover
- Validate transaction integrity and connection recovery mechanisms
- Ensure ASCS failover respects ERS location constraints (ASCS cannot move to ERS node)

**Test Procedure:**
1. **Configure HA test tool** - Set up and validate HA test tool for database connection monitoring
2. **Establish baseline** - Verify initial database connectivity and connection state
3. **Apply load** - Generate database connections and transactions to simulate production load
4. **Monitor connections** - Track active database connections before failover
5. **Trigger failover** - Perform ASCS failover while load is active
6. **Verify reconnection** - Monitor database connection recovery after failover
7. **Validate integrity** - Verify transaction integrity and connection stability
8. **Ensure separation** - Confirm ASCS and ERS remain on different nodes throughout

Requirements
------------

A 3 or more node pacemaker cluster managing S4/HANA ASCS and ERS Instances using the `SAPInstance` resource agent with the SAP HA interface for SAP ABAP application server instances as mentioned in: https://access.redhat.com/solutions/3606101.

**Prerequisites:**
- **HA test tool must be available and configurable** (auto-configured by test if possible)
- Database connectivity must be established and functional
- SAP system running in stable mode with HA solution activated
- 3+ node cluster setup required
- Sufficient system resources to handle load generation

**Expected Outcomes:**
- **HA test tool configuration succeeds** (auto-configured if needed)
- Database connections are established successfully before failover
- Load is applied to the environment as expected
- Failover is triggered successfully while load is active
- Database connections are properly re-established after failover
- Transaction integrity is maintained throughout the failover process
- HA solution detects and handles failover appropriately
- ASCS never moves to ERS node
- ASCS/ERS separation is maintained throughout
- Connection recovery time is within acceptable limits

**HA Test Tool Configuration:**
The test will automatically configure the HA test tool if needed:
- Verify HA test tool availability and installation
- Configure monitoring parameters for database connections
- Set up connection tracking and logging
- Validate tool functionality before proceeding

**Load Generation:**
The test applies realistic load to the environment:
- Establish multiple database connections
- Generate database transactions and queries
- Maintain active connections during failover
- Monitor connection state and transaction status

**Expected HA Behavior:**
The HA solution should:
1. Detect ASCS failover trigger appropriately
2. Perform failover to an available node (not the ERS node)
3. Allow database connections to be re-established on the new node
4. Maintain transaction integrity during the failover process
5. Complete failover within acceptable time limits
6. Ensure system stability after failover completion

Dependencies
------------

- `sap.cluster_qa.pcs_find_ascs` - Required to locate the ASCS node and resource information
- `sap.cluster_qa.pcs_find_ers` - Required to locate the ERS node and resource information
- `sap.sap_operations` - Required for host_info and pcs_status_info modules

Example Playbook
----------------

    - hosts: servers
      roles:
         - sap.cluster_qa.test07

License
-------

GPLv3

Author Information
------------------

Amir Memon (@amemon-redhat)

