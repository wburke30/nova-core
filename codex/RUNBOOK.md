# NOVA — EXECUTION RUNBOOK (Authoritative)

## Purpose

Defines the exact build sequence for NOVA.

Ensures:

- correct order of implementation
- no dependency issues
- deterministic build process
- zero ambiguity for Codex

---

## CORE RULE

Steps MUST be executed in EXACT order.

No skipping  
No reordering  
No parallel execution (unless explicitly defined)

---

## STEP ORDER (LOCKED)

---

### STEP 01 — BOOTSTRAP

File:
```
01_BOOTSTRAP.md
```

Requirements:

- create project structure
- setup backend (FastAPI)
- setup frontend (Next.js)
- setup PostgreSQL
- verify server starts

---

### STEP 02 — DATABASE

File:
```
02_DATABASE.md
```

Requirements:

- implement ALL tables from `09_DATABASE_SCHEMA.md`
- run migrations
- verify schema integrity

---

### STEP 03 — BACKEND CORE

File:
```
03_BACKEND_CORE.md
```

Requirements:

- authentication system
- user + project context
- config system integration

---

### STEP 04 — PIPELINE ENGINE

File:
```
04_PIPELINE_ENGINE.md
```

Requirements:

- implement ALL pipeline stages (03 + 10 docs)
- verify pipeline run works

---

### STEP 05 — POLICY + APPROVAL

File:
```
05_POLICY_RUNTIME.md
```

Requirements:

- implement policy engine
- approval system
- automation rules

---

### STEP 06 — EXECUTION ENGINE

File:
```
06_EXECUTION_ENGINE.md
```

Requirements:

- tool execution system
- execution isolation
- timeout + cancellation

---

### STEP 07 — QUEUE + WORKERS

File:
```
07_QUEUE_WORKERS.md
```

Requirements:

- job queue system
- worker execution
- idempotency
- distributed locking

---

### STEP 08 — EVENTS + WEBSOCKET

File:
```
08_EVENTS_WEBSOCKET.md
```

Requirements:

- event system
- websocket server
- real-time updates

---

### STEP 09 — API LAYER

File:
```
09_API_LAYER.md
```

Requirements:

- implement ALL endpoints from API spec
- enforce auth + permissions
- validate responses

---

### STEP 10 — INTEGRATIONS

File:
```
10_INTEGRATIONS.md
```

Requirements:

- connector framework
- generic API connector
- test at least one integration

---

### STEP 11 — FRONTEND SHELL

File:
```
11_FRONTEND_SHELL.md
```

Requirements:

- layout implementation
- sidebar + navigation
- MUST follow UI_CONTRACT.md

---

### STEP 12 — FRONTEND REALTIME

File:
```
12_FRONTEND_REALTIME.md
```

Requirements:

- websocket integration
- live updates
- task visibility

---

### STEP 13 — SECURITY + OBSERVABILITY

File:
```
13_SECURITY.md
```

Requirements:

- audit logging
- integration status
- system monitoring

---

### STEP 14 — FINAL VALIDATION

File:
```
14_FINALIZE.md
```

Requirements:

- full system test
- validate against ACCEPTANCE_MATRIX.md
- verify all features working

---

## VALIDATION REQUIREMENTS (MANDATORY)

After EVERY step:

You MUST verify:

- server is running
- database accessible
- no runtime errors
- endpoints respond correctly
- logs are clean

---

## FAILURE HANDLING

If step fails:

```
→ identify issue
→ fix
→ retry same step
→ DO NOT proceed until resolved
```

---

## STATE MANAGEMENT

You MUST update:

```
BUILD_STATUS.md
```

Example:

```
01_BOOTSTRAP: complete
02_DATABASE: complete
03_BACKEND_CORE: pending
```

---

## RESUME RULE

If interrupted:

```
→ read BUILD_STATUS.md
→ resume from first incomplete step
```

---

## UI ENFORCEMENT

Frontend MUST:

- follow UI_CONTRACT.md exactly
- implement THEME_SYSTEM.md
- be responsive (desktop/tablet/mobile)

---

## FINAL SYSTEM VALIDATION

System MUST confirm:

- pipeline execution works end-to-end
- connectors function correctly
- node system operational
- UI fully functional
- real-time updates working
- roles execute correctly

---

## FORBIDDEN BEHAVIOR

You MUST NOT:

- skip steps
- assume success
- leave incomplete code
- leave TODOs
- break architecture rules

---

## FINAL RULE

This runbook defines the build process.

If runbook is not followed → system build is invalid.