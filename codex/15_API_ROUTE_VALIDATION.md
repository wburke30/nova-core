NOVA BUILD STEP 15 — API & ROUTE VALIDATION (MANDATORY)

--------------------------------
GOAL
--------------------------------

Verify ALL endpoints and routes:

- exist
- respond correctly
- return proper status codes
- match API contract

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- EVERY endpoint MUST be tested
- EVERY route MUST return valid response
- NO silent failures allowed

IF ANY FAIL:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — ENUMERATE ALL ENDPOINTS
--------------------------------

Must include:

- /messages
- /tasks
- /pipeline/{id}
- /tasks/{id}/approve
- /nodes/register
- /nodes/heartbeat
- /integrations
- /users
- /roles
- /teams

---

--------------------------------
STEP 2 — TEST ALL ENDPOINTS
--------------------------------

For EACH endpoint:

- send request
- validate response

---

--------------------------------
STEP 3 — RESPONSE VALIDATION
--------------------------------

ALL responses MUST:

- follow standard format
- return correct HTTP code (200/4xx/5xx)
- include valid JSON

---

--------------------------------
STEP 4 — ERROR PATH TESTING
--------------------------------

Test:

- invalid request
- missing auth
- invalid project_id

MUST:

- return structured error
- not crash

---

--------------------------------
STEP 5 — WEBSOCKET TEST
--------------------------------

Test:

- connection success
- event delivery
- reconnection works

---

--------------------------------
STEP 6 — FRONTEND ROUTES
--------------------------------

Test ALL pages:

- /chat
- /projects
- /tasks
- /workflows
- /approvals
- /integrations
- /analytics
- /settings

MUST:

- load successfully
- not error
- be responsive

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- 100% endpoints reachable
- no broken routes
- no 500 errors
- no invalid responses

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any endpoint fails
- any route broken
- any response invalid

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
STATE UPDATE
--------------------------------

15_API_ROUTE_VALIDATION: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

16_DOCS_VALIDATION.md