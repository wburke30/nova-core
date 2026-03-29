# NOVA — Node Heartbeat (Authoritative)

## Purpose

Defines how NOVA monitors:

- node availability
- system health
- execution capacity
- real-time status

---

## Core Rule

Every node MUST send heartbeat updates continuously.

No heartbeat = node is not trusted.

---

## Heartbeat Frequency

Default interval:

- every 10–30 seconds

Configurable per system.

---

## Heartbeat Structure

```json
{
  "node_id": "uuid",
  "status": "online|degraded|offline",
  "cpu_load": 0.0,
  "memory_usage": 0.0,
  "active_jobs": 0,
  "capabilities": [],
  "timestamp": "datetime"
}
```

---

## Field Definitions

### status

| Value | Meaning |
|------|--------|
| online | healthy |
| degraded | high load or partial failure |
| offline | unreachable |

---

### cpu_load
- value between 0–1
- represents current usage

---

### memory_usage
- value between 0–1
- indicates memory pressure

---

### active_jobs
- number of currently running tasks

---

## Heartbeat Endpoint

Nodes MUST send to:

```
POST /nodes/heartbeat
```

---

## Failure Detection

If no heartbeat received:

- within threshold (e.g., 60 seconds)

→ mark node as offline

---

## Load-Based Routing

Pipeline MUST use heartbeat data to:

- assign tasks to least-loaded node
- avoid overloaded nodes
- match capabilities

---

## Health States

| State | Behavior |
|------|--------|
| online | full execution |
| degraded | limited execution |
| offline | no execution |

---

## Recovery

If node resumes heartbeat:

- update status to online
- allow task assignment
- log recovery event

---

## Control Channel (Advanced)

System MAY send commands to nodes:

```json
{
  "command": "pause|resume|shutdown",
  "reason": ""
}
```

---

## Security Rules

Heartbeat MUST:

- be authenticated
- prevent spoofing
- validate node identity

---

## Logging

Heartbeat events MUST log:

```json
{
  "event": "heartbeat_received",
  "node_id": "",
  "status": "",
  "timestamp": ""
}
```

---

## Failure Handling

If heartbeat invalid:

- reject update
- log error
- maintain previous state

---

## Forbidden Behavior

System MUST NOT:

- trust stale heartbeat
- assign tasks to offline nodes
- ignore degraded states

---

## Final Rule

Heartbeat is the source of truth for node health.

If heartbeat fails → node must not be trusted.