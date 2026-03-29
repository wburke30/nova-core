# NOVA — Idempotency (Authoritative)

## Purpose

Ensures that repeated requests or retries:

→ DO NOT produce duplicate effects

Prevents:

- duplicate API calls
- duplicate emails/messages
- double execution
- data corruption

---

## Core Rule

The same input MUST always produce the same result.

---

## Idempotency Definition

Idempotent operation:

```
execute(input) = result

execute(input again) = same result (no side effects)
```

---

## Idempotency Key

Every executable action MUST include:

```json
{
  "idempotency_key": "string"
}
```

---

## Key Generation

Idempotency keys SHOULD be based on:

- task_id
- action type
- input parameters

---

## Example

```json
{
  "idempotency_key": "send_email:user123:invoice456"
}
```

---

## Storage

System MUST store:

```json
{
  "idempotency_key": "",
  "result": {},
  "status": "",
  "timestamp": ""
}
```

---

## Execution Flow

```
receive request
→ check idempotency_key
→ if exists:
     return stored result
→ else:
     execute
     store result
```

---

## Scope

Idempotency MUST apply to:

- pipeline execution
- tool execution
- connector calls
- API requests

---

## Retry Behavior

When retrying:

- system MUST reuse idempotency key
- must not re-execute action

---

## Connector Integration

External calls MUST:

- include idempotency headers where supported
- simulate idempotency if not supported

---

## Failure Handling

If execution fails:

- store failure result
- retry using same idempotency key

---

## Expiration

Idempotency records MAY:

- expire after configurable period
- must persist long enough to prevent duplicates

---

## Conflict Handling

If duplicate key with different input:

→ reject request

---

## Logging

Idempotency events MUST log:

```json
{
  "event": "idempotency_check",
  "key": "",
  "result": "hit|miss",
  "timestamp": ""
}
```

---

## Forbidden Behavior

System MUST NOT:

- execute same action twice
- generate new keys on retry
- ignore idempotency

---

## Final Rule

Idempotency guarantees safe execution.

Without it → system becomes unreliable.