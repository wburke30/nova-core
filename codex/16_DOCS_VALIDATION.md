# NOVA — Documentation Validation (Authoritative)

## Purpose

Verifies that the implementation matches ALL system specifications.

Ensures:

- no drift from architecture
- no missing features
- full compliance with design

---

## CORE RULE

Implementation MUST match ALL documents in `/docs/01–72`.

No deviation allowed.

---

## VALIDATION SCOPE

You MUST validate against:

```
/docs/01–72
```

NOT 01–69  
NOT partial sets  
NOT assumed subsets  

---

## VALIDATION TASKS

---

### 1. CORE ARCHITECTURE

Verify:

- pipeline controls ALL execution
- no direct execution exists
- tools only execute via pipeline
- connectors handle ALL external calls

---

### 2. DATA MODEL

Verify:

- canonical data model implemented exactly
- database schema matches spec
- no missing fields

---

### 3. WORKFLOW ENGINE

Verify:

- deterministic execution
- compensation enforced
- retry logic correct

---

### 4. REAL-TIME SYSTEM

Verify:

- event-driven architecture
- WebSocket updates ONLY
- NO polling for live updates

---

### 5. UI CONTRACT

Verify:

- UI matches `/codex/UI_CONTRACT.md`
- navigation order correct
- chat is default
- responsive behavior works

---

### 6. SECURITY

Verify:

- authentication enforced
- permissions enforced
- secrets protected
- inputs sanitized

---

### 7. CONNECTOR FRAMEWORK

Verify:

- ALL integrations use connectors
- no direct API calls
- mapping enforced

---

### 8. ROLE SYSTEM

Verify:

- roles separate from permissions
- role composition works
- permissions not overridden

---

### 9. TENANCY MODEL

Verify:

- single-tenant enforced
- project isolation works
- no cross-project data leakage

---

### 10. STORAGE SYSTEM

Verify:

- storage follows configuration
- correct provider used
- no uncontrolled file access

---

## VALIDATION METHOD

For each rule:

- compare implementation to spec
- confirm behavior matches exactly
- reject any mismatch

---

## VALIDATION OUTPUT

You MUST produce:

```json
{
  "validation": "docs",
  "status": "pass|fail",
  "errors": []
}
```

---

## FAILURE RULE

If ANY mismatch found:

→ FAIL  
→ list exact issue  
→ STOP execution  

---

## COMPLETION CRITERIA

Validation passes ONLY IF:

- ALL docs (01–72) match implementation
- NO mismatches exist
- NO ambiguity exists

---

## FORBIDDEN BEHAVIOR

You MUST NOT:

- skip documents
- assume compliance
- partially validate

---

## FINAL RULE

Documentation defines system truth.

If implementation does not match docs → system is invalid.