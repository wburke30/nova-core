# NOVA — Data Retention Policy (Authoritative)

## Purpose

Defines how NOVA manages:

- data lifecycle
- retention periods
- deletion rules
- storage limits

Ensures:

- compliance
- system stability
- predictable storage behavior
- safe data management

---

## CORE RULE

All data MUST have a defined retention policy.

No data may exist indefinitely without rule.

---

## DATA CATEGORIES

---

### 1. Audit Logs

- system logs
- execution logs
- connector logs

Retention:

- default: 30–90 days
- configurable per project

---

### 2. Messages

- chat history
- inbound/outbound communication

Retention:

- configurable
- default: retained indefinitely unless specified

---

### 3. Artifacts

- generated files
- reports
- exports

Retention:

- permanent by default
- user-controlled deletion

---

### 4. Memory (AI Context)

- semantic memory
- long-term context

Retention:

- configurable
- may be pruned or summarized

---

### 5. Files / Storage

- uploaded files
- processed files

Retention:

- based on storage provider rules
- user-controlled

---

### 6. Snapshots / Backups

- system snapshots
- recovery points

Retention:

- configurable
- may include rolling window (e.g. last 10 snapshots)

---

## RETENTION STRUCTURE

```json
{
  "data_type": "logs|messages|artifacts|memory|files|snapshots",
  "retention_days": 90,
  "auto_delete": true,
  "archival": false
}
```

---

## RETENTION RULES

System MUST:

- enforce retention automatically
- allow per-project configuration
- allow override by admin

---

## DELETION RULES

Deletion MUST:

- be logged
- be irreversible unless backed up
- respect permissions

---

## ARCHIVAL SUPPORT

System MAY:

- archive old data
- move to cold storage
- allow retrieval if configured

---

## CLEANUP PROCESS

System MUST:

- run scheduled cleanup jobs
- delete expired data
- maintain system performance

---

## FAILURE HANDLING

If deletion fails:

- retry operation
- log error
- prevent partial deletion

---

## SECURITY RULES

Retention system MUST:

- respect permissions
- prevent unauthorized deletion
- protect sensitive data

---

## LOGGING

All retention actions MUST log:

```json
{
  "event": "data_retention_action",
  "data_type": "",
  "action": "deleted|archived",
  "timestamp": ""
}
```

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- delete data without rule
- retain sensitive data indefinitely
- bypass retention policy

---

## FINAL RULE

Data lifecycle MUST be controlled.

Unmanaged data = system risk.