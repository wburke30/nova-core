# NOVA — Build Status (Authoritative)

## Purpose

Tracks progress of the NOVA build process.

Used by:

- ORCHESTRATOR.md
- RUNBOOK.md

Ensures:

- resumable builds
- deterministic execution
- no repeated work
- no skipped steps

---

## CORE RULE

This file is the ONLY source of truth for build progress.

---

## STATUS VALUES

Each step MUST have one of:

```
pending
in_progress
complete
failed
```

---

## STEP TRACKING (MANDATORY)

```
01_BOOTSTRAP: pending
02_DATABASE: pending
03_BACKEND_CORE: pending
04_PIPELINE_ENGINE: pending
05_POLICY_RUNTIME: pending
06_EXECUTION_ENGINE: pending
07_QUEUE_WORKERS: pending
08_EVENTS_WEBSOCKET: pending
09_API_LAYER: pending
10_INTEGRATIONS: pending
11_FRONTEND_SHELL: pending
12_FRONTEND_REALTIME: pending
13_SECURITY: pending
14_FINALIZE: pending
```

---

## STATE TRANSITIONS

Each step MUST follow:

```
pending → in_progress → complete
```

OR

```
in_progress → failed → retry → complete
```

---

## UPDATE RULES

After each step:

- mark current step as `complete`
- update next step to `in_progress`

---

## FAILURE RULE

If step fails:

- mark as `failed`
- DO NOT proceed to next step
- retry same step until resolved

---

## RESUME RULE

If build is interrupted:

```
1. read BUILD_STATUS.md
2. find first step NOT complete
3. resume from that step
```

---

## CONSISTENCY RULE

Only ONE step may be:

```
in_progress
```

at any time.

---

## VALIDATION RULE

A step may only be marked `complete` if:

- validation checks pass
- no runtime errors exist

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- skip steps
- mark step complete without validation
- run multiple steps simultaneously
- reset completed steps

---

## FINAL RULE

This file controls the build process.

If BUILD_STATUS is incorrect → orchestration fails.