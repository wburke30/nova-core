NOVA BUILD STEP 00 — ENVIRONMENT SETUP (MANDATORY)

--------------------------------
GOAL
--------------------------------

Prepare a fully controlled environment BEFORE build begins.

This step eliminates:

- version conflicts
- port conflicts
- missing dependencies
- service failures

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT skip this step
- DO NOT assume environment is ready

---

--------------------------------
STEP 1 — PORT VALIDATION
--------------------------------

Verify ports are free:

- 3000 (frontend)
- 8000 (backend)
- 5432 (postgres)

IF occupied:

→ stop service OR change port  
→ confirm port is free  

---

--------------------------------
STEP 2 — PYTHON SETUP
--------------------------------

Ensure:

- Python 3.11+

IF not:

→ install correct version  

Create virtual env:

```
python -m venv venv
source venv/bin/activate
```

---

--------------------------------
STEP 3 — NODE SETUP
--------------------------------

Ensure:

- Node LTS installed

IF not:

→ install Node LTS  

---

--------------------------------
STEP 4 — POSTGRES SETUP
--------------------------------

Preferred: Docker

```
docker run -d \
  --name nova-postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=nova \
  -p 5432:5432 \
  postgres
```

Verify connection.

---

--------------------------------
STEP 5 — DEPENDENCY PRE-INSTALL
--------------------------------

Install base packages:

Backend:

```
pip install fastapi uvicorn sqlalchemy psycopg2-binary
```

Frontend:

```
npm install
```

---

--------------------------------
STEP 6 — SERVICE VALIDATION
--------------------------------

Verify:

- Python runs
- Node runs
- Postgres accepts connections

---

--------------------------------
STEP 7 — LOGGING ENABLEMENT
--------------------------------

Ensure logs are visible:

- backend logs
- worker logs

---

--------------------------------
STEP 8 — SAFE BASELINE
--------------------------------

Confirm:

- no errors
- all services reachable
- ports clean

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- environment stable
- all dependencies installed
- all services reachable

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