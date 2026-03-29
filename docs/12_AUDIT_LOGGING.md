# NOVA — Audit Logging (Authoritative)

## Purpose

Provides **complete traceability** of all system activity.

Audit logging enables:
- debugging
- accountability
- compliance
- system transparency

---

## Core Rule

Every action MUST be logged.

If something is not logged → it is considered not executed.

---

## What MUST Be Logged

### Pipeline Events
- pipeline run start/end
- stage transitions
- stage input/output

---

### Task Execution
- task creation
- execution start/stop
- success/failure

---

### Tool Execution
- tool invoked
- inputs/outputs
- execution result

---

### Connector Activity
- API calls
- external system responses
- rate limit events
- failures/retries

---

### Mapping Operations
- data transformations
- field mappings
- canonical conversions

---

### Reconciliation
- drift detection
- conflict resolution
- corrections applied

---

### Approval System
- approval requests
- approvals granted/rejected
- execution after approval

---

### User Actions
- commands issued
- settings changes
- integration updates

---

## Audit Log Structure

```json
{
  "log_id": "uuid",
  "project_id": "uuid",
  "user_id": "uuid",
  "pipeline_run_id": "uuid",
  "task_id": "uuid",
  "component": "pipeline|tool|connector|mapping|approval|system",
  "event_type": "",
  "status": "success|failed|pending",
  "details": {},
  "timestamp": "datetime"
}
```

---

## Field Definitions

### component
Identifies source of event:

- pipeline
- tool
- connector
- mapping
- approval
- system

---

### event_type
Examples:

- pipeline_stage_start
- task_created
- tool_executed
- connector_called
- approval_requested
- reconciliation_applied

---

### details
Flexible JSON object containing:

- inputs
- outputs
- error messages
- metadata

---

## Logging Rules

- ALL logs must include project_id
- ALL logs must include timestamp (UTC)
- logs must be immutable
- logs must be append-only

---

## Security Rules

Logs MUST NOT contain:

- secrets
- credentials
- sensitive tokens

Sensitive data must be:

- masked
- encrypted if required

---

## Retention Policy

Logs must support:

- configurable retention period
- archival
- export

---

## Observability Integration

Audit logs feed:

- analytics dashboard
- system monitoring
- debugging tools

---

## Failure Handling

If logging fails:

- system must retry logging
- system must not lose execution record
- fallback logging must occur

---

## Performance Considerations

Logging MUST:

- be asynchronous
- not block execution
- support batching

---

## Final Rule

Audit logging is mandatory.

If logs are incomplete → system cannot be trusted.