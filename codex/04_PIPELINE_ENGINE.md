NOVA BUILD STEP 04 — PIPELINE ENGINE (MANDATORY)

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

Implement the FULL pipeline engine EXACTLY as defined in:

- 03_PIPELINE_ENGINE.md
- 10_PIPELINE_STAGES.md

Pipeline MUST:

- control ALL execution
- enforce ordering
- enforce validation
- log all activity

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO execution outside pipeline
- NO skipped stages
- NO direct tool calls
- NO direct connector calls

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE PIPELINE MODULE
--------------------------------

Create:

/backend/pipeline/

Files:

- engine.py
- stages.py
- runner.py

---

--------------------------------
STEP 2 — DEFINE PIPELINE STAGES
--------------------------------

Implement EXACT stages:

1. input_received
2. normalize_message
3. classify_intent
4. load_memory_context
5. map_to_canonical
6. capability_resolution
7. generate_plan
8. persist_plan
9. risk_validation
10. automation_check
11. approval_gate
12. execute_steps
13. connector_execution
14. verify_results
15. persist_results
16. update_memory
17. return_response

NO additions
NO removals

---

--------------------------------
STEP 3 — PIPELINE RUN STRUCTURE
--------------------------------

Each execution MUST create:

pipeline_run

Stored in DB:

- pipeline_run_id
- project_id
- status
- current_stage

---

--------------------------------
STEP 4 — STAGE EXECUTION ENGINE
--------------------------------

Pipeline MUST:

- execute stages in order
- pass output → next stage
- store stage results

---

--------------------------------
STEP 5 — STAGE LOGGING
--------------------------------

After EACH stage:

Store:

- stage name
- input
- output
- status
- timestamp

---

--------------------------------
STEP 6 — CAPABILITY RESOLUTION
--------------------------------

Pipeline MUST:

- map intent → capability
- NOT call tools directly

---

--------------------------------
STEP 7 — EXECUTION HANDOFF
--------------------------------

Pipeline MUST:

- send execution to queue system
- NOT execute tasks directly

---

--------------------------------
STEP 8 — CONNECTOR ENFORCEMENT
--------------------------------

ALL external actions MUST:

- go through connector_execution stage
- NOT bypass pipeline

---

--------------------------------
STEP 9 — FAILURE HANDLING
--------------------------------

If ANY stage fails:

- stop pipeline
- mark failed
- log error
- trigger recovery

---

--------------------------------
STEP 10 — VALIDATION CHECK
--------------------------------

Pipeline MUST validate:

- stage outputs are valid
- required data present
- no schema violations

---

--------------------------------
STEP 11 — API INTEGRATION
--------------------------------

POST /messages MUST:

→ trigger pipeline execution

---

--------------------------------
STEP 12 — TEST PIPELINE
--------------------------------

Send test message:

"hello"

MUST:

- trigger pipeline
- execute all stages
- return response

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- all stages execute
- order is correct
- DB records created
- logs exist for each stage
- response returned

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- stage skipped
- order incorrect
- missing logs
- execution outside pipeline

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- pipeline fully functional
- all stages validated
- system responds correctly

---

--------------------------------
STATE UPDATE
--------------------------------

04_PIPELINE_ENGINE: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

05_POLICY_RUNTIME.md