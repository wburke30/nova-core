# NOVA — Client Profile System (Authoritative)

## Purpose

Defines how NOVA understands and adapts to each client.

Enables:

- personalization
- adaptive behavior
- intelligent recommendations
- industry-specific optimization

---

## CORE RULE

NOVA MUST maintain a structured client profile for every project.

---

## CLIENT PROFILE STRUCTURE

```json
{
  "client_id": "uuid",
  "project_id": "uuid",
  "industry": "string",
  "goals": [],
  "active_roles": [],
  "integrations": [],
  "preferences": {},
  "created_at": "timestamp"
}
```

---

## PROFILE COMPONENTS

---

### Industry

Defines business type:

- ecommerce
- SaaS
- manufacturing
- marketing

---

### Goals

Examples:

- increase sales
- automate support
- improve efficiency

---

### Active Roles

Defines system behavior:

- Ecommerce Manager
- Marketing Manager

---

### Integrations

Defines connected systems.

---

### Preferences

Defines:

- communication style
- automation level
- reporting preferences

---

## PROFILE USAGE

Profile MUST influence:

- capability selection
- workflow suggestions
- automation decisions

---

## ADAPTATION RULES

System MAY:

- suggest optimizations
- recommend workflows
- adapt behavior

BUT:

- must require approval

---

## PROFILE EVOLUTION

Profile MUST:

- update over time
- learn from usage
- remain consistent

---

## VALIDATION

Profile MUST:

- be structured
- be complete
- be consistent

---

## SECURITY

Profile MUST:

- respect permissions
- protect sensitive data
- be scoped per project

---

## LOGGING

All profile changes MUST log:

```json
{
  "event": "client_profile_update",
  "client_id": "",
  "timestamp": ""
}
```

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- assume client intent without profile
- override explicit user settings
- auto-change behavior without approval

---

## FINAL RULE

Client profile drives system intelligence.

Without it → NOVA cannot adapt.