# NOVA — API Layer (Authoritative)

## Purpose

Defines how external clients interact with NOVA.

The API layer is:

- the ONLY external entry point
- strictly controlled
- non-executing (routes to pipeline)

---

## CORE RULE

The API MUST NEVER execute business logic.

ALL execution MUST go through:

```
API → Validation → Pipeline → Execution
```

---

## GLOBAL RULES

- ALL requests MUST include project_id
- ALL requests MUST be authenticated
- ALL requests MUST be validated
- ALL execution MUST pass through pipeline

---

# AUTHENTICATION

---

## Supported Methods

- API Key
- OAuth2
- Session Token (UI)

---

## Auth Structure

```json
{
  "Authorization": "Bearer <token>"
}
```

---

## Rules

- tokens MUST be validated
- tokens MUST map to user_id
- tokens MUST enforce project access

---

# AUTHORIZATION

---

Permissions MUST be enforced at:

- API level
- pipeline level

---

# STANDARD RESPONSE FORMAT

ALL responses MUST follow:

```json
{
  "success": true,
  "data": {},
  "error": null,
  "meta": {}
}
```

---

# ERROR FORMAT

```json
{
  "success": false,
  "error": {
    "code": "string",
    "message": "string"
  }
}
```

---

# PAGINATION

```json
{
  "page": 1,
  "limit": 20,
  "total": 100
}
```

---

# ENDPOINTS (MANDATORY)

---

## 1. POST /messages

Submit message to system.

### Request:

```json
{
  "project_id": "uuid",
  "content": "string"
}
```

### Behavior:

→ normalize → pipeline

---

## 2. GET /tasks

Returns tasks.

---

## 3. GET /pipeline/{id}

Returns pipeline execution.

---

## 4. POST /tasks/{id}/approve

Approve action.

---

## 5. POST /nodes/register

Register node.

---

## 6. POST /nodes/heartbeat

Node heartbeat.

---

## 7. GET /integrations

List integrations.

---

## 8. POST /integrations

Create integration.

---

## 9. GET /users

List users.

---

## 10. POST /users/invite

Invite user.

---

# WEBSOCKET API (MANDATORY)

---

## Purpose

Real-time updates.

---

## Events

- pipeline_update
- task_update
- log_event
- approval_request

---

## Rules

- MUST authenticate
- MUST subscribe per project
- MUST push updates instantly

---

# REQUEST FLOW

```
client request
→ authenticate
→ validate schema
→ check permissions
→ normalize
→ pipeline
→ response
```

---

# VALIDATION RULES

API MUST:

- validate schema
- reject invalid requests
- enforce required fields

---

# RATE LIMITING

API MUST enforce:

- per-user limits
- per-project limits
- per-endpoint limits

---

# LOGGING

ALL requests MUST log:

```json
{
  "event": "api_request",
  "endpoint": "",
  "status": "",
  "timestamp": ""
}
```

---

# SECURITY RULES

API MUST:

- sanitize input
- prevent injection
- not expose secrets
- enforce permissions

---

# FORBIDDEN BEHAVIOR

API MUST NOT:

- execute logic directly
- bypass pipeline
- modify DB directly

---

# FINAL RULE

API is a gateway.

It routes requests — it NEVER executes them.