# NOVA — Permissions Model (Authoritative)

## Purpose

Defines how NOVA enforces access control across:

- users
- teams
- projects
- system actions

Ensures:

- secure execution
- predictable behavior
- no unauthorized actions

---

## Core Rule

NO action may execute without permission validation.

Permissions MUST be enforced at:

- API layer
- pipeline
- tool execution
- connector execution

---

## Permission Scope Levels

Permissions exist at:

### 1. System-Level
- default rules
- baseline restrictions

---

### 2. Team-Level
- shared access
- inherited permissions

---

### 3. Project-Level (PRIMARY CONTROL)
- defines execution scope
- overrides team defaults

---

### 4. User-Level (HIGHEST SPECIFICITY)
- explicit permissions
- direct overrides

---

## Role-Based Access

### Viewer
- read-only
- no execution

---

### Operator
- execute tasks
- limited external actions

---

### Admin
- full control
- manage users/teams
- override restrictions (logged)

---

## Permission Structure

```json
{
  "user_id": "uuid",
  "project_id": "uuid",
  "role": "viewer|operator|admin",
  "permissions": [
    "read",
    "execute",
    "external_access",
    "config_modify"
  ]
}
```

---

## PERMISSION PRECEDENCE (MANDATORY)

This rule is NON-NEGOTIABLE:

```
1. DENY overrides ALLOW
2. Explicit user permission overrides inherited
3. Project-level overrides team-level
4. Team-level overrides system default
5. Admin override allowed BUT MUST log
```

---

## Conflict Handling

If conflict cannot be resolved:

→ BLOCK execution

---

## Enforcement Points

Permissions MUST be checked at:

### 1. API Layer
- request validation
- access control

---

### 2. Pipeline
- before execution
- before connector calls

---

### 3. Tools
- before execution

---

### 4. Connectors
- before external calls

---

## Denial Behavior

If permission fails:

- stop execution immediately
- log event
- return structured error

---

## Escalation Rules

Only Admin MAY:

- modify permissions
- assign roles
- override restrictions

---

## Audit Logging

All permission checks MUST log:

```json
{
  "event": "permission_check",
  "user_id": "",
  "action": "",
  "result": "allowed|denied",
  "timestamp": ""
}
```

---

## Security Rules

Permissions MUST:

- never be bypassed
- always be validated before execution
- be enforced consistently

---

## Forbidden Behavior

System MUST NOT:

- assume permissions
- inherit permissions incorrectly
- execute without validation

---

## Final Rule

Permissions define execution boundaries.

If permissions fail → execution MUST NOT occur.