# NOVA — Cost & Rate Control (Authoritative)

## Purpose

Defines how NOVA manages:

- system usage costs
- API rate limits
- resource consumption

Ensures:

- predictable costs
- system stability
- fair usage across users/projects

---

## Core Rule

All usage MUST be tracked, limited, and controlled.

---

## Cost Sources

NOVA MUST track costs from:

---

### 1. LLM Usage

- tokens consumed
- model usage
- compute cost

---

### 2. External APIs

- connector calls
- marketplace APIs
- messaging APIs

---

### 3. Infrastructure

- CPU usage
- memory usage
- node execution time

---

## Cost Tracking Structure

```json
{
  "usage_id": "uuid",
  "project_id": "uuid",
  "type": "llm|api|compute",
  "amount": 0,
  "unit": "tokens|requests|seconds",
  "timestamp": "timestamp"
}
```

---

## Budgeting

System MUST support:

- per-project budgets
- per-user limits
- global limits

---

## Budget Structure

```json
{
  "project_id": "",
  "budget_limit": 1000,
  "current_usage": 450,
  "currency": "USD"
}
```

---

## Rate Limiting

System MUST enforce:

---

### 1. API Rate Limits

- per connector
- per provider
- per endpoint

---

### 2. User Rate Limits

- requests per minute
- tasks per minute

---

### 3. System Limits

- max concurrent executions
- max queue size

---

## Rate Limit Structure

```json
{
  "limit_type": "api|user|system",
  "max_requests": 100,
  "window_seconds": 60
}
```

---

## Enforcement

If limits exceeded:

- throttle requests
- delay execution
- reject if necessary

---

## Cost Policies

System MUST define:

- allowed usage
- restricted usage
- approval thresholds

---

## Approval Integration

High-cost actions MUST:

- require approval
- display estimated cost

---

## Example

```
generate 1000 emails
→ estimate cost
→ require approval
```

---

## Real-Time Monitoring

System MUST track:

- current usage
- projected cost
- rate limit status

---

## Alerts

System MUST alert when:

- budget exceeded
- rate limit near threshold
- abnormal usage detected

---

## Failure Handling

If limits exceeded:

- stop execution
- log event
- notify user

---

## Logging

All cost events MUST log:

```json
{
  "event": "cost_usage",
  "type": "",
  "amount": "",
  "timestamp": ""
}
```

---

## Security Rules

System MUST:

- prevent abuse
- protect against API flooding
- enforce fair usage

---

## Forbidden Behavior

System MUST NOT:

- allow unlimited usage
- ignore rate limits
- execute high-cost actions silently

---

## Final Rule

Cost and rate control protect system sustainability.

Without it → system becomes unstable and expensive.