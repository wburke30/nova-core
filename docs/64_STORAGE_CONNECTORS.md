# NOVA — Storage Connectors (Authoritative)

## Purpose

Defines how NOVA integrates with external storage systems.

Enables:

- user-controlled data storage
- cloud storage integration
- flexible file management
- scalable data handling

---

## Core Rule

ALL external storage interactions MUST use storage connectors.

No direct file operations on external systems.

---

## Supported Storage Systems

System MUST support:

---

### 1. Local Storage

- server filesystem
- project directories

---

### 2. Cloud Storage

- Google Drive
- Dropbox

---

### 3. Future Support

- S3-compatible storage
- NAS systems
- enterprise storage

---

## Storage Connector Responsibilities

Each storage connector MUST:

1. authenticate with storage provider
2. read files
3. write files
4. list directories
5. handle permissions
6. manage errors

---

## Storage Connector Structure

```json
{
  "connector_id": "uuid",
  "type": "storage",
  "provider": "local|gdrive|dropbox",
  "config": {},
  "status": "connected|offline",
  "created_at": "timestamp"
}
```

---

## File Operations

ALL file operations MUST go through:

```
pipeline → tool → storage connector → storage system
```

---

## Supported Operations

- read file
- write file
- delete file
- list directory
- move file

---

## Storage Path Handling

Each project MUST define:

```json
{
  "storage_path": "string"
}
```

System MUST:

- respect defined path
- prevent path traversal
- isolate project directories

---

## Authentication

Storage connectors MUST support:

- OAuth (Google Drive, Dropbox)
- API keys (if applicable)

---

## Access Control

Storage MUST:

- enforce project isolation
- respect permissions
- restrict unauthorized access

---

## Sync Behavior

System MUST support:

- file sync
- conflict detection
- versioning

---

## Conflict Handling

If file conflict occurs:

- detect mismatch
- resolve via:
  - overwrite
  - rename
  - user decision

---

## Logging

All storage operations MUST log:

```json
{
  "event": "storage_action",
  "action": "",
  "path": "",
  "status": "",
  "timestamp": ""
}
```

---

## Failure Handling

If storage fails:

- retry if safe
- log failure
- notify system/user

---

## Security Rules

Storage MUST:

- encrypt sensitive data if needed
- validate file operations
- prevent unauthorized access

---

## Forbidden Behavior

System MUST NOT:

- bypass storage connectors
- write outside project scope
- expose storage paths

---

## Final Rule

Storage connectors enforce user control over data.

If storage is uncontrolled → system violates ownership.