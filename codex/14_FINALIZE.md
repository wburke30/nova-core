NOVA BUILD STEP 14 — FINAL VALIDATION & COMPLETION (MANDATORY)

--------------------------------
ENVIRONMENT CHECK (MANDATORY)
--------------------------------

Before executing this step, you MUST:

1. Verify required dependencies exist
2. Install missing dependencies if needed
3. Verify required services are running
4. Start services if not running

You MUST NOT assume any dependency exists.

--------------------------------
REQUIRED CHECKS
--------------------------------

- Python installed and working
- Node.js installed and working
- PostgreSQL installed OR container running
- Backend server (if required for step)
- Frontend dev server (if required for step)

--------------------------------
FAIL RULE
--------------------------------

IF ANY dependency is missing or service is not running:

→ INSTALL or START it  
→ VERIFY it works  
→ THEN proceed  

DO NOT CONTINUE UNTIL VERIFIED

--------------------------------
GOAL
--------------------------------

Verify that the entire NOVA system is:

- fully functional
- fully compliant with specifications
- free of errors
- production-ready

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT skip any test
- DO NOT assume anything works
- DO NOT stop until ALL tests pass

IF ANY FAILURE:
→ FIX
→ RETRY
→ RE-VALIDATE

---

--------------------------------
STEP 1 — PIPELINE END-TO-END TEST
--------------------------------

Test:

1. send message via API or UI
2. pipeline executes
3. stages run in correct order
4. task executes
5. result returned

MUST PASS:

- no skipped stages
- no execution outside pipeline
- correct logs created

---

--------------------------------
STEP 2 — CONNECTOR TEST
--------------------------------

Test:

- at least one connector works end-to-end
- API call executes successfully
- mapping works correctly

---

--------------------------------
STEP 3 — REAL-TIME TEST
--------------------------------

Test:

- WebSocket connects
- events emitted
- UI updates instantly
- NO refresh required

---

--------------------------------
STEP 4 — TASK SYSTEM TEST
--------------------------------

Test:

- task created
- task queued
- worker executes
- result returned

---

--------------------------------
STEP 5 — APPROVAL SYSTEM TEST
--------------------------------

Test:

- action requires approval
- approval created
- approval resolves
- pipeline resumes

---

--------------------------------
STEP 6 — PERMISSION TEST
--------------------------------

Test:

- unauthorized user blocked
- role enforcement works
- DENY overrides ALLOW

---

--------------------------------
STEP 7 — ROLE SYSTEM TEST
--------------------------------

Test:

- roles applied
- workflows triggered correctly
- capabilities resolved correctly

---

--------------------------------
STEP 8 — STORAGE TEST
--------------------------------

Test:

- file write
- file read
- correct storage location used

---

--------------------------------
STEP 9 — NODE SYSTEM TEST
--------------------------------

Test:

- node registers
- heartbeat updates
- task assigned to node

---

--------------------------------
STEP 10 — ERROR HANDLING TEST
--------------------------------

Test:

- simulate failure
- verify retry behavior
- verify logging

---

--------------------------------
STEP 11 — SECURITY TEST
--------------------------------

Test:

- invalid token rejected
- permission violations blocked
- secrets not exposed

---

--------------------------------
STEP 12 — OBSERVABILITY TEST
--------------------------------

Test:

- logs visible
- integration status visible
- node status visible

---

--------------------------------
STEP 13 — UI VALIDATION
--------------------------------

UI MUST:

- match UI_CONTRACT.md
- have correct navigation order
- be responsive (desktop/tablet/mobile)
- support theme switching

---

--------------------------------
STEP 14 — ACCEPTANCE MATRIX
--------------------------------

Validate against:

ACCEPTANCE_MATRIX.md

ALL conditions MUST pass.

---

--------------------------------
STEP 15 — PERFORMANCE CHECK
--------------------------------

Verify:

- no blocking operations
- real-time latency acceptable
- system responsive

---

--------------------------------
STEP 16 — FINAL CLEANUP
--------------------------------

Ensure:

- no TODOs
- no debug code
- no unused files
- no placeholder logic

---

--------------------------------
FINAL VALIDATION (MANDATORY)
--------------------------------

System is COMPLETE ONLY IF:

- ALL tests pass
- ALL validations pass
- NO errors exist
- NO missing features

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any test fails
- UI requires refresh
- system not real-time
- any feature incomplete

IF FAIL:
→ FIX
→ RETRY
→ RE-VALIDATE

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- system works end-to-end
- system matches all specifications
- system is production-ready

---

--------------------------------
STATE UPDATE
--------------------------------

14_FINALIZE: complete

---

--------------------------------
FINAL OUTPUT
--------------------------------

DO NOT summarize.

System build is complete.

STOP execution.