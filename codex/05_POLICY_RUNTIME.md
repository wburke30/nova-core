NOVA BUILD STEP 05 — POLICY & APPROVAL SYSTEM (MANDATORY)

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

Implement full Policy Engine + Approval System EXACTLY as defined in:

- 17_POLICY_ENGINE.md
- 11_APPROVAL_SYSTEM.md
- 21_PERMISSIONS_MODEL.md

System MUST:

- block unsafe actions
- enforce permissions
- require approvals when needed

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO action executes without policy validation
- NO approval bypass
- NO permission bypass

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE POLICY MODULE
--------------------------------

Create:

/backend/policy/

Files:

- engine.py
- rules.py

---

--------------------------------
STEP 2 — POLICY ENGINE FUNCTION
--------------------------------

Create function:

evaluate_policy(action, context)

MUST RETURN:

```json
{
  "allowed": true,
  "requires_approval": false,
  "risk_level": "low|medium|high",
  "reason": ""
}
```

---

--------------------------------
STEP 3 — RISK EVALUATION
--------------------------------

Implement logic:

- low → internal action
- medium → external action
- high → destructive / financial impact

---

--------------------------------
STEP 4 — PERMISSION ENFORCEMENT
--------------------------------

Before ANY action:

- check user role
- check project access
- apply precedence:

DENY > ALLOW
User > Project > Team

IF FAIL:
→ block execution

---

--------------------------------
STEP 5 — APPROVAL SYSTEM
--------------------------------

Create:

/backend/approval/

Files:

- service.py

---

--------------------------------
STEP 6 — APPROVAL FLOW
--------------------------------

If requires_approval = true:

- create approval record
- pause pipeline
- wait for user decision

---

--------------------------------
STEP 7 — APPROVAL ENDPOINT
--------------------------------

Implement:

POST /tasks/{id}/approve

MUST:

- validate user
- update approval
- resume pipeline

---

--------------------------------
STEP 8 — AUTOMATION CHECK
--------------------------------

Implement:

- automation settings
- approval bypass ONLY if allowed

---

--------------------------------
STEP 9 — POLICY INTEGRATION
--------------------------------

Integrate into pipeline:

- risk_validation stage
- approval_gate stage

---

--------------------------------
STEP 10 — TEST CASES
--------------------------------

Test:

1. safe action → auto execute
2. external action → requires approval
3. denied action → blocked

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- policy blocks unsafe actions
- approvals created correctly
- approval resumes pipeline
- permissions enforced

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- action executes without policy
- approval skipped
- permissions ignored

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- policy engine works fully
- approval system works fully
- permissions enforced everywhere

---

--------------------------------
STATE UPDATE
--------------------------------

05_POLICY_RUNTIME: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

06_EXECUTION_ENGINE.md