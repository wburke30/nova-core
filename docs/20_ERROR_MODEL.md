# NOVA — Error Model (Authoritative)

## Purpose

Defines how NOVA handles, categorizes, and responds to all errors.

Ensures:
- visibility
- consistency
- recoverability
- safety

---

## Core Rule

NO error may be silent.

Every error MUST:
- be captured
- be logged
- be handled

---

## Error Structure

```json
{
  "error_id": "uuid",
  "project_id": "uuid",
  "pipeline_run_id": "uuid",
  "task_id": "uuid",
  "component": "pipeline|agent|tool|connector|system",
  "code": "string",
  "message": "string",
  "severity": "low|medium|high|critical",
  "retryable": true,
  "timestamp": "datetime"
}
```

---

## Error Categories

---

### 1. Validation Errors

- invalid input
- schema mismatch

Action:
→ reject request

---

### 2. Execution Errors

- tool failure
- script crash

Action:
→ retry OR fail

---

### 3. Connector Errors

- API failure
- timeout
- rate limit

Action:
→ retry with backoff

---

### 4. System Errors

- DB failure
- worker crash

Action:
→ trigger recovery

---

### 5. Policy Errors

- unauthorized action
- blocked by policy

Action:
→ stop execution

---

## Severity Levels

| Level | Meaning |
|------|--------|
| low | minor issue |
| medium | needs attention |
| high | action failed |
| critical | system risk |

---

## Retry Rules

Retry ONLY if:

- error is retryable
- idempotent operation

---

## Retry Strategy

- exponential backoff
- max attempts enforced

---

## Failure Flow

```
error occurs
→ capture error
→ log error
→ evaluate retry
→ retry OR fail
```

---

## Logging Requirements

All errors MUST log:

- component
- message
- input context
- timestamp

---

## User Feedback

System MUST:

- notify user of failures
- provide reason
- suggest next step if possible

---

## Critical Failures

If critical:

- stop pipeline
- trigger recovery system
- notify system/admin

---

## Recovery Integration

Error system must integrate with:

- retry system
- reconciliation engine
- self-healing system

---

## Forbidden Behavior

System MUST NOT:

- ignore errors
- retry infinitely
- execute partially failed tasks

---

## Final Rule

Errors must be visible, controlled, and recoverable.

If errors are hidden → system is unreliable.