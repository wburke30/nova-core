# NOVA — Timeout & Cancellation (Authoritative)

## Purpose

Defines how NOVA controls execution duration and allows safe interruption of tasks.

Prevents:

- infinite loops
- runaway processes
- resource exhaustion
- stuck pipelines

---

## Core Rule

EVERY task MUST have:

- a timeout
- cancellation capability

No exceptions.

---

## Timeout Definition

Timeout = maximum allowed execution time for a task.

---

## Timeout Structure

```json
{
  "task_id": "uuid",
  "timeout_seconds": 60,
  "started_at": "timestamp",
  "expires_at": "timestamp"
}
```

---

## Timeout Rules

- timeout MUST be enforced at execution level
- timeout MUST terminate execution
- timeout MUST be configurable per task

---

## Default Timeouts

| Task Type | Timeout |
|----------|--------|
| simple task | 30s |
| API call | 15s |
| heavy computation | 120s |
| external integration | 60s |

---

## Cancellation

Cancellation allows:

- user to stop task
- system to stop task
- emergency stop override

---

## Cancellation Triggers

### Manual
- user cancels task

---

### Automatic
- timeout reached
- system failure detected
- policy violation

---

### Emergency
- system-wide stop command

---

## Cancellation Flow

```
cancel request
→ identify task
→ stop execution
→ release resources
→ update status
→ log event
```

---

## Task States

```json
"status": "queued|running|completed|failed|cancelled"
```

---

## Resource Cleanup

On cancellation:

- terminate process
- release locks
- free memory
- close connections

---

## Pipeline Integration

Cancellation must:

- stop pipeline execution
- mark pipeline_run as cancelled
- prevent further stages

---

## Worker Integration

Workers MUST:

- listen for cancellation signals
- stop execution immediately
- report cancellation status

---

## Retry Behavior

Cancelled tasks:

- MUST NOT auto-retry
- may be manually restarted

---

## Logging

Cancellation MUST log:

```json
{
  "event": "task_cancelled",
  "task_id": "",
  "reason": "",
  "timestamp": ""
}
```

---

## Failure Handling

If cancellation fails:

- force termination
- escalate to system level
- log critical error

---

## Security Rules

Cancellation MUST:

- respect permissions
- prevent unauthorized cancellation
- enforce admin override if needed

---

## Forbidden Behavior

System MUST NOT:

- allow infinite execution
- ignore timeout
- continue after cancellation

---

## Final Rule

Tasks must always be stoppable.

If execution cannot be stopped → system is unsafe.