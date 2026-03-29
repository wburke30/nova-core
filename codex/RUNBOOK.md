# NOVA — EXECUTION RUNBOOK (Authoritative)

## Purpose

Defines the exact build sequence for NOVA.

Ensures:

- correct order of execution
- no dependency issues
- no ambiguity
- full system completion

---

## CORE RULE

Steps MUST be executed in EXACT order.

NO skipping  
NO reordering  
NO assumptions  

---

## GLOBAL ENVIRONMENT RULE (MANDATORY)

Before EACH step:

You MUST:

- verify required dependencies exist
- install missing dependencies
- verify services are running

You MUST NOT assume anything exists.

---

# STEP ORDER (LOCKED)

---

### STEP 01 — BOOTSTRAP
File: `/codex/01_BOOTSTRAP.md`

---

### STEP 02 — DATABASE
File: `/codex/02_DATABASE.md`

---

### STEP 03 — BACKEND CORE
File: `/codex/03_BACKEND_CORE.md`

---

### STEP 04 — PIPELINE ENGINE
File: `/codex/04_PIPELINE_ENGINE.md`

---

### STEP 05 — POLICY RUNTIME
File: `/codex/05_POLICY_RUNTIME.md`

---

### STEP 06 — EXECUTION ENGINE
File: `/codex/06_EXECUTION_ENGINE.md`

---

### STEP 07 — QUEUE & WORKERS
File: `/codex/07_QUEUE_WORKERS.md`

---

### STEP 08 — EVENTS & WEBSOCKET
File: `/codex/08_EVENTS_WEBSOCKET.md`

---

### STEP 09 — API LAYER
File: `/codex/09_API_LAYER.md`

---

### STEP 10 — INTEGRATIONS
File: `/codex/10_INTEGRATIONS.md`

---

### STEP 11 — FRONTEND SHELL
File: `/codex/11_FRONTEND_SHELL.md`

---

### STEP 12 — FRONTEND REALTIME
File: `/codex/12_FRONTEND_REALTIME.md`

---

### STEP 13 — SECURITY & OBSERVABILITY
File: `/codex/13_SECURITY.md`

---

### STEP 14 — FINAL VALIDATION
File: `/codex/14_FINALIZE.md`

---

### STEP 15 — API & ROUTE VALIDATION
File: `/codex/15_API_ROUTE_VALIDATION.md`

---

### STEP 16 — DOCUMENTATION VALIDATION
File: `/codex/16_DOCS_VALIDATION.md`

---

# VALIDATION RULE (MANDATORY)

After EACH step:

You MUST verify:

- backend server runs
- database accessible
- endpoints respond correctly
- logs contain no errors

IF ANY FAILS:

→ STOP  
→ FIX  
→ RETRY  

---

# FAILURE HANDLING

If step fails:

```
identify issue
→ fix issue
→ retry same step
→ DO NOT proceed
```

---

# STATE MANAGEMENT

You MUST update:

`/codex/BUILD_STATUS.md`

Example:

```
01_BOOTSTRAP: complete
02_DATABASE: in_progress
```

---

# RESUME RULE

If interrupted:

```
read BUILD_STATUS.md
→ resume first incomplete step
```

---

# UI ENFORCEMENT

Frontend MUST:

- follow `/codex/UI_CONTRACT.md`
- follow `/codex/THEME_SYSTEM.md`
- be responsive
- not use polling

---

# ACCEPTANCE VALIDATION (CRITICAL)

Step 14 MUST validate against:

`/codex/ACCEPTANCE_MATRIX.md`

---

# COMPLETION RULE

System is complete ONLY IF:

- ALL steps (01–16) complete
- ALL validations pass
- NO errors remain

---

# FORBIDDEN BEHAVIOR

You MUST NOT:

- skip steps
- assume completion
- leave TODOs
- leave partial implementations

---

# FINAL RULE

This runbook defines execution.

If it is not followed → build is invalid.