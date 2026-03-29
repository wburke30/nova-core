# NOVA — Role System (Authoritative)

## Purpose

Defines how NOVA dynamically assumes ANY role across ANY industry.

Enables:

- flexible system behavior
- scalable automation
- role-based configuration

---

## Core Rule

Roles define behavior — NOT access control.

Permissions define access control.

Roles MUST NOT grant permissions.

---

## Role Definition

A role is:

```
Role =
  Capabilities
+ Workflows
+ Connectors
+ Rules
+ Project Context
```

---

## Role Structure

```json
{
  "role_id": "uuid",
  "name": "string",
  "description": "string",
  "capabilities": [],
  "workflows": [],
  "connectors": [],
  "rules": [],
  "project_context": {},
  "version": "string"
}
```

---

## Role Components

---

### 1. Capabilities (WHAT)

Defines actions:

- SendEmail
- UpdateInventory
- ProcessOrder
- CreatePost

---

### 2. Workflows (HOW)

Defines execution logic:

- order → inventory → notify
- message → respond → log

---

### 3. Connectors (WHERE)

Defines systems used:

- Gmail
- Shopify
- Amazon
- Slack

---

### 4. Rules (WHEN / WHY)

Defines triggers:

- if inventory < threshold → notify
- if order created → process

---

### 5. Project Context (SCOPE)

Defines:

- data
- storage
- integrations

---

## ROLE ≠ PERMISSIONS (CRITICAL)

Roles MUST NOT:

- grant access rights
- override permission system

Permissions MUST be handled by:

→ `21_PERMISSIONS_MODEL.md`

---

## Role Assignment

Roles MUST be assignable:

- per user
- per project

---

## Multi-Role Support

System MUST support:

- multiple roles per user
- role composition

---

## Role Composition Example

```
Ecommerce Manager + Marketing Manager
```

---

## Role Execution Flow

```
User Input
→ Role Context
→ Capability Selection
→ Workflow Execution
→ Pipeline
```

---

## Role Activation

Role becomes active when:

- assigned to user/project
- validated
- integrated with system

---

## Role Evolution

System MAY:

- suggest improvements
- recommend workflows

BUT:

- must require user approval

---

## UI Requirements

UI MUST display:

- what NOVA does for user

UI MUST NOT display:

- internal system complexity

---

## Validation Rules

Roles MUST:

- reference valid capabilities
- use valid connectors
- pass policy validation

---

## Logging

All role activity MUST log:

```json
{
  "event": "role_execution",
  "role_id": "",
  "action": "",
  "timestamp": ""
}
```

---

## Security Rules

Roles MUST:

- respect permission system
- respect policy engine
- not bypass approvals

---

## Forbidden Behavior

System MUST NOT:

- hardcode roles
- link roles directly to permissions
- bypass pipeline

---

## Final Rule

Roles define system behavior.

Permissions define system control.

Mixing them breaks the system.