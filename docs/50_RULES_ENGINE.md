# NOVA — Rules Engine (Authoritative)

## Purpose

Defines how NOVA executes business logic based on:

- conditions
- triggers
- events

Enables:

- automation
- decision-making
- reactive system behavior

---

## Core Rule

Rules define WHEN and WHY actions occur.

Rules MUST NOT execute actions directly.

---

## Rule Structure

```json
{
  "rule_id": "uuid",
  "name": "string",
  "trigger": "event_type",
  "conditions": [],
  "actions": [],
  "enabled": true,
  "created_at": "timestamp"
}
```

---

## Rule Components

---

### 1. Trigger

Defines when rule runs.

Examples:

- order.created
- inventory.updated
- message.received

---

### 2. Conditions

Defines logic required.

Examples:

```json
[
  {
    "field": "inventory.available",
    "operator": "<",
    "value": 5
  }
]
```

---

### 3. Actions

Defines what happens next.

Actions MUST:

- trigger capabilities
- not execute directly

---

## Rule Execution Flow

```
event occurs
→ rules evaluated
→ conditions checked
→ actions triggered
→ pipeline executes
```

---

## Rule Types

---

### 1. Event-Based Rules

Triggered by events.

---

### 2. Scheduled Rules

Triggered by time.

---

### 3. Conditional Rules

Triggered when condition becomes true.

---

## Example Rule

```json
{
  "name": "Low Inventory Alert",
  "trigger": "inventory.updated",
  "conditions": [
    {
      "field": "available",
      "operator": "<",
      "value": 5
    }
  ],
  "actions": [
    {
      "capability": "SendNotification"
    }
  ]
}
```

---

## Rule Evaluation

Rules MUST:

- be evaluated deterministically
- avoid race conditions
- support prioritization

---

## Priority Handling

Rules MAY define priority:

- high
- medium
- low

---

## Conflict Handling

If multiple rules conflict:

- evaluate priority
- OR require user resolution

---

## Rule Storage

Rules MUST be stored in database:

- scoped per project
- versioned

---

## Rule Versioning

Rules MUST:

- support updates
- maintain history
- allow rollback

---

## Logging

All rule executions MUST log:

```json
{
  "event": "rule_triggered",
  "rule_id": "",
  "status": "",
  "timestamp": ""
}
```

---

## Safety Rules

Rules MUST:

- respect policy engine
- respect permissions
- not bypass approval system

---

## Automation Integration

Rules MUST integrate with:

- automation settings
- approval system

---

## Failure Handling

If rule fails:

- log error
- retry if applicable
- prevent cascade failure

---

## Forbidden Behavior

System MUST NOT:

- execute actions directly from rules
- bypass pipeline
- create infinite loops

---

## Final Rule

Rules define behavior.

Pipeline enforces execution.