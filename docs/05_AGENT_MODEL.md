# NOVA — Agent Model (Authoritative)

## Purpose

Defines the role of agents within NOVA.

Agents are responsible for:
- reasoning
- planning
- decision support

Agents are NOT responsible for execution.

---

## Core Rule

Agents MUST NEVER execute actions.

Agents:
- DO NOT call tools
- DO NOT call connectors
- DO NOT write directly to database
- DO NOT trigger external systems

---

## Agent Responsibilities

Agents MAY:

- interpret user input
- analyze data
- generate execution plans
- suggest actions
- evaluate outcomes

---

## Agent Types

### 1. Planner Agent
- converts intent → plan
- outputs structured execution steps

---

### 2. Memory Agent
- retrieves relevant context
- summarizes prior data

---

### 3. Strategy Agent
- suggests optimizations
- recommends workflows or improvements

---

## Agent Output Structure

Agents MUST output structured data:

```json
{
  "plan": [
    {
      "step_id": "",
      "capability": "",
      "inputs": {}
    }
  ],
  "reasoning": "string",
  "confidence": 0.0
}
```

---

## Plan Requirements

Plans MUST:

- reference capabilities (NOT tools)
- be deterministic
- be ordered
- include dependencies

---

## Example Plan

```json
{
  "plan": [
    {
      "step_id": "1",
      "capability": "SendEmail",
      "inputs": {
        "to": "client@example.com",
        "subject": "Follow up"
      }
    }
  ]
}
```

---

## Capability Enforcement

Agents MUST:

- use capability names ONLY
- never reference:
  - APIs
  - endpoints
  - connector IDs

---

## Agent Limitations

Agents CANNOT:

- execute workflows
- modify system state
- bypass approval
- interact with external systems

---

## Pipeline Integration

Agents feed into:

```
Agent → Plan → Pipeline → Execution
```

---

## Validation Rules

Agent output MUST be rejected if:

- plan references tools directly
- plan references connectors
- plan is empty
- plan contains invalid capability

---

## Safety Integration

Agent output MUST pass:

- policy validation
- risk evaluation
- approval gating

---

## Failure Handling

If agent fails:

- pipeline retries with fallback model OR
- returns failure to user

---

## Model Routing

Agents may use:

- local LLM (default)
- cloud LLM (optional)

Selection must follow:
- cost constraints
- privacy rules
- runtime mode

---

## Transparency

System MUST be able to show:

- what agent decided
- why it decided
- confidence level

---

## Final Rule

Agents think. They never act.

If an agent executes → system design is broken.