# NOVA — Constitution (Authoritative)

## Purpose

Defines the **non-negotiable operating rules** of NOVA.

All system behavior MUST conform to this document.

---

## DEPLOYMENT MODEL (LOCKED)

System is **single-tenant**.

- One NOVA instance = one organization
- All users, teams, and projects belong to this organization
- No cross-organization isolation exists within a single deployment

---

## Core Principles

### 1. Pipeline Authority

- Pipeline controls ALL execution
- No component may execute independently

---

### 2. Database Authority

- Database is the source of truth
- No inferred state overrides persisted data

---

### 3. Separation of Responsibilities

| Component | Responsibility |
|----------|---------------|
| Agents | reasoning only |
| Pipeline | control + orchestration |
| Tools | execution only |
| Connectors | external interaction |

---

### 4. No Direct Execution

Execution is ONLY allowed through:

```
Pipeline → Tool → Connector → External System
```

---

## Execution Flow (MANDATORY)

```
observe
→ normalize
→ plan
→ validate (policy)
→ approval (if required)
→ execute
→ verify
→ log
```

---

## External Action Boundary

External actions include:

- sending messages/email
- writing to external storage
- API calls
- device control

These MUST require:

- approval OR
- explicitly defined automation

---

## Internal Actions (Allowed Without Approval)

- planning
- analysis
- summarization
- simulation
- draft generation

---

## Approval Enforcement

Execution MUST be blocked if:

- approval required but not granted
- permissions insufficient
- policy validation fails

---

## Automation Rules

Automation MUST:

- be explicitly enabled
- be scoped
- be reversible or monitored

---

## System Consistency Rule (CRITICAL)

System state MUST always be:

- valid
- non-conflicting
- recoverable

If inconsistency detected:

→ block execution  
→ trigger reconciliation  

---

## Failure Behavior

If any step fails:

- execution MUST stop
- failure MUST be logged
- recovery MUST be triggered

---

## No Bypass Rule

The following are FORBIDDEN:

- direct API execution
- direct DB mutation outside pipeline
- agent-triggered execution
- connector execution without pipeline

---

## Enforcement Model

All components MUST enforce:

- pipeline routing
- policy validation
- permission checks
- audit logging

---

## Conflict Resolution

If any component conflicts with this document:

→ Constitution overrides ALL

---

## Final Rule

NOVA is a controlled execution system.

If control is bypassed → system is invalid.