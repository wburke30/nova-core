NOVA BUILD STEP 12 — FRONTEND REALTIME (MANDATORY)

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

Implement real-time frontend behavior using:

- WebSocket connection
- event-driven UI updates
- live task / pipeline / notification updates

UI MUST:

- update instantly
- NOT use polling
- reflect true backend state
- feel seamless

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO polling for live state
- NO setInterval refresh loops
- ALL live updates MUST come from WebSocket events
- UI MUST subscribe to project-scoped events

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CREATE REALTIME MODULE
--------------------------------

Create:

/frontend/lib/realtime.ts
/frontend/lib/socket.ts

MUST:

- initialize WebSocket connection
- authenticate socket
- subscribe to project events
- expose event handlers

---

--------------------------------
STEP 2 — WEBSOCKET CONNECTION
--------------------------------

Frontend MUST:

- connect to backend /ws endpoint
- send auth token
- send active project_id
- handle connection lifecycle

---

--------------------------------
STEP 3 — RECONNECTION LOGIC
--------------------------------

If socket disconnects:

- reconnect automatically
- re-authenticate
- re-subscribe to current project
- avoid duplicate subscriptions

---

--------------------------------
STEP 4 — REQUIRED EVENT HANDLERS
--------------------------------

Implement handlers for:

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
STEP 5 — CHAT REALTIME UPDATES
--------------------------------

Chat UI MUST:

- stream assistant responses live
- show task progress updates
- append messages without full page reload
- reflect true backend state

---

--------------------------------
STEP 6 — TASK LIST REALTIME UPDATES
--------------------------------

Tasks page MUST:

- update task status instantly
- reflect queued/running/completed/failed
- update without manual refresh

---

--------------------------------
STEP 7 — APPROVALS REALTIME UPDATES
--------------------------------

Approvals page MUST:

- show new approvals instantly
- remove/update approvals instantly after decision

---

--------------------------------
STEP 8 — INTEGRATIONS / NODES STATUS REALTIME
--------------------------------

Relevant UI sections MUST:

- update node health instantly
- update integration state instantly
- reflect degraded/offline/connected changes

---

--------------------------------
STEP 9 — STATE MANAGEMENT
--------------------------------

Frontend MUST maintain a single reactive state source for live updates.

MAY use:

- React context
- Zustand
- equivalent lightweight state store

MUST:

- avoid duplicated local state
- avoid stale state conflicts

---

--------------------------------
STEP 10 — EVENT APPLICATION RULE
--------------------------------

When event received:

- validate event type
- validate project_id matches active project
- update corresponding UI state only
- never mutate unrelated state

---

--------------------------------
STEP 11 — STREAMING RESPONSE BEHAVIOR
--------------------------------

Assistant responses MUST support:

- partial token streaming OR
- staged message updates

UI MUST:

- render incremental output smoothly
- not flicker
- not overwrite entire chat list

---

--------------------------------
STEP 12 — NOTIFICATION SYSTEM
--------------------------------

Implement real-time in-app notifications for:

- task failed
- approval required
- integration offline
- node offline
- pipeline completed

Notifications MUST:

- appear instantly
- be dismissible
- not block primary workflow unless critical

---

--------------------------------
STEP 13 — LOADING / CONNECTION STATES
--------------------------------

UI MUST visibly handle:

- connecting
- connected
- reconnecting
- disconnected

Chat and live panels MUST show accurate connection state.

---

--------------------------------
STEP 14 — FORBIDDEN REALTIME BEHAVIOR
--------------------------------

DO NOT:

- use polling for live updates
- refresh full page to show changes
- use fake timers to simulate realtime
- silently drop events

---

--------------------------------
STEP 15 — TEST REALTIME FLOW
--------------------------------

Test full sequence:

1. User sends message
2. Backend pipeline starts
3. WebSocket emits pipeline_started
4. Chat shows live processing
5. pipeline_stage_update events update UI
6. Final response renders
7. Task list updates instantly
8. No page refresh required

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- WebSocket connects successfully
- project-scoped subscription works
- chat updates live
- tasks update live
- approvals update live
- notifications appear live
- reconnection works
- NO polling exists

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- UI requires refresh to see changes
- polling is used for live state
- events are duplicated
- stale data remains on screen
- reconnect breaks subscriptions

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- frontend is truly real-time
- all live updates are push-based
- UI reflects backend state instantly
- no polling is used

---

--------------------------------
STATE UPDATE
--------------------------------

12_FRONTEND_REALTIME: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

13_SECURITY.md