# NOVA — Connector Import System (Authoritative)

## Purpose

Defines how NOVA dynamically creates connectors from:

- API specifications
- schemas
- user-provided definitions

Enables:

- rapid integration onboarding
- no-code connector creation
- scalable system expansion

---

## Core Rule

Adding a new integration MUST NOT require modifying core system code.

---

## Supported Import Methods

---

### 1. OpenAPI / Swagger Import (PRIMARY)

System MUST support:

- importing OpenAPI JSON/YAML
- parsing endpoints
- generating connector structure

---

### 2. Manual Schema Definition

User may define:

- endpoints
- methods
- request/response schema

---

### 3. Template-Based Import

Predefined templates for:

- REST APIs
- webhook-based systems
- CRUD services

---

## Import Flow

```
input API schema
→ validate schema
→ generate connector definition
→ map fields
→ register connector
→ test connection
→ activate
```

---

## Connector Generation

System MUST generate:

- connector structure
- endpoint definitions
- auth configuration
- mapping placeholders

---

## Generated Connector Structure

```json
{
  "connector_id": "",
  "type": "generic_api",
  "provider": "imported",
  "endpoints": [],
  "auth_config": {},
  "mapping_rules": {}
}
```

---

## Endpoint Definition

Each endpoint MUST include:

```json
{
  "path": "",
  "method": "",
  "request_schema": {},
  "response_schema": {}
}
```

---

## Mapping Integration

After import:

- user MUST map fields
- system MAY suggest mappings
- mapping MUST be validated

---

## Validation

Imported connector MUST:

- validate schema
- validate endpoints
- validate authentication

---

## Testing

Connector MUST support:

- test endpoint execution
- verify response
- confirm mapping

---

## Activation Rules

Connector becomes active ONLY if:

- successfully validated
- mapping complete
- authentication verified

---

## Error Handling

If import fails:

- reject connector
- provide error details
- allow retry

---

## Security Rules

Import system MUST:

- validate schema integrity
- prevent malicious definitions
- sanitize all inputs

---

## Versioning

Imported connectors MUST:

- be versioned
- support updates
- allow rollback

---

## Logging

All import actions MUST log:

```json
{
  "event": "connector_import",
  "status": "",
  "timestamp": ""
}
```

---

## Forbidden Behavior

System MUST NOT:

- auto-activate unverified connectors
- trust unknown schemas blindly
- bypass mapping stage

---

## Final Rule

Connector Import System enables rapid expansion.

If integration requires code changes → system is not scalable.