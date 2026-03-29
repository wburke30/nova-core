# NOVA — Generic API Connector (Authoritative)

## Purpose

Defines how NOVA supports ANY external API without requiring a prebuilt connector.

Enables:

- custom integrations
- future-proof architecture
- rapid onboarding of unknown systems

---

## Core Rule

No API should be unsupported.

If no connector exists → Generic API Connector MUST be used.

---

## Supported Capabilities

Generic API Connector MUST support:

- HTTP methods (GET, POST, PUT, PATCH, DELETE)
- headers and authentication
- request body handling
- response parsing
- error handling

---

## Request Structure

```json
{
  "endpoint": "string",
  "method": "GET|POST|PUT|PATCH|DELETE",
  "headers": {},
  "query_params": {},
  "body": {},
  "auth": {}
}
```

---

## Authentication Support

Connector MUST support:

- API keys
- Bearer tokens
- OAuth tokens
- Basic auth

---

## Response Structure

```json
{
  "status": "success|error",
  "status_code": 200,
  "data": {},
  "headers": {}
}
```

---

## Execution Flow

```
pipeline
→ capability
→ generic connector
→ HTTP request
→ response
→ mapping
→ pipeline
```

---

## Mapping Integration

Generic connector MUST:

- map response to canonical model
- validate data
- reject invalid responses

---

## Error Handling

Connector MUST:

- detect HTTP errors
- retry when safe
- return structured errors

---

## Rate Limiting

Connector MUST:

- respect API limits
- throttle requests
- apply backoff strategies

---

## Security Rules

Connector MUST:

- validate endpoints
- sanitize inputs
- prevent injection attacks
- protect credentials

---

## Validation

Requests MUST be validated:

- valid URL
- valid method
- valid schema

---

## Use Cases

---

### 1. Unknown API

User provides:

- endpoint
- auth
- payload

→ NOVA builds request dynamically

---

### 2. Rapid Integration

No custom connector needed.

---

### 3. Custom Systems

Internal APIs
Legacy systems

---

## Logging

All API calls MUST log:

```json
{
  "event": "api_call",
  "endpoint": "",
  "status": "",
  "timestamp": ""
}
```

---

## Failure Handling

If API fails:

- retry if safe
- log failure
- notify system if critical

---

## Limitations

Generic connector MUST:

- not assume schema
- require mapping configuration
- avoid unsafe execution

---

## Forbidden Behavior

System MUST NOT:

- bypass validation
- execute unsafe requests
- trust unknown responses blindly

---

## Final Rule

Generic API Connector ensures universal compatibility.

If an API exists → NOVA can connect to it.