# NOVA — Build Status (Authoritative)

## Purpose

Tracks the exact state of the NOVA build process.

Used by:

- ORCHESTRATOR.md
- RUNBOOK.md

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

## STEP TRACKING (MANDATORY — LOCKED)

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
15_API_ROUTE_VALIDATION: pending
16_DOCS_VALIDATION: pending
```

---

## STATE TRANSITIONS

Each step MUST follow:

```
pending → in_progress → complete
```

OR (if failure):

```
in_progress → failed → retry → complete
```

---

## SINGLE ACTIVE STEP RULE

At ANY time:

- ONLY ONE step may be `in_progress`

---

## UPDATE RULES

After each step:

1. mark current step → complete
2. set next step → in_progress

---

## FAILURE RULE

If step fails:

- mark as `failed`
- DO NOT proceed
- retry same step

---

## RESUME RULE

If execution is interrupted:

```
read BUILD_STATUS.md
→ find first step NOT complete
→ resume from that step
```

---

## VALIDATION RULE

A step may ONLY be marked `complete` if:

- validation passes
- no runtime errors exist

---

## CONSISTENCY RULE

BUILD_STATUS MUST:

- match RUNBOOK step list exactly
- include ALL steps (01–16)
- contain NO extra steps

---

## FORBIDDEN BEHAVIOR

You MUST NOT:

- skip steps
- mark complete without validation
- run multiple steps simultaneously
- reset completed steps

---

## FINAL RULE

BUILD_STATUS controls execution.

If incorrect → system build fails.