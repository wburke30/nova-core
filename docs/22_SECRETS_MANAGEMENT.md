# NOVA — Secrets Management (Authoritative)

## Purpose

Defines how NOVA securely stores, retrieves, and uses sensitive data.

Includes:

- API keys
- OAuth tokens
- access credentials
- encryption keys

---

## Core Rule

Secrets MUST:

- never be exposed
- never be logged
- never be hardcoded
- only exist at runtime when needed

---

## Secret Types

### 1. API Keys
- static credentials
- used for connectors

---

### 2. OAuth Tokens
- short-lived access tokens
- refresh tokens

---

### 3. Internal Keys
- encryption keys
- signing keys

---

## Storage Requirements

Secrets MUST be:

- encrypted at rest
- stored outside main database where possible
- scoped per project + connector

---

## Secret Structure

```json
{
  "secret_id": "uuid",
  "project_id": "uuid",
  "type": "api_key|oauth|internal",
  "provider": "string",
  "encrypted_value": "string",
  "created_at": "timestamp"
}
```

---

## Encryption Requirements

- strong encryption (AES-256 or equivalent)
- key management separated from data
- no plaintext storage

---

## Runtime Access

Secrets MUST:

- be retrieved only at execution time
- be injected into environment temporarily
- be removed immediately after use

---

## Example Flow

```
pipeline → tool → request secret → inject → execute → destroy
```

---

## Logging Rules

Secrets MUST NOT appear in:

- logs
- error messages
- debug output

If needed:
→ mask values

---

## Connector Integration

Connectors MUST:

- request secrets via secure API
- not store secrets locally
- not expose secrets in payloads

---

## Rotation

System MUST support:

- secret rotation
- expiration handling
- refresh tokens

---

## Access Control

Secrets MUST:

- be accessible only to authorized roles
- be scoped per project
- require permission validation

---

## Failure Handling

If secret access fails:

- block execution
- log error
- notify system

---

## Backup Rules

Secrets MUST NOT be:

- included in backups in plaintext
- exported without encryption

---

## Forbidden Behavior

System MUST NOT:

- print secrets
- expose secrets via API
- cache secrets long-term in memory
- reuse secrets across projects

---

## Final Rule

Secrets are the most sensitive data in the system.

If secrets are exposed → system is compromised.