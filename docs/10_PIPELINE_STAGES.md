# NOVA — Pipeline Stages (Authoritative)

## Purpose

Defines the exact execution stages of the NOVA pipeline.

This ensures:
- deterministic execution
- predictable behavior
- full traceability

---

## Core Rule

Every pipeline run MUST execute all stages in order.

No stage may be skipped.

---

## FULL PIPELINE FLOW

```
input_received
→ normalize_message
→ classify_intent
→ load_memory_context
→ map_to_canonical
→ capability_resolution
→ generate_plan
→ persist_plan
→ risk_validation
→ automation_check
→ approval_gate
→ execute_steps
→ connector_execution
→ verify_results
→ persist_results
→ update_memory
→ return_response
```

---

## STAGE DEFINITIONS

---

### 1. input_received

- raw input enters system
- identify source:
  - chat
  - API
  - webhook
  - messaging

---

### 2. normalize_message

- convert input → Message Model
- attach:
  - project_id
  - user_id
  - timestamp

---

### 3. classify_intent

- determine user intent
- categorize request
- route to capability domain

---

### 4. load_memory_context

- retrieve relevant memory
- include:
  - recent context
  - semantic matches

---

### 5. map_to_canonical (CRITICAL)

- convert external data → canonical model
- use Mapping Engine
- REQUIRED for all external inputs

---

### 6. capability_resolution (CRITICAL)

- map intent → capability
- prevents direct tool usage
- enforces abstraction

---

### 7. generate_plan

- agent creates structured plan
- includes:
  - steps
  - dependencies
  - inputs

---

### 8. persist_plan

- store plan in database
- assign:
  - plan_version
  - task_id

---

### 9. risk_validation

- evaluate:
  - risk level
  - external impact
  - reversibility

---

### 10. automation_check

- check if:
  - automation is enabled
  - scope allows execution

---

### 11. approval_gate

IF approval required:

- create approval record
- pause execution

ELSE:

- continue

---

### 12. execute_steps

- convert plan → executable tasks
- queue tasks

---

### 13. connector_execution (CRITICAL)

- execute via connectors ONLY
- no direct API calls
- enforce:
  - rate limits
  - mapping
  - permissions

---

### 14. verify_results

- confirm success
- validate outputs
- check expected vs actual

---

### 15. persist_results

- store outputs in database
- update task status

---

### 16. update_memory

- store useful results
- update semantic memory

---

### 17. return_response

- generate user output
- include:
  - summary of actions
  - status
  - results

---

## PIPELINE LOGGING

Each stage MUST log:

```json
{
  "stage": "",
  "status": "success|failed",
  "input": {},
  "output": {},
  "timestamp": ""
}
```

---

## EXECUTION GUARANTEES

Pipeline MUST ensure:

- idempotency
- atomic execution
- deterministic results
- full audit trail

---

## FAILURE HANDLING

If ANY stage fails:

1. stop pipeline
2. log failure
3. trigger recovery system
4. mark pipeline_run as failed

---

## RECOVERY INTEGRATION

Pipeline must support:

- retry logic
- reconciliation engine
- self-healing loop

---

## SECURITY ENFORCEMENT

Pipeline MUST enforce:

- permissions
- policy rules
- approval requirements
- connector access

---

## FORBIDDEN BEHAVIOR

Pipeline MUST prevent:

- direct execution outside pipeline
- agent execution
- connector bypass
- skipping stages

---

## FINAL RULE

Pipeline defines ALL system behavior.

If pipeline is bypassed → system is invalid.