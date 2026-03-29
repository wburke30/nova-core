NOVA BUILD STEP 09 — API LAYER (MANDATORY)

--------------------------------
GOAL
--------------------------------

Implement full API layer EXACTLY as defined in:

→ 23_API_LAYER.md

API MUST:

- route ALL requests to pipeline
- enforce authentication + permissions
- NEVER execute logic directly

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO direct execution in API
- ALL requests MUST go through pipeline
- ALL endpoints MUST validate auth + permissions

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE API MODULE
--------------------------------

Create:

/backend/api/

Files:

- routes.py
- auth_middleware.py
- validators.py

---

--------------------------------
STEP 2 — AUTH MIDDLEWARE
--------------------------------

Implement:

- JWT validation
- extract user_id
- attach to request

IF invalid:
→ reject request

---

--------------------------------
STEP 3 — PROJECT VALIDATION
--------------------------------

ALL requests MUST include:

project_id

MUST:

- verify project exists
- verify user access

---

--------------------------------
STEP 4 — RESPONSE FORMAT
--------------------------------

ALL responses MUST follow:

```json
{
  "success": true,
  "data": {},
  "error": null,
  "meta": {}
}
```

---

--------------------------------
STEP 5 — ERROR FORMAT
--------------------------------

```json
{
  "success": false,
  "error": {
    "code": "string",
    "message": "string"
  }
}
```

---

--------------------------------
STEP 6 — CORE ENDPOINTS
--------------------------------

Implement EXACT endpoints:

---

POST /messages

→ triggers pipeline

---

GET /tasks

→ returns tasks

---

GET /pipeline/{id}

→ returns pipeline details

---

POST /tasks/{id}/approve

→ approval system

---

POST /nodes/register

→ node registration

---

POST /nodes/heartbeat

→ node heartbeat

---

GET /integrations

→ list integrations

---

POST /integrations

→ create integration

---

GET /users

→ list users

---

POST /users/invite

→ invite user

---

POST /roles

GET /roles

POST /teams

GET /teams

---

--------------------------------
STEP 7 — REQUEST FLOW
--------------------------------

ALL requests MUST follow:

```
request
→ auth check
→ permission check
→ validation
→ pipeline
→ response
```

---

--------------------------------
STEP 8 — VALIDATION
--------------------------------

Requests MUST:

- match schema
- include required fields
- reject invalid input

---

--------------------------------
STEP 9 — RATE LIMITING
--------------------------------

Implement:

- per-user limits
- per-project limits
- per-endpoint limits

---

--------------------------------
STEP 10 — LOGGING
--------------------------------

ALL API calls MUST log:

```json
{
  "event": "api_request",
  "endpoint": "",
  "status": "",
  "timestamp": ""
}
```

---

--------------------------------
STEP 11 — SECURITY
--------------------------------

API MUST:

- sanitize inputs
- prevent injection
- not expose secrets

---

--------------------------------
STEP 12 — WEBSOCKET AUTH
--------------------------------

WebSocket MUST:

- validate token
- enforce project scope

---

--------------------------------
STEP 13 — TEST API
--------------------------------

Test:

- auth works
- protected endpoints block unauthorized access
- pipeline triggered correctly
- responses correct

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- endpoints respond correctly
- auth enforced
- permissions enforced
- pipeline triggered
- no direct execution

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- endpoint executes logic directly
- auth bypass possible
- permissions ignored
- incorrect response format

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- API fully secure
- API fully routed through pipeline
- responses standardized

---

--------------------------------
STATE UPDATE
--------------------------------

09_API_LAYER: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

10_INTEGRATIONS.md