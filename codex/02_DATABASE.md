NOVA BUILD STEP 02 — DATABASE (MANDATORY)

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

Implement full PostgreSQL schema EXACTLY as defined in:

→ 09_DATABASE_SCHEMA.md

Database MUST be:

- fully created
- fully connected
- fully validated

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- DO NOT modify schema structure
- DO NOT skip tables
- DO NOT simplify fields
- DO NOT guess types

IF ANY ERROR OCCURS:
→ FIX IMMEDIATELY
→ RETRY
→ CONTINUE

---

--------------------------------
STEP 1 — DATABASE CONNECTION
--------------------------------

Use SQLAlchemy.

Create:

/backend/db.py

MUST:

- connect to PostgreSQL
- use environment variables
- support reconnect

---

--------------------------------
STEP 2 — SCHEMA IMPLEMENTATION
--------------------------------

Implement ALL tables EXACTLY:

users
teams
team_members
projects
project_users
pipeline_runs
pipeline_stage_history
tasks
steps
products
inventory_items
orders
customers
connectors
connector_instances
roles
role_assignments
id_mappings
reconciliation_jobs
reconciliation_logs
job_queue
locks
events

---

--------------------------------
STEP 3 — MODEL FILES
--------------------------------

Create:

/backend/models/

Each table MUST:

- be its own model
- use SQLAlchemy ORM
- define relationships explicitly

---

--------------------------------
STEP 4 — MIGRATIONS
--------------------------------

Use Alembic.

MUST:

- generate migration scripts
- apply migrations
- verify tables exist

---

--------------------------------
STEP 5 — VALIDATION QUERIES
--------------------------------

Execute:

- SELECT * FROM users
- SELECT * FROM projects
- SELECT * FROM tasks

MUST NOT FAIL.

---

--------------------------------
STEP 6 — DATA RULE VALIDATION
--------------------------------

Verify:

- UUID primary keys work
- timestamps are UTC
- constraints enforced

---

--------------------------------
STEP 7 — PROJECT SCOPING
--------------------------------

Verify:

- project_id exists on all required tables
- no global data leakage

---

--------------------------------
STEP 8 — TEST INSERT
--------------------------------

Insert:

- test user
- test project

Verify retrieval works.

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- database connects
- all tables exist
- no missing columns
- inserts succeed
- queries succeed
- no migration errors

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- any table missing
- schema mismatch
- migration fails
- query fails

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

Step COMPLETE ONLY IF:

- schema matches spec exactly
- DB fully operational
- all validation passes

---

--------------------------------
STATE UPDATE
--------------------------------

Update:

02_DATABASE: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

03_BACKEND_CORE.md