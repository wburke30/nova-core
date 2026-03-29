NOVA BUILD STEP 16 — DOCUMENTATION VALIDATION (MANDATORY)

--------------------------------
GOAL
--------------------------------

Verify that the FULL system implementation matches ALL documentation.

This step ensures:

- zero architectural drift
- zero missing features
- full compliance with NOVA specifications

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT modify any files
- DO NOT rebuild anything
- DO NOT install dependencies
- VALIDATION ONLY

IF ANY FAILURE:
→ STOP
→ REPORT ISSUE
→ DO NOT CONTINUE

---

--------------------------------
ENVIRONMENT CHECK (MANDATORY)
--------------------------------

Before executing this step, you MUST:

1. Verify backend server is running
2. Verify frontend application is running
3. Verify database is accessible
4. Verify WebSocket connection is active

You MUST NOT assume system state is valid.

--------------------------------
REQUIRED CHECKS
--------------------------------

- Backend API responds successfully
- Frontend UI loads without error
- Database connection succeeds
- WebSocket connection is active

--------------------------------
FAIL RULE
--------------------------------

IF any system component is not running:

→ STOP
→ FIX system
→ VERIFY all components are operational
→ THEN proceed

DO NOT CONTINUE UNTIL VERIFIED

---

--------------------------------
VALIDATION SCOPE (MANDATORY)
--------------------------------

You MUST validate against:

```
/docs/01–72
```

NOT partial sets  
NOT assumed subsets  

---

--------------------------------
VALIDATION TASKS
--------------------------------

---

### 1. CORE ARCHITECTURE

Verify:

- pipeline controls ALL execution
- no direct execution exists
- tools execute ONLY via pipeline
- connectors handle ALL external calls

---

### 2. DATA MODEL

Verify:

- canonical data model implemented exactly
- database schema matches spec
- no missing or extra fields

---

### 3. PIPELINE ENGINE

Verify:

- all stages implemented
- stage order correct
- no stage skipped

---

### 4. WORKFLOW ENGINE

Verify:

- deterministic execution
- compensation enforced
- retry logic correct

---

### 5. REAL-TIME SYSTEM

Verify:

- event-driven architecture
- WebSocket updates ONLY
- NO polling for live updates

---

### 6. UI CONTRACT

Verify:

- UI matches `/codex/UI_CONTRACT.md`
- navigation order correct
- chat is default
- responsive behavior works

---

### 7. THEME SYSTEM

Verify:

- system/dark/light modes implemented
- switching is instant
- no layout breakage

---

### 8. SECURITY

Verify:

- authentication enforced
- permissions enforced
- secrets protected
- inputs sanitized

---

### 9. CONNECTOR FRAMEWORK

Verify:

- ALL integrations use connectors
- NO direct API calls
- mapping enforced

---

### 10. ROLE SYSTEM

Verify:

- roles separate from permissions
- role composition works
- permissions not overridden

---

### 11. TENANCY MODEL

Verify:

- single-tenant enforced
- project isolation works
- no cross-project data leakage

---

### 12. STORAGE SYSTEM

Verify:

- storage follows configuration
- correct provider used
- no uncontrolled file access

---

### 13. QUEUE & WORKERS

Verify:

- async execution used
- no direct execution bypass
- idempotency enforced

---

### 14. NODE SYSTEM

Verify:

- node registration works
- heartbeat updates correctly
- tasks routed correctly

---

--------------------------------
VALIDATION METHOD
--------------------------------

For EACH rule:

- compare implementation to documentation
- confirm behavior matches EXACTLY
- reject any mismatch

---

--------------------------------
VALIDATION OUTPUT (MANDATORY)
--------------------------------

You MUST produce:

```json
{
  "validation": "docs",
  "status": "pass|fail",
  "errors": []
}
```

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- ANY mismatch exists
- ANY feature missing
- ANY rule violated
- ANY ambiguity detected

IF FAIL:

→ LIST exact issue
→ STOP execution

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- ALL docs (01–72) match implementation
- ZERO mismatches exist
- ZERO ambiguity remains

---

--------------------------------
STATE UPDATE
--------------------------------

16_DOCS_VALIDATION: complete

---

--------------------------------
FINAL RULE
--------------------------------

Documentation defines system truth.

If implementation does not match documentation → system is INVALID.

STOP when validation completes successfully.