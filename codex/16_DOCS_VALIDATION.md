NOVA BUILD STEP 16 — DOCUMENTATION VALIDATION (MANDATORY)

--------------------------------
GOAL
--------------------------------

Verify implementation matches ALL documentation:

- docs 01–69
- architecture rules
- system invariants

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO spec deviation allowed
- NO missing features allowed
- NO shortcuts allowed

IF ANY FAIL:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — MATCH CORE RULES
--------------------------------

Verify:

- pipeline controls ALL execution
- no direct execution
- connectors enforced
- mapping enforced

---

--------------------------------
STEP 2 — MATCH DATA MODEL
--------------------------------

Verify:

- canonical model implemented
- schema matches exactly
- no missing fields

---

--------------------------------
STEP 3 — MATCH WORKFLOW ENGINE
--------------------------------

Verify:

- compensation enforced
- retry rules enforced
- no ambiguity

---

--------------------------------
STEP 4 — MATCH REAL-TIME SYSTEM
--------------------------------

Verify:

- event-driven
- websocket-only updates
- no polling

---

--------------------------------
STEP 5 — MATCH UI CONTRACT
--------------------------------

Verify:

- sidebar order correct
- chat default
- responsive
- theme works

---

--------------------------------
STEP 6 — MATCH SECURITY
--------------------------------

Verify:

- auth enforced
- permissions enforced
- secrets protected

---

--------------------------------
STEP 7 — MATCH CONNECTOR FRAMEWORK
--------------------------------

Verify:

- all integrations use connectors
- no direct API calls
- mapping enforced

---

--------------------------------
STEP 8 — MATCH ROLE SYSTEM
--------------------------------

Verify:

- roles separate from permissions
- role composition works

---

--------------------------------
STEP 9 — MATCH TENANCY MODEL
--------------------------------

Verify:

- single-tenant enforced
- project isolation works

---

--------------------------------
FINAL VALIDATION
--------------------------------

System MUST:

- match ALL specs
- contain ZERO drift
- pass ALL rules

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any rule not implemented
- any spec mismatch
- any shortcut detected

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- system matches docs 100%
- no ambiguity exists
- fully production ready

---

--------------------------------
STATE UPDATE
--------------------------------

16_DOCS_VALIDATION: complete

---

--------------------------------
FINAL OUTPUT
--------------------------------

System is verified.

STOP.