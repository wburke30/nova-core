# NOVA — Skill Model (Authoritative)

## Purpose

Defines reusable logic units that support capabilities.

Skills are the **bridge between reasoning and execution**.

---

## Core Rule

Skills MUST NOT execute actions.

Skills:
- define logic
- prepare data
- support capabilities

Execution is handled by:
→ pipeline + tools

---

## Skill Structure

```json
{
  "skill_id": "string",
  "name": "string",
  "capability": "string",
  "inputs_schema": {},
  "outputs_schema": {},
  "logic": {},
  "version": "string"
}
```

---

## Field Definitions

### skill_id
- unique identifier
- versioned

---

### capability
- MUST reference a valid capability
- cannot reference connectors or tools

---

### inputs_schema
- defines expected input format
- must be validated

---

### outputs_schema
- defines expected output
- must match capability requirements

---

### logic
- transformation logic
- formatting rules
- validation rules

---

## Example Skill

```json
{
  "skill_id": "email.format",
  "capability": "SendEmail",
  "inputs_schema": {
    "to": "string",
    "subject": "string",
    "body": "string"
  },
  "outputs_schema": {
    "formatted_email": "object"
  }
}
```

---

## Skill Responsibilities

Skills MAY:

- validate input data
- transform data
- prepare payloads
- structure outputs

---

## Skill Limitations

Skills MUST NOT:

- call APIs
- trigger connectors
- execute tools
- modify DB directly

---

## Skill Lifecycle

1. input received
2. validate schema
3. transform data
4. output structured result

---

## Skill Reusability

Skills MUST be:

- reusable across projects
- independent of connectors
- independent of workflows

---

## Skill Versioning

Each skill MUST include:

- version number
- backward compatibility support
- migration path if changed

---

## Pipeline Integration

Skills are used in:

```
Agent → Capability → Skill → Pipeline → Tool
```

---

## Validation Rules

Reject skill if:

- missing capability reference
- invalid schema
- includes execution logic
- references external systems

---

## Error Handling

If skill fails:

- return structured error
- pipeline handles retry or fallback

---

## Final Rule

Skills define HOW data is prepared, not HOW actions are executed.