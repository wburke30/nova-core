# NOVA — Messaging Integrations (Authoritative)

## Purpose

Defines how NOVA integrates with communication platforms.

Messaging is a **primary input/output layer**, not just a feature.

---

## Core Rule

ALL messaging MUST:

- be normalized into Message Model
- pass through pipeline
- follow approval and policy rules

---

## Supported Channels (Minimum)

### Direct Messaging
- WhatsApp
- Telegram
- Discord
- Slack

---

### Email Systems
- SendGrid
- Mailchimp
- Constant Contact
- SMTP-compatible systems

---

### SMS / Telecom
- Twilio

---

## Message Flow

```
external_message
→ connector
→ normalization
→ pipeline
→ execution
→ response
→ connector
→ external_system
```

---

## Channel Requirements

Each channel MUST implement:

- authentication
- message ingestion
- message sending
- error handling
- retry logic

---

## Message Types

### Incoming

- user messages
- webhook triggers
- automated system events

---

### Outgoing

- replies
- notifications
- alerts
- automated responses

---

## Message Structure

All messages MUST map to:

```json
{
  "channel": "",
  "content": "",
  "user_id": "",
  "project_id": ""
}
```

---

## Connector Behavior

Messaging connectors MUST:

- convert platform payload → standard format
- handle platform-specific quirks
- enforce rate limits

---

## Real-Time Requirements

- MUST support real-time ingestion
- SHOULD use webhooks where available
- fallback to polling if necessary

---

## Approval Rules

Messages require approval if:

- external communication (default)
- automated sending enabled

---

## Automation Rules

Messages MAY be auto-sent if:

- explicitly configured
- within policy scope
- low risk

---

## Security Rules

Messaging MUST:

- validate sender identity
- prevent spoofing
- protect sensitive data

---

## Multi-Channel Consistency

System MUST ensure:

- same logic across all channels
- consistent responses
- unified behavior

---

## Failure Handling

If message fails:

- retry (if safe)
- log failure
- notify user if critical

---

## Examples

### Incoming WhatsApp

```
"hello"
→ pipeline
→ plan response
→ send reply
```

---

### Automated Email

```
trigger → generate email → approval → send
```

---

## Final Rule

Messaging is an interface layer.

All logic still belongs to the pipeline.