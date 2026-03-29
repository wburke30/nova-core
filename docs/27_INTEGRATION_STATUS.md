# NOVA — Integration Status (Authoritative)

## Purpose

Defines how NOVA tracks the health and state of all integrations.

Ensures:

- real-time awareness of external systems
- reliable execution
- automatic failure detection
- system trust

---

## Core Rule

No integration may be assumed healthy without verification.

---

## Integration Types

Applies to:

- messaging (WhatsApp, Telegram, Discord, Slack)
- email (SendGrid, Mailchimp, etc.)
- commerce (Shopify, BigCommerce, Magento)
- marketplace (Amazon, eBay)
- storage (Google Drive, Dropbox)
- custom APIs

---

## Status States

Each integration MUST have one of:

| Status | Meaning |
|-------|--------|
| connected | fully operational |
| degraded | partially functional |
| offline | not reachable |
| error | failing consistently |

---

## Status Structure

```json
{
  "integration_id": "uuid",
  "project_id": "uuid",
  "type": "string",
  "provider": "string",
  "status": "connected|degraded|offline|error",
  "last_success": "timestamp",
  "last_error": {},
  "updated_at": "timestamp"
}
```

---

## Health Checks

Integrations MUST be checked via:

- heartbeat (where supported)
- API test calls
- webhook activity

---

## Health Check Frequency

- active integrations: every 30–60 seconds
- idle integrations: every 5–10 minutes

---

## Failure Detection

System MUST detect:

- connection failures
- authentication failures
- API errors
- rate limit issues

---

## Failure Handling

If integration fails:

1. mark status accordingly
2. log error
3. retry (if safe)
4. notify system/user if critical

---

## Degraded Mode

Integration is degraded if:

- partial responses
- intermittent failures
- rate limiting

---

## Offline Mode

Integration is offline if:

- unreachable
- authentication invalid
- repeated failures

---

## Recovery

When integration recovers:

- update status → connected
- resume normal operation
- log recovery event

---

## Pipeline Behavior

If integration is:

### Connected
→ normal execution

### Degraded
→ limited execution

### Offline
→ block execution OR queue

---

## UI Requirements

System MUST display:

- integration status
- last activity
- error state

---

## Logging

All status changes MUST log:

```json
{
  "event": "integration_status_change",
  "integration_id": "",
  "old_status": "",
  "new_status": "",
  "timestamp": ""
}
```

---

## Security Rules

Status checks MUST:

- be authenticated
- not expose sensitive data

---

## Forbidden Behavior

System MUST NOT:

- assume integration is working
- ignore failures
- continue execution blindly

---

## Final Rule

Integration status determines execution reliability.

If status is unknown → system must not trust integration.