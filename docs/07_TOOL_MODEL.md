# NOVA — Tool Model (Authoritative)

## Purpose

Defines the execution layer of NOVA.

Tools are the ONLY components allowed to perform actions.

---

## Core Rule

ONLY the pipeline can invoke tools.

No other component may execute tools.

---

## Execution Chain

```
Agent → Capability → Skill → Pipeline → Tool → Connector → External System
```

---

## Tool Categories

### 1. System Tools
- filesystem operations
- system status
- hardware interaction

---

### 2. Execution Tools
- shell execution
- python execution
- container execution

---

### 3. Connector Tools
- API calls
- third-party integrations
- messaging systems

---

### 4. Data Tools
- database queries
- storage operations
- file management

---

## Tool Structure

```json
{
  "tool_id": "string",
  "type": "shell|python|api|filesystem|connector",
  "inputs_schema": {},
  "outputs_schema": {},
  "permissions_required": [],
  "timeout": 0,
  "reversible": true
}
```

---

## Field Definitions

### tool_id
- unique identifier
- versioned

---

### type
Defines execution environment:

| Type | Description |
|------|------------|
| shell | CLI commands |
| python | script execution |
| api | HTTP requests |
| filesystem | file operations |
| connector | external system |

---

### permissions_required
Defines required permissions:

- read
- write
- execute
- external_access

---

### timeout
- maximum execution time
- enforced strictly

---

### reversible
- indicates rollback capability

---

## Execution Requirements

Tools MUST:

- be invoked ONLY via pipeline
- validate inputs
- enforce permissions
- respect timeouts
- log all actions

---

## Isolation Requirements

Tools MUST execute in:

- isolated container OR
- sandboxed environment

---

## Logging

Each execution MUST log:

```json
{
  "tool_id": "",
  "inputs": {},
  "outputs": {},
  "status": "",
  "timestamp": ""
}
```

---

## Error Handling

If tool fails:

- return structured error
- pipeline handles retry
- must not partially execute

---

## Forbidden Behavior

Tools MUST NOT:

- bypass pipeline
- access unauthorized data
- expose secrets
- execute without validation

---

## Safety Rules

High-risk tools MUST:

- require approval
- include rollback mechanism
- log detailed execution trace

---

## Examples

### Example: Email Send Tool

```json
{
  "tool_id": "email.send",
  "type": "connector",
  "permissions_required": ["external_access"],
  "timeout": 30
}
```

---

### Example: File Write Tool

```json
{
  "tool_id": "file.write",
  "type": "filesystem",
  "permissions_required": ["write"],
  "reversible": false
}
```

---

## Final Rule

Tools execute actions.

If anything else executes → system design is broken.