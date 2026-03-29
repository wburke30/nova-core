NOVA BUILD STEP 01 — BOOTSTRAP (MANDATORY)

--------------------------------
GOAL
--------------------------------

Initialize a fully working NOVA base system with:

- FastAPI backend
- Next.js frontend
- PostgreSQL database
- WebSocket support
- Clean project structure

System MUST run successfully after this step.

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT skip any task
- DO NOT assume anything
- DO NOT use placeholders
- DO NOT leave TODOs
- DO NOT stop early

IF ANY ERROR OCCURS:
→ FIX IT IMMEDIATELY
→ RETRY
→ CONTINUE

---

--------------------------------
PROJECT STRUCTURE (MUST MATCH EXACTLY)
--------------------------------

Create:

/nova/
  /backend/
  /frontend/
  /infra/
  /docker/
  docker-compose.yml
  README.md

---

--------------------------------
STEP 1 — BACKEND SETUP
--------------------------------

Create FastAPI backend.

REQUIREMENTS:

- Python 3.11+
- FastAPI
- Uvicorn

Create file:

/backend/main.py

MUST CONTAIN:

- FastAPI app instance
- root route: GET /

RETURN:

{
  "status": "NOVA backend running"
}

---

--------------------------------
STEP 2 — BACKEND DEPENDENCIES
--------------------------------

Create:

/backend/requirements.txt

MUST INCLUDE:

fastapi
uvicorn
psycopg2-binary
sqlalchemy

Install dependencies.

---

--------------------------------
STEP 3 — FRONTEND SETUP
--------------------------------

Create Next.js app:

/frontend/

REQUIREMENTS:

- Next.js (App Router)
- TypeScript
- TailwindCSS

---

--------------------------------
STEP 4 — FRONTEND ROOT PAGE
--------------------------------

Create:

/frontend/app/page.tsx

MUST RENDER:

- simple page
- text: "NOVA UI running"

---

--------------------------------
STEP 5 — DATABASE SETUP
--------------------------------

Use PostgreSQL.

MUST:

- connect successfully
- create connection utility

Create:

/backend/db.py

MUST:

- establish DB connection
- handle connection errors

---

--------------------------------
STEP 6 — DOCKER SETUP
--------------------------------

Create docker-compose.yml

MUST INCLUDE:

- backend service
- frontend service
- postgres service

---

--------------------------------
STEP 7 — WEBSOCKET BASE
--------------------------------

Add WebSocket endpoint:

/ws

MUST:

- accept connection
- send test message:
  "connected"

---

--------------------------------
STEP 8 — RUN SYSTEM
--------------------------------

Start system.

MUST VERIFY:

1. Backend runs (http://localhost:8000)
2. Frontend runs (http://localhost:3000)
3. Database connects
4. WebSocket connects

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- backend returns correct response
- frontend loads page
- database connection successful
- websocket returns "connected"
- NO runtime errors

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any service does not start
- any endpoint fails
- any error in logs
- any missing dependency

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

This step is COMPLETE ONLY IF:

- all services run successfully
- all validations pass
- no errors exist

---

--------------------------------
OUTPUT REQUIREMENT
--------------------------------

DO NOT summarize.

Proceed to next step automatically.

---

--------------------------------
NEXT STEP
--------------------------------

After completion:

→ Update BUILD_STATUS.md

01_BOOTSTRAP: complete

→ Proceed to:

02_DATABASE.md