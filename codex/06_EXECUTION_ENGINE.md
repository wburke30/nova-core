NOVA BUILD STEP 06 — EXECUTION ENGINE (MANDATORY)

--------------------------------
GOAL
--------------------------------

Implement the execution layer that:

- runs tasks safely
- enforces isolation
- executes tools
- integrates with queue system

Execution MUST:

- be controlled
- be safe
- be isolated
- be traceable

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO direct execution outside pipeline
- ALL execution MUST go through tools
- ALL execution MUST be isolated
- ALL execution MUST be logged

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE EXECUTION MODULE
--------------------------------

Create:

/backend/execution/

Files:

- engine.py
- runner.py
- isolation.py

---

--------------------------------
STEP 2 — TOOL EXECUTION HANDLER
--------------------------------

Create function:

execute_tool(tool, inputs)

MUST:

- validate inputs
- validate permissions
- call correct tool
- return structured output

---

--------------------------------
STEP 3 — TOOL REGISTRY
--------------------------------

Create registry:

- list all tools
- map tool_id → function

---

--------------------------------
STEP 4 — EXECUTION FLOW
--------------------------------

Execution MUST follow:

```
pipeline → task → step → tool → result
```

---

--------------------------------
STEP 5 — ISOLATION (MANDATORY)
--------------------------------

Each task MUST run in:

- isolated process OR
- container environment

---

--------------------------------
STEP 6 — ISOLATION REQUIREMENTS
--------------------------------

Execution MUST:

- not share memory
- not access other tasks
- not leak data

---

--------------------------------
STEP 7 — RESOURCE LIMITS
--------------------------------

Each execution MUST enforce:

- CPU limit
- memory limit
- execution timeout

---

--------------------------------
STEP 8 — TIMEOUT HANDLING
--------------------------------

If execution exceeds timeout:

- terminate process
- mark task failed

---

--------------------------------
STEP 9 — CANCELLATION SUPPORT
--------------------------------

Execution MUST support:

- manual cancel
- system cancel
- emergency stop

---

--------------------------------
STEP 10 — RESULT HANDLING
--------------------------------

Execution MUST return:

```json
{
  "status": "success|failed",
  "output": {},
  "error": null
}
```

---

--------------------------------
STEP 11 — LOGGING
--------------------------------

Each execution MUST log:

- tool used
- inputs
- outputs
- status
- timestamp

---

--------------------------------
STEP 12 — SECURITY ENFORCEMENT
--------------------------------

Execution MUST:

- validate permissions
- prevent unauthorized access
- not expose secrets

---

--------------------------------
STEP 13 — ERROR HANDLING
--------------------------------

If execution fails:

- capture error
- return structured error
- trigger retry if applicable

---

--------------------------------
STEP 14 — INTEGRATION WITH QUEUE
--------------------------------

Execution MUST:

- NOT run directly
- receive tasks from queue
- return results to queue

---

--------------------------------
STEP 15 — TEST EXECUTION
--------------------------------

Run test task:

- simple tool execution
- verify output
- verify logs

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- execution works
- isolation enforced
- timeout enforced
- cancellation works
- logs recorded

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- execution not isolated
- tool bypass occurs
- timeout ignored
- logs missing

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- execution safe
- execution isolated
- execution logged
- execution controlled

---

--------------------------------
STATE UPDATE
--------------------------------

06_EXECUTION_ENGINE: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

07_QUEUE_WORKERS.md