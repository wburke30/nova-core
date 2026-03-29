# NOVA — Acceptance Matrix (Authoritative)

## PURPOSE

Defines the REQUIRED conditions for NOVA to be considered complete.

This is the FINAL source of truth for:

- system validation
- completion criteria
- production readiness

---

## CORE RULE

NOVA is NOT complete until ALL conditions in this matrix PASS.

---

# ACCEPTANCE CRITERIA

---

## 1. BACKEND SYSTEM

MUST PASS:

- backend server starts successfully
- no runtime errors
- no uncaught exceptions
- logs contain no critical errors

---

## 2. DATABASE

MUST PASS:

- PostgreSQL connection works
- ALL tables exist (from 09_DATABASE_SCHEMA.md)
- migrations apply cleanly
- insert + query operations succeed

---

## 3. PIPELINE ENGINE

MUST PASS:

- pipeline runs end-to-end
- ALL stages execute in correct order
- no stage skipped
- pipeline logs recorded correctly

---

## 4. EXECUTION ENGINE

MUST PASS:

- tasks execute through tools ONLY
- execution is isolated
- timeout enforced
- cancellation works

---

## 5. POLICY & APPROVAL

MUST PASS:

- unsafe actions require approval
- approval blocks execution until resolved
- approval resumes pipeline correctly
- permission rules enforced

---

## 6. QUEUE & WORKERS

MUST PASS:

- jobs queued correctly
- workers process jobs
- idempotency enforced
- locking prevents duplicates

---

## 7. CONNECTOR SYSTEM

MUST PASS:

- connectors execute external calls
- NO direct API calls outside connectors
- mapping enforced
- retry + rate limits work

---

## 8. REAL-TIME SYSTEM

MUST PASS:

- WebSocket connects successfully
- ALL updates are push-based
- NO polling for live updates
- UI updates instantly

---

## 9. API LAYER

MUST PASS:

- ALL endpoints respond correctly
- correct response format used
- auth required on protected routes
- permissions enforced

---

## 10. FRONTEND UI

MUST PASS:

- UI matches `/codex/UI_CONTRACT.md`
- Chat is default view
- navigation order correct
- layout clean and modern

---

## 11. RESPONSIVENESS

MUST PASS:

- desktop layout correct
- tablet layout works
- mobile layout works
- no horizontal scrolling

---

## 12. THEME SYSTEM

MUST PASS:

- system / dark / light modes work
- switching is instant
- no layout breakage

---

## 13. STORAGE SYSTEM

MUST PASS:

- file read/write works
- correct storage location used
- project isolation enforced

---

## 14. NODE SYSTEM

MUST PASS:

- node registers successfully
- heartbeat updates correctly
- tasks routed to node

---

## 15. SECURITY

MUST PASS:

- invalid auth rejected
- permission violations blocked
- secrets NOT exposed
- inputs sanitized

---

## 16. OBSERVABILITY

MUST PASS:

- logs visible
- integration status visible
- node status visible
- no hidden activity

---

## 17. ROUTES & ENDPOINTS

MUST PASS:

- ALL API endpoints reachable
- ALL frontend routes load
- no 404 or 500 errors
- correct responses returned

---

## 18. ERROR HANDLING

MUST PASS:

- failures logged
- retries behave correctly
- no silent failures

---

## 19. WORKFLOW ENGINE

MUST PASS:

- workflows execute deterministically
- compensation works
- branching works
- retries controlled

---

## 20. ROLE SYSTEM

MUST PASS:

- roles applied correctly
- roles do NOT override permissions
- multiple roles supported

---

## 21. DOCUMENTATION CONSISTENCY

MUST PASS:

- implementation matches `/docs/01–72`
- no missing features
- no drift from spec

---

## FINAL ACCEPTANCE RULE

System is COMPLETE ONLY IF:

- ALL categories PASS
- NO failures exist
- NO warnings remain

---

## FAIL CONDITION

If ANY item fails:

→ system is NOT complete  
→ must fix and re-validate  

---

## FINAL RULE

This matrix defines reality.

If NOVA does not pass this → it is NOT production ready.