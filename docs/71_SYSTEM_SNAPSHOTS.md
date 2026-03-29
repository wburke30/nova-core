# NOVA — System Snapshots (Authoritative)

## Purpose

Defines how NOVA captures and restores full system state.

Enables:

- rollback
- backup
- system cloning
- recovery

---

## CORE RULE

System MUST be snapshot-able at any time.

---

## SNAPSHOT DEFINITION

A snapshot includes:

- database state
- configuration
- connectors
- roles
- workflows

---

## SNAPSHOT STRUCTURE

```json
{
  "snapshot_id": "uuid",
  "project_id": "uuid",
  "created_at": "timestamp",
  "data": {}
}
```

---

## SNAPSHOT CONTENT

MUST include:

- all DB tables
- config values
- connector configs
- workflow definitions

---

## SNAPSHOT TYPES

---

### Manual Snapshot
- triggered by user

---

### Scheduled Snapshot
- automatic backup

---

### Pre-Change Snapshot
- before major changes

---

## SNAPSHOT FLOW

```
capture state
→ store snapshot
→ verify integrity
```

---

## RESTORE FLOW

```
select snapshot
→ validate
→ restore state
→ verify system
```

---

## RESTORE RULES

Restore MUST:

- fully replace state
- maintain consistency
- not leave partial data

---

## VERSIONING

Snapshots MUST:

- be versioned
- support rollback
- track changes

---

## SECURITY

Snapshots MUST:

- protect sensitive data
- require permissions
- not expose secrets

---

## FAILURE HANDLING

If snapshot fails:

- retry
- log error
- notify user

---

## LOGGING

All snapshot actions MUST log:

```json
{
  "event": "snapshot_action",
  "snapshot_id": "",
  "status": "",
  "timestamp": ""
}
```

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- create partial snapshots
- restore incomplete state
- overwrite without validation

---

## FINAL RULE

Snapshots protect system integrity.

Without snapshots → recovery is unsafe.