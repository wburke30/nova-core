# NOVA — Approval System (Authoritative)

## Purpose

Defines how NOVA handles **human-in-the-loop control** for actions that may:

- affect external systems
- cause irreversible changes
- incur cost
- introduce risk

---

## Core Rule

No high-risk or external action may execute without approval  
UNLESS explicitly authorized by policy.

---

## Approval Triggers

Approval is REQUIRED for:

### External Actions
- sending email
- writing to cloud storage (Google Drive, Dropbox)
- API calls to third-party systems
- device control

---

### Destructive Actions
- delete operations
- overwrite data
- unsubscribe/remove actions

---

### High Impact Changes
- bulk updates
- pricing changes
- inventory changes
- order modifications

---

### Cost-Impact Actions
- high LLM usage
- large API batch calls

---

## Approval Structure

```json
{
  "approval_id": "uuid",
  "task_id": "uuid",
  "pipeline_run_id": "uuid",
  "project_id": "uuid",
  "status": "pending|approved|rejected",
  "requested_by": "system",
  "approved_by": "user_id",
  "reason": "",
  "risk_level": "low|medium|high",
  "created_at": "timestamp",
  "resolved_at": "timestamp"
}
```

---

## Approval Flow

```
pipeline → risk_validation → approval_required
→ create approval record
→ pause execution
→ wait for user decision
→ resume or cancel
```

---

## UI Requirements

Approval UI MUST show:

- what action will occur
- why it is required
- risk level
- affected systems
- estimated impact

---

## Approval Actions

User may:

- approve
- reject
- request modification (future support)

---

## Automation Exceptions

Automation MAY bypass approval ONLY if:

- explicitly enabled by user
- within defined scope
- within policy limits

---

## Approval Expiration

Approvals MAY:

- expire after defined time
- require re-confirmation

---

## Logging

All approval events MUST be logged:

- creation
- decision
- execution outcome

---

## Failure Handling

If approval is:

- rejected → pipeline terminates
- expired → pipeline halts
- invalid → re-request approval

---

## Security Rules

Approval system MUST:

- verify user permissions
- prevent spoofing
- enforce role restrictions

---

## Final Rule

Approval is the last line of control.

If approval is bypassed → system is unsafe.