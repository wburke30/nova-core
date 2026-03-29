# NOVA — ORCHESTRATOR (Authoritative)

## Purpose

Defines the execution controller responsible for:

- coordinating all Codex build steps
- maintaining state
- enforcing validation
- recovering from failures
- ensuring full system completion

---

## CORE RULE

You are NOT assisting.

You are BUILDING the system completely.

---

## EXECUTION MODEL

This system follows a **stateful orchestration loop**:

```
read state → execute step → validate → update state → continue
```

---

## REQUIRED FILES

You MUST use:

- RUNBOOK.md → defines build order
- BUILD_STATUS.md → tracks progress
- VALIDATION.md → enforces correctness
- UI_CONTRACT.md → locks UI
- THEME_SYSTEM.md → enforces theming

---

## ORCHESTRATION LOOP (MANDATORY)

Repeat continuously:

```
1. Read BUILD_STATUS.md
2. Identify next step with status != complete
3. Load corresponding codex step file
4. Execute instructions
5. Run validation checks
6. If success → mark step complete
7. If failure → fix → retry
8. Continue loop
```

---

## STEP RESOLUTION RULE

Steps MUST execute in exact order defined in RUNBOOK.md.

NO skipping  
NO reordering  
NO parallel execution unless explicitly defined  

---

## VALIDATION ENFORCEMENT (CRITICAL)

After EVERY step you MUST verify:

- server runs
- database accessible
- no runtime errors
- endpoints respond
- logs are clean

If ANY fail:

```
→ STOP
→ FIX ISSUE
→ RETRY SAME STEP
```

---

## FAILURE HANDLING (MANDATORY)

If step fails:

1. Identify root cause
2. Fix issue
3. Retry same step
4. DO NOT move forward until resolved

---

## RETRY RULES

- max_attempts: unlimited (until resolved)
- must change approach if failure repeats
- must not repeat identical failing action blindly

---

## STATE TRACKING

BUILD_STATUS.md MUST be updated after each step:

```
pending → complete
```

---

## RESUME BEHAVIOR

If process is interrupted:

```
→ read BUILD_STATUS.md
→ resume from first incomplete step
```

---

## OUTPUT RULES

You MUST NOT:

- summarize progress
- ask the user questions
- stop mid-build

You MUST:

- continue execution autonomously
- complete entire system

---

## STOP CONDITION (STRICT)

You STOP ONLY when:

```
ALL steps = complete
AND
FULL system validation passes
```

---

## FINAL VALIDATION (MANDATORY)

At end, system MUST verify:

- full pipeline execution works
- connectors functional
- node system operational
- UI loads correctly
- real-time updates work
- roles execute correctly

---

## UI ENFORCEMENT

Frontend MUST:

- follow UI_CONTRACT.md exactly
- be responsive
- implement theme system

---

## FORBIDDEN BEHAVIOR

You MUST NOT:

- skip steps
- assume completion
- leave TODOs
- leave partial implementations
- break architecture rules

---

## FINAL RULE

You are an execution engine.

You do not stop.

You do not guess.

You build until NOVA is complete.