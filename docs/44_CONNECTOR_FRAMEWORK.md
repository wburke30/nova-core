# NOVA — Connector Framework (Authoritative)

## Purpose

Defines the strict, enforceable contract for ALL external integrations.

Ensures:

- consistent behavior
- secure execution
- scalable integrations
- zero ambiguity

---

## CORE RULE

ALL external interactions MUST go through connectors.

NO direct API calls allowed — EVER.

---

## CONNECTOR MODEL

A connector is the ONLY interface between NOVA and external systems.

---

## CONNECTOR MANIFEST (MANDATORY)

Every connector MUST define:

```json
{
  "connector_id": "uuid",
  "type": "string",
  "provider": "string",
  "auth_type": "api_key|oauth|basic",
  "supports_webhooks": true,
  "supports_polling": true,
  "rate_limit": {
    "max_requests": 100,
    "window_seconds": 60
  },
  "retry_policy": {
    "max_attempts": 3,
    "backoff": "exponential"
  },
  "status": "connected|degraded|offline",
  "version": "string"
}
```

---

## REQUIRED INTERFACE

All connectors MUST implement:

---

### connect()

- authenticate
- validate credentials
- test connection

---

### disconnect()

- revoke credentials if needed
- terminate connection

---

### ingest()

- receive external data
- convert to event format

---

### execute()

- perform action on external system
- MUST validate all rules before execution

---

### map_to_canonical()

- external → canonical conversion

---

### map_from_canonical()

- canonical → external conversion

---

### healthcheck()

- verify system availability
- update integration status

---

## EXECUTION ENFORCEMENT (CRITICAL)

Before ANY connector execution:

Connector MUST validate:

```
1. idempotency_key exists
2. permission check passed
3. policy decision allows action
4. rate limit not exceeded
```

IF ANY FAILS:

→ execution MUST STOP

---

## EXECUTION FLOW

```
pipeline
→ capability
→ connector.execute()
→ external system
→ response
→ pipeline
```

---

## WEBHOOK CONTRACT

```json
{
  "endpoint": "/webhook/{connector_id}",
  "method": "POST",
  "validation": "signature_required"
}
```

---

## POLLING CONTRACT

If no webhook:

- poll at defined interval
- detect changes
- generate events

---

## RATE LIMITING

Connector MUST:

- enforce provider limits
- queue excess requests
- delay execution safely

---

## RETRY RULES

Retries MUST:

- respect idempotency
- use exponential backoff
- not exceed max_attempts

---

## ERROR HANDLING

Connector MUST:

- classify errors
- retry safe failures
- escalate critical failures

---

## STATE MACHINE

Connector MUST follow:

```
created → configured → connected → active → degraded → offline
```

---

## AUTHENTICATION

Connector MUST support:

- API keys
- OAuth (with refresh tokens)
- secure storage

---

## SECURITY RULES

Connector MUST:

- isolate credentials per project
- sanitize all input/output
- prevent data leakage
- validate responses

---

## HEALTHCHECK RULES

Connector MUST:

- run periodic health checks
- update status in DB
- trigger alerts if degraded/offline

---

## LOGGING

All connector actions MUST log:

```json
{
  "event": "connector_execution",
  "connector_id": "",
  "action": "",
  "status": "",
  "timestamp": ""
}
```

---

## VERSIONING

Connectors MUST:

- support version upgrades
- maintain backward compatibility
- allow rollback

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- bypass connector layer
- execute direct API calls
- trust external data blindly
- skip validation

---

## FINAL RULE

Connectors are the ONLY gateway to external systems.

If connectors are bypassed → system loses control.