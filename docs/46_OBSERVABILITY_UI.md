# NOVA — Observability UI (Authoritative)

## Purpose

Defines how NOVA exposes system activity to users.

Ensures:

- transparency
- trust
- debuggability
- real-time visibility

---

## Core Rule

Users MUST be able to see what NOVA is doing in real time.

No hidden execution.

---

## Observability Components

---

### 1. Pipeline Timeline

Displays:

- pipeline stages
- execution flow
- status per stage

---

### 2. Task Viewer

Displays:

- task status
- step breakdown
- results
- errors

---

### 3. Logs Viewer

Displays:

- system logs
- connector logs
- audit logs

---

### 4. Node Status Panel

Displays:

- active nodes
- load (CPU/memory)
- status (online/offline)

---

### 5. Integration Status Panel

Displays:

- connector health
- last activity
- failure state

---

### 6. Cost & Usage Dashboard

Displays:

- API usage
- LLM usage
- budget tracking

---

## UI Requirements

---

### Real-Time Updates (MANDATORY)

System MUST:

- use WebSockets
- update instantly
- not rely on polling

---

### Data Accuracy

UI MUST reflect:

- actual system state
- not cached or guessed data

---

### User Clarity

UI MUST:

- be readable
- avoid technical jargon
- present clear status

---

## Data Structure

UI consumes:

```json
{
  "pipeline_runs": [],
  "tasks": [],
  "logs": [],
  "nodes": [],
  "integrations": [],
  "usage": {}
}
```

---

## Interaction

User MUST be able to:

- view task details
- view logs
- approve/reject actions
- monitor system state

---

## Filtering

UI MUST support:

- filtering by project
- filtering by task
- filtering by status

---

## Error Visibility

Errors MUST:

- be visible
- include explanation
- include timestamp

---

## Performance Requirements

UI MUST:

- load quickly
- update smoothly
- handle large data sets

---

## Security Rules

UI MUST:

- respect permissions
- hide restricted data
- prevent unauthorized access

---

## Forbidden Behavior

UI MUST NOT:

- hide system activity
- show stale data
- misrepresent execution state

---

## Final Rule

Observability builds trust.

If users cannot see system behavior → system is not trustworthy.