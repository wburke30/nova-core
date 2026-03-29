# NOVA — Event System (Authoritative)

## Purpose

Defines how NOVA processes all system triggers and external signals.

The Event System enables:

- real-time automation
- integration with external systems
- decoupled architecture
- scalable workflows

---

## Core Rule

ALL actions MUST originate from an event.

No direct execution without event trigger.

---

## Event Flow

```
event → event_bus → pipeline → execution → result
```

---

## Event Structure

```json
{
  "event_id": "uuid",
  "project_id": "uuid",
  "type": "string",
  "source": "string",
  "data": {},
  "timestamp": "datetime"
}
```

---

## Field Definitions

### event_id
- unique identifier
- required for idempotency

---

### type
Defines event category:

Examples:
- message.received
- order.created
- inventory.updated
- webhook.received

---

### source
Origin of event:

- chat
- API
- webhook
- connector
- system

---

### data
Payload specific to event

---

## Event Categories

---

### 1. User Events

- chat messages
- commands
- manual triggers

---

### 2. System Events

- task completed
- error occurred
- pipeline stage change

---

### 3. Connector Events

- webhook received
- API response
- integration update

---

### 4. Commerce / POS Events

- order created
- inventory changed
- product updated

---

### 5. Marketplace Events

- Amazon order
- fulfillment update
- pricing change

---

## Event Bus

Events MUST be routed through:

- centralized event bus
- asynchronous processing

---

## Event Handling

Each event MUST:

1. be validated
2. be normalized
3. trigger pipeline

---

## Idempotency

Events MUST:

- not execute twice
- use event_id to prevent duplication

---

## Event Processing Flow

```
receive event
→ validate
→ normalize
→ enqueue
→ pipeline execution
```

---

## Real-Time Requirements

System MUST support:

- real-time event ingestion
- asynchronous processing
- scalable event handling

---

## Failure Handling

If event fails:

- retry if safe
- log failure
- trigger reconciliation if needed

---

## Logging

All events MUST be logged:

- event creation
- processing status
- execution results

---

## Security Rules

Events MUST:

- be authenticated
- be validated
- not trust external payload blindly

---

## Integration Requirements

External systems MUST:

- send events via webhook OR
- be polled and converted into events

---

## Final Rule

Events drive the system.

Without events → nothing happens.