# NOVA — Policy Engine (Authoritative)

## Purpose

The Policy Engine is the **central decision layer** that determines:

- whether an action is allowed
- whether approval is required
- whether execution should be blocked

---

## Core Rule

NO action may execute without passing through the Policy Engine.

---

## Responsibilities

The Policy Engine evaluates:

- risk level
- permissions
- automation settings
- runtime mode
- connector usage
- cost limits

---

## Evaluation Flow

```
Plan → Policy Engine → Decision → Pipeline continues or stops
```

---

## Policy Decision Output

```json
{
  "allowed": true,
  "requires_approval": false,
  "risk_level": "low|medium|high",
  "reason": ""
}
```

---

## Risk Levels

### Low
- internal actions
- safe operations

→ auto-execute allowed

---

### Medium
- external communication
- data updates

→ may require approval

---

### High
- destructive actions
- financial impact
- large-scale changes

→ approval REQUIRED

---

## Policy Inputs

Policy Engine evaluates based on:

- user role
- project configuration
- runtime mode
- connector type
- action type
- cost impact

---

## Policy Categories

---

### 1. Permission Policies

- role-based access
- user restrictions
- project-level permissions

---

### 2. Execution Policies

- allowed actions
- blocked actions
- restricted actions

---

### 3. Integration Policies

- allowed connectors
- data access restrictions
- external system rules

---

### 4. Cost Policies

- LLM usage limits
- API rate limits
- budget thresholds

---

### 5. Safety Policies

- destructive action prevention
- approval enforcement
- rollback requirements

---

## Runtime Mode Interaction

Policy MUST enforce:

| Mode | Behavior |
|------|--------|
| normal | standard rules |
| observer | block execution |
| private | block external |
| silent | block all |
| emergency | stop all |

---

## Connector Enforcement

Policy MUST validate:

- connector permissions
- allowed endpoints
- rate limits

---

## Example Policy Decision

### Input:
- send email

### Output:
```json
{
  "allowed": true,
  "requires_approval": true,
  "risk_level": "medium"
}
```

---

## Failure Handling

If policy fails:

- block execution
- log error
- notify system

---

## Logging

All policy decisions MUST be logged:

- decision
- reason
- inputs

---

## Forbidden Behavior

Policy Engine MUST prevent:

- execution without validation
- bypassing approval
- unauthorized access

---

## Final Rule

Policy Engine is the gatekeeper.

If policy is bypassed → system is unsafe.