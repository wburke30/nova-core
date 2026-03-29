NOVA BUILD STEP 07 — QUEUE & WORKERS (MANDATORY)

--------------------------------
GOAL
--------------------------------

Implement asynchronous execution system with:

- job queue
- worker processing
- distributed execution
- idempotency
- locking

System MUST:

- process tasks reliably
- prevent duplicates
- scale across nodes

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- ALL execution MUST go through queue
- NO direct execution allowed
- ALL jobs MUST be idempotent
- ALL jobs MUST use locking

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE QUEUE MODULE
--------------------------------

Create:

/backend/queue/

Files:

- queue.py
- worker.py
- scheduler.py

---

--------------------------------
STEP 2 — JOB STRUCTURE
--------------------------------

Each job MUST follow:

```json
{
  "job_id": "uuid",
  "task_id": "uuid",
  "project_id": "uuid",
  "status": "queued|running|completed|failed",
  "attempt_count": 0,
  "max_attempts": 3,
  "idempotency_key": "string",
  "created_at": "timestamp"
}
```

---

--------------------------------
STEP 3 — QUEUE IMPLEMENTATION
--------------------------------

Queue MUST:

- store jobs
- support enqueue/dequeue
- support priority (optional)
- support retries

---

--------------------------------
STEP 4 — WORKER IMPLEMENTATION
--------------------------------

Workers MUST:

- poll queue
- lock job
- execute task
- return result

---

--------------------------------
STEP 5 — LOCKING (MANDATORY)
--------------------------------

Before execution:

- acquire lock
- ensure no duplicate execution

Use:

locks table

---

--------------------------------
STEP 6 — IDEMPOTENCY (MANDATORY)
--------------------------------

Before execution:

- check idempotency_key
- if exists → return stored result
- if not → execute

---

--------------------------------
STEP 7 — EXECUTION FLOW
--------------------------------

```
queue → worker → lock → execute → result → update
```

---

--------------------------------
STEP 8 — RETRY LOGIC
--------------------------------

Retries MUST:

- use exponential backoff
- respect max_attempts
- not duplicate effects

---

--------------------------------
STEP 9 — FAILURE HANDLING
--------------------------------

If job fails:

- increment attempt_count
- retry if allowed
- mark failed if exceeded

---

--------------------------------
STEP 10 — DEAD JOB HANDLING
--------------------------------

If job fails repeatedly:

- mark as failed
- log error
- notify system

---

--------------------------------
STEP 11 — DISTRIBUTED WORKERS
--------------------------------

System MUST support:

- multiple workers
- multiple nodes
- load distribution

---

--------------------------------
STEP 12 — LOAD BALANCING
--------------------------------

Jobs MUST be assigned based on:

- worker availability
- node capability
- system load

---

--------------------------------
STEP 13 — JOB STATES
--------------------------------

Allowed states:

- queued
- running
- completed
- failed
- cancelled

---

--------------------------------
STEP 14 — LOGGING
--------------------------------

Each job MUST log:

```json
{
  "event": "job_execution",
  "job_id": "",
  "status": "",
  "timestamp": ""
}
```

---

--------------------------------
STEP 15 — TEST QUEUE
--------------------------------

Test:

- enqueue job
- worker processes job
- result returned
- logs created

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- queue works
- workers execute jobs
- idempotency enforced
- locking enforced
- retries work
- no duplicate execution

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- duplicate execution occurs
- locking fails
- retry loops infinite
- jobs lost

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- queue reliable
- workers stable
- execution scalable
- no duplication

---

--------------------------------
STATE UPDATE
--------------------------------

07_QUEUE_WORKERS: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

08_EVENTS_WEBSOCKET.md