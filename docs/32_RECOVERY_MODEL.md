# NOVA — Recovery Model (Authoritative)

## Purpose

Defines how NOVA recovers from:

- system crashes
- worker failures
- node failures
- partial executions
- unexpected interruptions

Ensures:

- system continuity
- data integrity
- safe restart behavior

---

## Core Rule

System MUST recover safely and deterministically.

No duplicate execution. No lost state.

---

## Recovery Scenarios

---

### 1. System Crash

- restart system
- reload state from database
- resume pending work

---

### 2. Worker Failure

- detect failed worker
- reassign tasks
- retry execution

---

### 3. Node Failure

- mark node offline
- reroute tasks
- maintain system continuity

---

### 4. Partial Execution

- detect incomplete tasks
- rollback OR resume safely

---

## Recovery Flow

```
detect failure
→ identify affected tasks
→ determine safe state
→ recover or rollback
→ resume execution
```

---

## State Restoration

System MUST restore:

- pipeline runs
- task status
- queue state
- locks (if valid)

---

## Last Known Good State

System MUST maintain:

- safe checkpoints
- recoverable state

---

## Job Recovery

Jobs MUST:

- be re-queued if incomplete
- not execute twice
- respect idempotency

---

## Lock Recovery

System MUST:

- release expired locks
- prevent stale locks
- reassign locked tasks safely

---

## Pipeline Recovery

If pipeline interrupted:

- resume from last valid stage
OR
- restart safely if required

---

## Retry Integration

Recovery MUST:

- integrate with retry logic
- respect retry limits

---

## Reconciliation Integration

After recovery:

- run reconciliation if needed
- ensure system consistency

---

## Logging

All recovery actions MUST log:

```json
{
  "event": "recovery_action",
  "type": "",
  "details": {},
  "timestamp": ""
}
```

---

## Failure Escalation

If recovery fails:

- escalate to system-level alert
- prevent further execution
- require manual intervention

---

## Security Rules

Recovery MUST:

- validate permissions
- prevent unauthorized state changes
- maintain data integrity

---

## Forbidden Behavior

System MUST NOT:

- duplicate execution
- lose data
- resume from unknown state
- ignore failed recovery

---

## Final Rule

Recovery ensures system survival.

If recovery fails → system is unreliable.