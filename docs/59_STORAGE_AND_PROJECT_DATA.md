# NOVA — Storage & Project Data (Authoritative)

## Purpose

Defines how NOVA stores:

- project data
- files
- outputs
- backups

Ensures:

- user control
- data ownership
- flexibility across environments

---

## Core Rule

The user MUST control where data is stored.

NOVA MUST NOT store data in hidden or unknown locations.

---

## Storage Types

---

### 1. System Storage

Used for:

- logs
- runtime state
- temporary execution data

---

### 2. Project Storage (CRITICAL)

Used for:

- user files
- outputs
- project data

---

### 3. Artifact Storage

Used for:

- generated content
- reports
- exports

---

### 4. Backup Storage

Used for:

- snapshots
- recovery data

---

## Supported Storage Providers

System MUST support:

- local filesystem
- Google Drive
- Dropbox

Future:

- S3
- NAS
- other cloud providers

---

## Project Storage Configuration

Each project MUST define:

```json
{
  "project_id": "",
  "storage": {
    "type": "local|gdrive|dropbox",
    "path": "string"
  }
}
```

---

## Examples

---

### Local

```
/srv/nova/projects/project1
```

---

### Google Drive

```
/Nova/ClientA/Project1
```

---

### Dropbox

```
/Apps/Nova/Project1
```

---

## Storage Rules

System MUST:

- respect selected storage location
- never override storage without user approval
- ensure correct read/write access

---

## File Operations

ALL file operations MUST:

- go through pipeline
- use tool system
- be logged

---

## Connector Integration

Storage MUST use connectors:

- Google Drive connector
- Dropbox connector

---

## Access Control

Storage MUST:

- respect permissions
- isolate data per project
- prevent cross-project access

---

## Data Ownership

User MUST:

- own all stored data
- control location
- control access

---

## Backup Rules

System MUST:

- support backups
- maintain last-known-good state
- allow restore

---

## Retention

System MUST support:

- retention policies
- automatic cleanup (if configured)

---

## Failure Handling

If storage fails:

- retry if possible
- log error
- notify user

---

## Security Rules

Storage MUST:

- protect sensitive data
- enforce access control
- prevent unauthorized access

---

## Forbidden Behavior

System MUST NOT:

- store data without user knowledge
- mix project storage
- expose storage paths improperly

---

## Final Rule

User owns their data.

NOVA manages it — but does not control it.