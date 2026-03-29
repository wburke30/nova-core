# NOVA — Workflow Engine (Authoritative)

## Purpose

Defines how NOVA executes multi-step processes with:

- deterministic behavior
- safe failure handling
- rollback capability
- zero ambiguity

---

## CORE RULE

Workflows define execution logic.

Pipeline executes workflows.

---

## WORKFLOW STRUCTURE

```json
{
  "workflow_id": "uuid",
  "name": "string",
  "trigger": "event_type",
  "steps": [],
  "status": "active|inactive",
  "version": "string"
}
```

---

# STEP STRUCTURE (MANDATORY)

```json
{
  "step_id": "string",
  "capability": "string",
  "inputs": {},
  "timeout": 30,
  "retry_policy": {
    "max_attempts": 3,
    "backoff": "exponential"
  },
  "on_failure": "retry|abort|compensate",
  "compensation": {
    "capability": "",
    "inputs": {}
  },
  "requires_approval": false,
  "next_step": "string|null",
  "conditions": [],
  "parallel_group": "string|null"
}
```

---

## MANDATORY RULES

Each step MUST define:

- timeout
- retry policy
- failure behavior

If missing → workflow is INVALID

---

## EXECUTION FLOW

```
event triggered
→ workflow loaded
→ execute step
→ evaluate result
→ determine next step
→ continue
```

---

## FAILURE HANDLING

---

### retry

- retry step
- must respect idempotency
- use exponential backoff

---

### abort

- stop workflow immediately
- mark as failed

---

### compensate (MANDATORY FOR EXTERNAL ACTIONS)

If step affects external system:

→ compensation MUST be defined

---

## COMPENSATION RULE

If step modifies external state:

```
step MUST include compensation
```

If missing:
→ workflow is invalid

---

## COMPENSATION FLOW

```
step 1 executes
step 2 fails
→ compensation for step 1 executes
```

---

## BRANCHING

```json
{
  "condition": "inventory.available < 5",
  "true_step": "notify",
  "false_step": "continue"
}
```

---

## PARALLEL EXECUTION

```json
"parallel_group": "group_1"
```

Rules:

- steps in same group run in parallel
- all must complete before next stage
- failure affects entire group

---

## STATE TRACKING

```json
{
  "workflow_id": "",
  "current_step": "",
  "status": "running|completed|failed",
  "attempts": 0,
  "updated_at": ""
}
```

---

## PERSISTENCE

Workflow MUST:

- persist state in DB
- resume after restart
- maintain consistency

---

## APPROVAL INTEGRATION

If step requires approval:

```
requires_approval = true
```

→ pipeline pauses until approved

---

## TIMEOUT RULES

Each step MUST:

- enforce timeout
- terminate on exceed

---

## IDEMPOTENCY

All steps MUST:

- be idempotent
- not duplicate side effects

---

## VALIDATION RULES

Workflow MUST be rejected if:

- missing timeout
- missing retry policy
- missing compensation (when required)
- invalid capability

---

## LOGGING

```json
{
  "event": "workflow_step",
  "workflow_id": "",
  "step_id": "",
  "status": "",
  "timestamp": ""
}
```

---

## SECURITY RULES

Workflows MUST:

- respect permissions
- respect policy engine
- not bypass approvals

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- skip steps
- execute out of order
- retry infinitely
- ignore failures

---

## FINAL RULE

Workflows must be deterministic, safe, and reversible.

If not → system becomes unreliable.