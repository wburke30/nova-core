# NOVA — Node Management (Authoritative)

## Purpose

Defines how NOVA manages distributed execution nodes.

Nodes allow NOVA to:

- scale horizontally
- distribute workloads
- utilize specialized hardware (GPU, storage, etc.)
- operate across multiple devices

---

## Core Rule

Nodes execute tasks.  
Pipeline controls ALL decisions.

Nodes MUST NOT operate independently.

---

## Node Definition

A node is an external or local system capable of executing tasks.

---

## Node Structure

```json
{
  "node_id": "uuid",
  "hostname": "string",
  "status": "online|offline|degraded",
  "capabilities": ["cpu", "gpu", "storage", "network"],
  "load": 0.0,
  "last_seen": "timestamp"
}
```

---

## Node Roles

### Primary Node
- main system controller
- runs pipeline
- manages coordination

---

### Worker Node (Satellite)

- executes assigned tasks
- reports status
- does not control system logic

---

## Node Registration

Nodes MUST register via:

```
POST /nodes/register
```

---

### Registration Payload

```json
{
  "node_id": "",
  "hostname": "",
  "capabilities": []
}
```

---

## Authentication

Nodes MUST:

- authenticate before joining
- use secure tokens or keys

---

## Node Capabilities

Nodes declare capabilities such as:

- CPU processing
- GPU processing
- storage operations
- network operations

---

## Task Assignment

Pipeline MUST assign tasks based on:

- node capability
- node load
- task requirements

---

## Load Balancing

System MUST:

- distribute workload evenly
- avoid overloading nodes
- prioritize available resources

---

## Node Status Tracking

Node status MUST be updated via:

- heartbeat system (see next file)
- execution results
- health checks

---

## Failure Handling

If node fails:

- mark as offline
- reassign tasks
- log event

---

## Recovery

If node returns:

- re-register
- update status
- resume workload

---

## Security Rules

Nodes MUST:

- be authorized
- be trusted
- not execute unauthorized tasks

---

## Network Rules

Node communication MUST:

- be secure
- be authenticated
- avoid public exposure where possible

---

## Logging

All node events MUST log:

```json
{
  "event": "node_registered|node_offline|node_assigned",
  "node_id": "",
  "timestamp": ""
}
```

---

## Forbidden Behavior

System MUST NOT:

- allow unverified nodes
- assign tasks blindly
- trust node without validation

---

## Final Rule

Nodes extend execution capability.

Pipeline remains the authority.