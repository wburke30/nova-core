# NOVA — Pipeline Engine (Authoritative)

## Purpose

The Pipeline Engine is the **central execution controller** of NOVA.

It enforces:
- execution order
- safety validation
- system consistency
- integration control

---

## Core Rule

ALL actions MUST pass through the pipeline.

No exceptions.

---

## Pipeline Responsibilities

The pipeline is responsible for:

- processing all inputs
- orchestrating execution
- enforcing policy
- handling approvals
- coordinating tools and connectors
- logging all actions
- ensuring deterministic behavior

---

## Pipeline Run Structure

Each execution creates a `pipeline_run`:

```json
{
  "pipeline_run_id": "uuid",
  "project_id": "uuid",
  "user_id": "uuid",
  "status": "running|completed|failed",
  "current_stage": "",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

---

## FULL PIPELINE STAGES

### 1. input_received
- raw input enters system
- source identified (chat, API, webhook)

---

### 2. normalize_message
- convert input → standard message model
- attach project context

---

### 3. classify_intent
- determine user intent
- route to appropriate capability domain

---

### 4. load_memory_context
- retrieve relevant memory
- attach contextual data

---

### 5. map_to_canonical (NEW — CRITICAL)
- convert external data → canonical model
- uses Mapping Engine
- REQUIRED before execution

---

### 6. capability_resolution (NEW — CRITICAL)
- map intent → capability
- ensures abstraction from integrations
- prevents hardcoded logic

---

### 7. generate_plan
- agent creates execution plan
- includes steps, dependencies, risk

---

### 8. persist_plan
- store plan in database
- assign plan_version

---

### 9. risk_validation
- evaluate risk level
- determine approval requirement

---

### 10. automation_check
- check if auto-execution allowed
- validate automation scope

---

### 11. approval_gate
IF approval required:
- create approval record
- halt execution until approved

---

### 12. execute_steps
- convert plan → executable steps
- queue tasks

---

### 13. connector_execution (NEW — CRITICAL)
- all external actions routed through connectors
- NO direct API calls allowed
- respects rate limits + mapping

---

### 14. verify_results
- confirm execution success
- validate outputs

---

### 15. persist_results
- store results in DB
- update task status

---

### 16. update_memory
- store useful context
- update semantic memory

---

### 17. return_response
- generate user-facing output
- include action summary

---

## Pipeline Stage Logging

Each stage MUST log:

```json
{
  "stage": "",
  "status": "",
  "input": {},
  "output": {},
  "timestamp": ""
}
```

---

## Execution Guarantees

Pipeline MUST ensure:

- idempotency (no duplicate execution)
- atomic execution per stage
- deterministic outcomes
- audit traceability

---

## Failure Handling

If any stage fails:

1. stop pipeline
2. log failure
3. trigger recovery model
4. mark pipeline_run as failed

---

## Recovery Integration

Pipeline must integrate with:

- retry system
- reconciliation engine
- self-healing loop

---

## Security Enforcement

Pipeline MUST enforce:

- permissions
- policy rules
- approval requirements
- connector access control

---

## Forbidden Behavior

Pipeline MUST prevent:

- agent execution
- direct connector calls
- bypassing approval
- skipping stages

---

## Final Rule

The pipeline is the brain of execution.

If anything bypasses it → the system is invalid.