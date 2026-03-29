NOVA BUILD STEP 00 — ENVIRONMENT SETUP (MANDATORY)

--------------------------------
GOAL
--------------------------------

Prepare a deterministic, verifiable environment for NOVA build.

This step MUST:

- ensure all dependencies exist
- ensure all required services are running
- produce a verifiable artifact

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT skip this step
- DO NOT assume environment is ready
- DO NOT proceed without verification

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
ENVIRONMENT CHECK (MANDATORY)
--------------------------------

You MUST verify:

- Python 3.11+ installed
- Node.js (LTS) installed
- npm or pnpm installed
- PostgreSQL installed OR running in container
- Git installed

IF missing:

→ INSTALL  
→ VERIFY  

---

--------------------------------
STEP 1 — PORT VALIDATION
--------------------------------

Ensure ports are available:

- 3000
- 8000
- 5432

IF occupied:

→ free port OR reassign  
→ verify availability  

---

--------------------------------
STEP 2 — PYTHON ENVIRONMENT
--------------------------------

Create virtual environment:

python -m venv venv

Activate environment.

---

--------------------------------
STEP 3 — NODE VALIDATION
--------------------------------

Verify:

node -v
npm -v

---

--------------------------------
STEP 4 — POSTGRES SETUP
--------------------------------

IF PostgreSQL not running:

Start using Docker:

docker run -d \
  --name nova-postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=nova \
  -p 5432:5432 \
  postgres

Verify connection succeeds.

---

--------------------------------
STEP 5 — BASE DEPENDENCY INSTALL
--------------------------------

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

---

--------------------------------
STEP 7 — ENVIRONMENT MARKER (MANDATORY)
--------------------------------

Create file:

/backend/.env.ready

Contents:

ENVIRONMENT_READY=true

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- dependencies installed
- services running
- ports available
- marker file exists
- marker file content correct

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any dependency missing
- service not running
- marker file missing

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- environment stable
- marker file created
- all checks pass

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