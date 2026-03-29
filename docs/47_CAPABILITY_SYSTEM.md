# NOVA — Capability System (Authoritative)

## Purpose

Defines how NOVA abstracts actions into reusable, system-wide capabilities.

Enables:

- role flexibility
- integration independence
- scalable automation
- cross-industry support

---

## Core Rule

Capabilities define WHAT is done.

They MUST NOT define:

- how it is executed
- which system performs it

---

## Capability Definition

A capability is a high-level action such as:

- SendEmail
- UpdateInventory
- ProcessOrder
- CreatePost
- SyncProduct

---

## Capability Structure

```json
{
  "capability_id": "string",
  "name": "string",
  "inputs_schema": {},
  "outputs_schema": {},
  "allowed_connectors": [],
  "version": "string"
}
```

---

## Capability Components

---

### 1. Inputs

Defines required data.

Example:

```json
{
  "to": "string",
  "subject": "string",
  "body": "string"
}
```

---

### 2. Outputs

Defines expected result.

Example:

```json
{
  "status": "sent",
  "message_id": ""
}
```

---

### 3. Allowed Connectors

Defines which connectors can fulfill capability.

Example:

- SendEmail → SendGrid, SMTP
- UpdateInventory → Shopify, POS

---

## Capability Execution Flow

```
User Intent
→ Capability
→ Skill
→ Pipeline
→ Tool
→ Connector
```

---

## Capability Requirements

Capabilities MUST:

- be system-agnostic
- not reference APIs directly
- not reference connector IDs directly
- be reusable across domains

---

## Capability Categories

---

### Communication

- SendEmail
- SendMessage
- NotifyUser

---

### Commerce

- UpdateInventory
- ProcessOrder
- SyncPricing

---

### Content

- CreatePost
- GenerateContent

---

### System

- ExecuteTask
- ScheduleTask

---

## Capability Resolution

Capability MUST be determined during:

```
pipeline → capability_resolution stage
```

---

## Validation Rules

Capability MUST:

- match input schema
- be supported by connectors
- pass policy validation

---

## Capability Registry

System MUST maintain:

- list of all capabilities
- version tracking
- mapping to skills

---

## Versioning

Capabilities MUST:

- support versioning
- maintain backward compatibility

---

## Error Handling

If capability fails:

- return structured error
- trigger retry if applicable

---

## Security Rules

Capabilities MUST:

- respect permissions
- respect policy engine
- not bypass approval

---

## Forbidden Behavior

System MUST NOT:

- hardcode integrations inside capability
- skip capability layer
- allow direct tool invocation

---

## Final Rule

Capabilities define system behavior.

If capability layer is bypassed → system becomes tightly coupled and unscalable.