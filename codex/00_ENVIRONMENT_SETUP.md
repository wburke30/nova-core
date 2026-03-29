NOVA BUILD STEP 00 — ENVIRONMENT SETUP (MANDATORY)

--------------------------------
GOAL
--------------------------------

Prepare a fully controlled and deterministic environment for NOVA build.

This step ensures:

- no missing dependencies
- no port conflicts
- all required services are available
- build can proceed safely

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT skip this step
- DO NOT assume environment is ready
- DO NOT continue until all checks pass

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
ENVIRONMENT CHECK (MANDATORY)
--------------------------------

Before executing this step, you MUST:

1. Verify required dependencies exist
2. Install missing dependencies
3. Verify required services are running
4. Start services if not running

You MUST NOT assume any dependency exists.

---

--------------------------------
REQUIRED CHECKS
--------------------------------

- Python 3.11+ installed and working
- Node.js (LTS) installed and working
- npm or pnpm installed
- PostgreSQL installed OR running via container
- Git installed

---

--------------------------------
STEP 1 — PORT VALIDATION
--------------------------------

Verify ports are available:

- 3000 (frontend)
- 8000 (backend)
- 5432 (postgres)

IF port is in use:

→ stop conflicting service OR change port  
→ verify port is free  

---

--------------------------------
STEP 2 — PYTHON SETUP
--------------------------------

IF Python missing or incorrect:

→ install Python 3.11+

Create virtual environment:

python -m venv venv

Activate:

source venv/bin/activate (Mac/Linux)
venv\Scripts\activate (Windows)

---

--------------------------------
STEP 3 — NODE SETUP
--------------------------------

IF Node missing:

→ install Node LTS

Verify:

node -v
npm -v

---

--------------------------------
STEP 4 — POSTGRES SETUP
--------------------------------

IF PostgreSQL not running:

Use Docker:

docker run -d \
  --name nova-postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=nova \
  -p 5432:5432 \
  postgres

Verify connection works.

---

--------------------------------
STEP 5 — BASE DEPENDENCY INSTALL
--------------------------------

Install baseline dependencies:

Backend:

pip install fastapi uvicorn sqlalchemy psycopg2-binary

Frontend:

npm install

---

--------------------------------
STEP 6 — SERVICE VALIDATION
--------------------------------

Verify:

- Python executes
- Node executes
- PostgreSQL accepts connections
- no errors present

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- dependencies installed
- services running
- ports available
- no errors in setup

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- dependency missing
- service not running
- port conflict unresolved

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- environment stable
- dependencies installed
- services operational

---

--------------------------------
STATE UPDATE
--------------------------------

00_ENVIRONMENT_SETUP: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

01_BOOTSTRAP.md