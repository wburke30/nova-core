# NOVA — Message Model (Authoritative)

## Purpose

Defines the standardized structure for ALL incoming and internal messages.

This ensures:
- consistent processing
- predictable pipeline behavior
- multi-channel compatibility

---

## Core Rule

ALL inputs MUST be normalized into the Message Model  
BEFORE entering the pipeline.

No exceptions.

---

## Message Structure (FULL)

```json
{
  "message_id": "uuid",
  "project_id": "uuid",
  "user_id": "uuid",
  "channel": "chat|api|webhook|whatsapp|telegram|discord|email",
  "content": "string",
  "attachments": [],
  "metadata": {},
  "context": {},
  "timestamp": "datetime",
  "source": "string"
}
```

---

## Field Definitions

### message_id
- unique identifier
- UUID required
- used for idempotency

---

### project_id
- REQUIRED
- determines execution context
- maps to:
  - storage
  - integrations
  - rules
  - roles

---

### user_id
- identifies sender
- used for permissions + audit

---

### channel
Defines source of message:

| Value | Source |
|------|--------|
| chat | UI |
| api | REST API |
| webhook | external system |
| whatsapp | WhatsApp |
| telegram | Telegram |
| discord | Discord |
| email | Email systems |

---

### content
- main text payload
- REQUIRED unless attachment-only message

---

### attachments

Array of:

```json
{
  "type": "file|image|data",
  "uri": "string",
  "metadata": {}
}
```

---

### metadata
- raw source data
- channel-specific fields
- connector payloads

---

### context
- derived data
- conversation history
- inferred intent helpers

---

### timestamp
- MUST be UTC
- used for ordering + tracing

---

### source
- identifies origin system
- example:
  - "web_ui"
  - "twilio"
  - "shopify_webhook"

---

## Normalization Rules

All inputs MUST:

1. be converted to Message Model
2. include project_id
3. include user_id (or system user)
4. include timestamp
5. validate schema

---

## Validation Rules

Reject message if:

- missing project_id
- missing message_id
- content AND attachments are empty
- timestamp invalid

---

## Multi-Channel Handling

Adapters MUST convert external formats:

Example:

### WhatsApp Input
```json
{
  "from": "+123456",
  "body": "hello"
}
```

Converted to:

```json
{
  "channel": "whatsapp",
  "content": "hello"
}
```

---

## System Messages

Internal messages must also follow this model:

```json
{
  "channel": "system",
  "content": "task completed"
}
```

---

## Idempotency Integration

message_id MUST be used to:
- prevent duplicate processing
- safely retry messages

---

## Pipeline Integration

Message Model feeds:

```
Message → Pipeline → Execution
```

---

## Security Rules

- no raw external payload passes through
- must sanitize input
- must validate before processing

---

## Final Rule

All system interaction begins with a valid Message Model.

If message is invalid → system MUST reject it.