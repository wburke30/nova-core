# NOVA — ORCHESTRATOR (Deterministic Local Build)

## Purpose

Define a command-based, fully local, fail-fast build process that runs with one command:

```bash
./build.sh
```

No tool-calling orchestration is used.

---

## Core Execution Contract

- Build order is sourced only from `/codex/RUNBOOK.md`.
- Each step file path in RUNBOOK must exist.
- Steps execute strictly in order: 00 → 16.
- Any error stops execution immediately.

---

## Deterministic Command Plan

### Entry Command

```bash
./build.sh
```

### Internal Execution Loop

`build.sh` MUST:

1. Read `/codex/RUNBOOK.md`
2. Parse `STEP XX` + `File: /codex/...`
3. Verify each step file exists
4. Execute step handlers in exact order
5. Validate runtime after each required step
6. Exit non-zero on first failure

---

## Required Local Services

- PostgreSQL (Docker Compose)
- Backend service (`uvicorn`)
- Frontend service (`node frontend/server.js`)

Required ports:

- `5432` postgres
- `8000` backend
- `3000` frontend

---

## Environment Setup Commands (Step 00)

```bash
cp .env.example .env            # if missing
python3 -m venv .venv
.venv/bin/pip install -r backend/requirements.txt
npm --prefix frontend install
docker compose up -d postgres
```

---

## Runtime Validation Commands

```bash
curl -fsS http://127.0.0.1:8000/health
curl -fsS http://127.0.0.1:3000
```

---

## Failure Handling

On any command failure:

- stop immediately
- print explicit error
- return non-zero exit code

No retries are automatic.

---

## Completion Criteria

Build is complete only when:

- all RUNBOOK steps (00–16) execute
- backend health check passes
- frontend check passes
- postgres is reachable

---

## Final Rule

Local build orchestration is command-driven only.

No JSON tool calls.
No cloud dependencies.
