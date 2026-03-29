NOVA BUILD STEP 10 — INTEGRATIONS (MANDATORY)

--------------------------------
GOAL
--------------------------------

Implement full integration system using:

- 44_CONNECTOR_FRAMEWORK.md
- 49_MAPPING_ENGINE.md
- 55_INTEGRATION_LIBRARY.md
- 56_GENERIC_API_CONNECTOR.md

System MUST:

- support real integrations
- support generic APIs
- enforce mapping
- enforce connector usage

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- NO direct API calls
- ALL integrations MUST use connectors
- ALL data MUST be mapped to canonical model

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — CONNECTOR FRAMEWORK
--------------------------------

Implement:

/backend/connectors/

Files:

- base.py
- registry.py
- manager.py

---

--------------------------------
STEP 2 — CONNECTOR REGISTRY
--------------------------------

System MUST:

- register connectors
- map connector_id → implementation

---

--------------------------------
STEP 3 — GENERIC API CONNECTOR
--------------------------------

Implement:

Generic connector supporting:

- GET, POST, PUT, PATCH, DELETE
- headers
- auth
- response parsing

---

--------------------------------
STEP 4 — CONNECTOR INTERFACE
--------------------------------

ALL connectors MUST implement:

- connect()
- disconnect()
- ingest()
- execute()
- map_to_canonical()
- map_from_canonical()
- healthcheck()

---

--------------------------------
STEP 5 — MAPPING ENGINE
--------------------------------

Implement:

/backend/mapping/

MUST:

- convert external → canonical
- convert canonical → external

---

--------------------------------
STEP 6 — MAPPING VALIDATION
--------------------------------

Before pipeline:

- validate mapping exists
- reject invalid data

---

--------------------------------
STEP 7 — INTEGRATION LIBRARY
--------------------------------

Create registry:

- list integrations
- track status
- map capabilities

---

--------------------------------
STEP 8 — INTEGRATION FLOW
--------------------------------

MUST follow:

```
external → connector → mapping → pipeline → execution → connector → external
```

---

--------------------------------
STEP 9 — WEBHOOK HANDLING
--------------------------------

Implement:

- webhook endpoint
- validate payload
- convert to event

---

--------------------------------
STEP 10 — POLLING FALLBACK
--------------------------------

If no webhook:

- poll API
- detect changes
- generate events

---

--------------------------------
STEP 11 — TEST CONNECTOR
--------------------------------

Create test connector:

- mock API OR simple external API

Test:

- connect
- execute
- response mapping

---

--------------------------------
STEP 12 — ERROR HANDLING
--------------------------------

Connector MUST:

- detect errors
- retry safely
- log failure

---

--------------------------------
STEP 13 — RATE LIMITING
--------------------------------

Implement:

- request throttling
- retry with backoff

---

--------------------------------
STEP 14 — SECURITY
--------------------------------

Connector MUST:

- validate inputs
- protect credentials
- prevent injection

---

--------------------------------
STEP 15 — TEST INTEGRATION FLOW
--------------------------------

Test full flow:

1. external event
2. mapping
3. pipeline execution
4. connector execution
5. response returned

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- connectors work
- mapping works
- API calls succeed
- no raw data enters pipeline
- no direct API calls

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- connector bypass occurs
- mapping missing
- external data not normalized
- execution fails silently

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- integration system works end-to-end
- connectors enforced
- mapping enforced

---

--------------------------------
STATE UPDATE
--------------------------------

10_INTEGRATIONS: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

11_FRONTEND_SHELL.md