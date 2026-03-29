# NOVA — Connector Types (Authoritative)

## Purpose

Defines standardized categories of integrations supported by NOVA.

Ensures:

- consistent behavior across integrations
- reusable logic
- scalable system design

---

## Core Rule

Every connector MUST belong to a connector type.

Connector type defines behavior — not the specific provider.

---

## Connector Type Definition

A connector type is a category that defines:

- how data flows
- how actions execute
- what capabilities are supported

---

## Connector Type Structure

```json
{
  "type_id": "string",
  "name": "string",
  "supported_capabilities": [],
  "data_flow": "inbound|outbound|bidirectional"
}
```

---

## Supported Connector Types

---

### 1. Messaging

Handles real-time communication.

Examples:

- WhatsApp
- Telegram
- Discord
- Slack

---

### 2. Email

Handles email sending and automation.

Examples:

- SendGrid
- Mailchimp
- Constant Contact

---

### 3. Telecom

Handles SMS and voice communication.

Examples:

- Twilio

---

### 4. Commerce

Handles e-commerce platforms.

Examples:

- Shopify
- BigCommerce
- Magento

---

### 5. Marketplace

Handles marketplace platforms.

Examples:

- Amazon
- eBay
- Walmart

---

### 6. Storage

Handles file storage systems.

Examples:

- Google Drive
- Dropbox

---

### 7. Automation Platforms

Handles external workflow tools.

Examples:

- Zapier
- Make

---

### 8. Payments

Handles financial transactions.

Examples:

- Stripe
- Square

---

### 9. Generic API

Handles custom APIs.

Supports:

- REST APIs
- GraphQL
- webhook-based systems

---

## Behavior by Type

Each type MUST define:

---

### Data Flow

| Type | Flow |
|------|------|
| messaging | bidirectional |
| email | outbound |
| commerce | bidirectional |
| marketplace | bidirectional |
| storage | bidirectional |
| telecom | bidirectional |

---

### Execution Model

- messaging → event-driven
- email → request-driven
- commerce → sync-driven
- marketplace → async-driven

---

## Capability Mapping

Each type MUST define:

- supported capabilities
- allowed operations

---

## Example

Messaging type supports:

- SendMessage
- ReceiveMessage
- NotifyUser

---

## Validation Rules

Connectors MUST:

- match type definition
- support required capabilities
- follow data flow rules

---

## Extensibility

System MUST allow:

- adding new connector types
- extending existing types
- supporting future platforms

---

## Logging

All connector type usage MUST log:

```json
{
  "event": "connector_type_used",
  "type": "",
  "timestamp": ""
}
```

---

## Security Rules

Connector types MUST:

- enforce consistent security rules
- validate data per type
- restrict unsafe operations

---

## Forbidden Behavior

System MUST NOT:

- treat all connectors the same
- hardcode behavior per provider
- bypass type abstraction

---

## Final Rule

Connector types define system behavior patterns.

Providers implement those patterns.