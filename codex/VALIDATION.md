# NOVA — Validation System (Authoritative)

## Purpose

Defines how NOVA verifies correctness at every stage of the build.

Ensures:

- no broken steps
- no partial implementation
- no hidden errors
- fully working system

---

## CORE RULE

A step is NOT complete until validation passes.

---

## VALIDATION LEVELS

Validation MUST occur at:

---

### 1. Step-Level Validation

After each build step.

---

### 2. System-Level Validation

After full build completion.

---

## STEP-LEVEL VALIDATION (MANDATORY)

After EACH step, you MUST verify:

---

### Server

- backend server runs
- no startup errors

---

### Database

- DB connection works
- schema exists
- queries succeed

---

### Execution

- no runtime exceptions
- no unhandled errors

---

### API

- endpoints respond
- correct status codes
- correct response format

---

### Logs

- no critical errors
- no uncaught exceptions

---

## VALIDATION FAILURE RULE

If ANY validation fails:

```
→ STOP
→ FIX ISSUE
→ RETRY SAME STEP
→ RE-VALIDATE
```

---

## SYSTEM-LEVEL VALIDATION (FINAL STEP)

After ALL steps complete:

---

### 1. Pipeline Test

```
send message
→ pipeline runs
→ execution completes
→ result returned
```

---

### 2. Connector Test

- at least one connector works
- external call succeeds

---

### 3. Node System Test

- node registers
- heartbeat updates
- task routed successfully

---

### 4. UI Test

- loads correctly
- sidebar navigation correct
- chat is default view
- no layout issues

---

### 5. Real-Time Test

- websocket connects
- live updates working
- no polling fallback

---

### 6. Role System Test

- roles applied correctly
- workflows triggered correctly

---

### 7. Storage Test

- file read/write works
- storage respects project config

---

## ACCEPTANCE MATRIX (MANDATORY)

System MUST pass:

```
ACCEPTANCE_MATRIX.md
```

If ANY test fails:

→ system is NOT complete

---

## VALIDATION OUTPUT

Validation MUST produce:

```json
{
  "step": "",
  "status": "pass|fail",
  "errors": []
}
```

---

## FINAL PASS CRITERIA

System is considered complete ONLY if:

- all steps = complete
- all validations = pass
- no errors remain

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- skip validation
- mark step complete without testing
- ignore errors
- assume functionality

---

## FINAL RULE

Validation defines completion.

If validation fails → system is NOT done.