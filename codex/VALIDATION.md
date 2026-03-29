# NOVA — Validation System (Authoritative)

## Purpose

Defines how NOVA verifies correctness at every stage of the build.

Ensures:

- no broken steps
- no partial implementation
- no hidden errors
- full system correctness

---

## CORE RULE

A step is NOT complete until validation passes.

---

## VALIDATION LEVELS

Validation MUST occur at:

---

### 1. STEP-LEVEL VALIDATION

After EACH step.

---

### 2. SYSTEM-LEVEL VALIDATION

After ALL steps complete.

---

## STEP-LEVEL VALIDATION (MANDATORY)

After EACH step, you MUST verify:

---

### Backend

- server starts successfully
- no runtime errors

---

### Database

- connection works
- schema accessible
- queries succeed

---

### API

- endpoints respond
- correct HTTP status codes
- response format correct

---

### Execution

- no uncaught exceptions
- no broken logic

---

### Logs

- no critical errors
- no unhandled failures

---

## FAILURE RULE

If ANY validation fails:

```
STOP
→ FIX
→ RETRY SAME STEP
```

---

## SYSTEM-LEVEL VALIDATION (FINAL)

After Step 16:

---

### 1. Pipeline Test

```
send message
→ pipeline executes
→ stages run correctly
→ result returned
```

---

### 2. Connector Test

- connector executes
- mapping works
- external call succeeds

---

### 3. Queue & Worker Test

- job created
- worker processes job
- result returned

---

### 4. Real-Time Test

- WebSocket connects
- events emitted
- UI updates instantly
- NO polling used

---

### 5. Approval System Test

- approval required
- approval created
- approval resolves
- pipeline resumes

---

### 6. Permission Test

- unauthorized blocked
- role enforcement works
- precedence rules enforced

---

### 7. Role System Test

- roles applied correctly
- workflows triggered correctly

---

### 8. Storage Test

- file read/write works
- correct storage location used

---

### 9. Node System Test

- node registers
- heartbeat updates
- tasks routed correctly

---

### 10. Error Handling Test

- simulate failure
- retry works
- logging works

---

### 11. Security Test

- invalid auth rejected
- permissions enforced
- secrets protected

---

### 12. Observability Test

- logs visible
- integration status visible
- node status visible

---

### 13. UI Validation

UI MUST:

- match `/codex/UI_CONTRACT.md`
- correct navigation order
- responsive (desktop/tablet/mobile)
- theme switching works

---

### 14. Route Validation

ALL endpoints:

- reachable
- correct response
- no 500 errors

---

### 15. Acceptance Matrix

MUST pass:

```
/codex/ACCEPTANCE_MATRIX.md
```

---

### 16. Documentation Validation

System MUST match:

```
/docs/01–72
```

NO deviations allowed.

---

## VALIDATION OUTPUT

Each validation MUST produce:

```json
{
  "step": "",
  "status": "pass|fail",
  "errors": []
}
```

---

## FINAL PASS CRITERIA

System is COMPLETE ONLY IF:

- ALL steps (01–16) complete
- ALL validations pass
- NO errors remain
- NO spec drift exists

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- skip validation
- ignore errors
- assume functionality
- mark complete prematurely

---

## FINAL RULE

Validation defines completion.

If validation fails → system is NOT done.