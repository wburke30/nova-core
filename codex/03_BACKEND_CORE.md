NOVA BUILD STEP 03 — BACKEND CORE (MANDATORY)

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

Implement core backend systems:

- authentication
- user management
- project context
- configuration system

System MUST:

- identify user
- identify project
- enforce access

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO anonymous execution
- NO missing project context
- NO hardcoded values
- NO bypass of permissions

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — AUTHENTICATION SYSTEM
--------------------------------

Implement:

JWT-based authentication

Create:

/backend/auth.py

MUST:

- generate JWT tokens
- validate tokens
- extract user_id

---

--------------------------------
STEP 2 — LOGIN ENDPOINT
--------------------------------

Create:

POST /auth/login

Input:

{
  "email": "",
  "password": ""
}

Output:

{
  "token": ""
}

---

--------------------------------
STEP 3 — AUTH MIDDLEWARE
--------------------------------

ALL requests MUST:

- validate token
- extract user_id

IF INVALID:
→ reject request

---

--------------------------------
STEP 4 — USER CONTEXT
--------------------------------

Create request context:

```python
request.state.user_id
```

MUST exist for all requests

---

--------------------------------
STEP 5 — PROJECT CONTEXT (CRITICAL)
--------------------------------

ALL requests MUST include:

project_id

MUST:

- validate project exists
- verify user access
- attach to context

```python
request.state.project_id
```

---

--------------------------------
STEP 6 — PERMISSION CHECK
--------------------------------

Before ANY execution:

- validate user role
- enforce project access
- block unauthorized actions

---

--------------------------------
STEP 7 — CONFIG SYSTEM
--------------------------------

Create:

/backend/config.py

MUST:

- load config from DB
- support scopes:
  - system
  - project
  - user

---

--------------------------------
STEP 8 — CONFIG RESOLUTION
--------------------------------

Resolution order:

user → project → system

Closest scope wins

---

--------------------------------
STEP 9 — USER ENDPOINTS
--------------------------------

Implement:

GET /users
POST /users/invite

MUST:

- enforce permissions
- return correct data

---

--------------------------------
STEP 10 — PROJECT ENDPOINTS
--------------------------------

Implement:

GET /projects
POST /projects

MUST:

- enforce access control
- assign ownership

---

--------------------------------
STEP 11 — TEAM ENDPOINTS
--------------------------------

Implement:

GET /teams
POST /teams

MUST:

- manage team membership
- enforce roles

---

--------------------------------
STEP 12 — TEST AUTH FLOW
--------------------------------

Verify:

- login works
- token works
- protected route works
- project validation works

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- auth works
- token required
- user context exists
- project context exists
- permissions enforced
- endpoints respond correctly

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- request without auth passes
- project not validated
- permission bypass exists
- config fails

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- auth enforced everywhere
- project context enforced
- permissions enforced
- config system works

---

--------------------------------
STATE UPDATE
--------------------------------

03_BACKEND_CORE: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

04_PIPELINE_ENGINE.md