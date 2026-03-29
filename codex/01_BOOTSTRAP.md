NOVA BUILD STEP 01 — BOOTSTRAP (MANDATORY)

--------------------------------
GOAL
--------------------------------

Initialize NOVA system inside EXISTING repository.

System MUST:

- use current repo root
- NOT create nested /nova/ directory
- setup backend + frontend + database
- be fully runnable

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT create /nova/ folder
- DO NOT change root structure
- DO NOT assume dependencies exist

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
ENVIRONMENT CHECK (MANDATORY)
--------------------------------

Before ANY setup:

VERIFY OR INSTALL:

- Python 3.11+
- Node.js (LTS)
- npm or pnpm
- PostgreSQL (or container)
- Git

IF MISSING:
→ INSTALL  
→ VERIFY  

---

--------------------------------
STEP 1 — BACKEND SETUP
--------------------------------

Create:

/backend/

Inside:

- app/
- main.py

---

--------------------------------
STEP 2 — FASTAPI APP
--------------------------------

Create:

/backend/app/main.py

MUST:

- initialize FastAPI
- create root route `/`

RETURN:

```json
{
  "status": "NOVA backend running"
}
```

---

--------------------------------
STEP 3 — BACKEND DEPENDENCIES
--------------------------------

Create:

/backend/requirements.txt

MUST INCLUDE:

- fastapi
- uvicorn
- sqlalchemy
- psycopg2-binary

Install dependencies.

---

--------------------------------
STEP 4 — FRONTEND SETUP
--------------------------------

Create:

/frontend/

Use:

- Next.js
- TypeScript
- TailwindCSS

---

--------------------------------
STEP 5 — FRONTEND ROOT PAGE
--------------------------------

Create:

/frontend/app/page.tsx

MUST render:

"NOVA UI running"

---

--------------------------------
STEP 6 — DATABASE SETUP
--------------------------------

Ensure PostgreSQL:

IF not running:
→ start OR create container

Create:

/backend/app/db.py

MUST:

- connect to DB
- handle errors
- verify connection

---

--------------------------------
STEP 7 — DOCKER SETUP (OPTIONAL BUT PREFERRED)
--------------------------------

Create:

docker-compose.yml

MUST include:

- backend
- frontend
- postgres

---

--------------------------------
STEP 8 — WEBSOCKET BASE
--------------------------------

Add WebSocket endpoint:

/ws

MUST:

- accept connection
- return "connected"

---

--------------------------------
STEP 9 — RUN SYSTEM
--------------------------------

Start:

- backend (port 8000)
- frontend (port 3000)
- database

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- backend returns response
- frontend loads
- DB connects
- websocket connects
- NO runtime errors

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any service fails
- any dependency missing
- any error in logs

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- system runs cleanly
- no errors exist
- all services operational

---

--------------------------------
STATE UPDATE
--------------------------------

01_BOOTSTRAP: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

02_DATABASE.md