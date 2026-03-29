NOVA BUILD STEP 08 — EVENTS & WEBSOCKET (MANDATORY)

--------------------------------
GOAL
--------------------------------

Implement a fully real-time system:

- event bus
- event emission
- WebSocket server
- UI push updates

System MUST:

- push updates instantly
- NOT use polling
- be fully event-driven

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO polling for live updates
- ALL state changes MUST emit events
- UI MUST receive updates via WebSocket ONLY

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE EVENT MODULE
--------------------------------

Create:

/backend/events/

Files:

- bus.py
- emitter.py
- handlers.py

---

--------------------------------
STEP 2 — EVENT STRUCTURE
--------------------------------

All events MUST follow:

```json
{
  "event_id": "uuid",
  "event_type": "string",
  "project_id": "uuid",
  "payload": {},
  "timestamp": "UTC"
}
```

---

--------------------------------
STEP 3 — REQUIRED EVENT TYPES
--------------------------------

Implement:

- pipeline_started
- pipeline_stage_update
- pipeline_completed
- task_created
- task_updated
- task_failed
- approval_requested
- approval_resolved
- connector_event
- node_status_update
- notification

---

--------------------------------
STEP 4 — EVENT EMISSION RULE
--------------------------------

EVERY state change MUST:

→ emit event

Examples:

- pipeline stage change
- task update
- connector response

---

--------------------------------
STEP 5 — EVENT BUS
--------------------------------

Implement event bus:

- publish events
- subscribe handlers
- ensure delivery

---

--------------------------------
STEP 6 — EVENT ORDERING (CRITICAL)
--------------------------------

Events MUST:

- be ordered per entity_id
- NOT process out-of-order

IF out-of-order:

→ queue OR reject

---

--------------------------------
STEP 7 — WEBSOCKET SERVER
--------------------------------

Add to FastAPI:

/ws endpoint

MUST:

- accept connection
- authenticate user
- subscribe to project events

---

--------------------------------
STEP 8 — WEBSOCKET MESSAGE FORMAT
--------------------------------

```json
{
  "event": "string",
  "project_id": "uuid",
  "payload": {}
}
```

---

--------------------------------
STEP 9 — CONNECTION FLOW
--------------------------------

```
client connects
→ authenticate
→ subscribe to project
→ receive events
```

---

--------------------------------
STEP 10 — RECONNECTION LOGIC
--------------------------------

If connection drops:

- reconnect automatically
- re-authenticate
- resubscribe

---

--------------------------------
STEP 11 — EVENT DELIVERY
--------------------------------

System MUST ensure:

- at-least-once delivery
- idempotent processing
- no silent loss

---

--------------------------------
STEP 12 — UI INTEGRATION (MANDATORY)
--------------------------------

Frontend MUST:

- connect to WebSocket
- subscribe to events
- update UI instantly

Example:

```javascript
socket.on("task_updated", updateUI)
```

---

--------------------------------
STEP 13 — STREAMING SUPPORT
--------------------------------

Chat MUST support:

- streaming responses
- partial updates

---

--------------------------------
STEP 14 — FAILURE HANDLING
--------------------------------

If event fails:

- retry emission
- log failure
- ensure consistency

---

--------------------------------
STEP 15 — TEST REAL-TIME
--------------------------------

Test:

1. send message
2. pipeline runs
3. event emitted
4. UI updates instantly

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- WebSocket connects
- events emitted
- UI updates instantly
- NO polling used

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- UI requires refresh
- polling used
- events missing
- delays noticeable

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- system fully real-time
- events reliable
- UI reactive

---

--------------------------------
STATE UPDATE
--------------------------------

08_EVENTS_WEBSOCKET: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

09_API_LAYER.md