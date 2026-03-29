# NOVA — Real-Time Architecture (Authoritative)

## Purpose

Defines how NOVA operates as a fully real-time, event-driven system.

Ensures:

- instant UI updates
- zero polling
- consistent system state
- scalable real-time behavior

---

## CORE RULE (NON-NEGOTIABLE)

ALL system state changes MUST emit events.

UI MUST update via WebSocket.

Polling for live updates is FORBIDDEN.

---

## SYSTEM MODEL

```
State Change
→ Event Emitted
→ Event Bus
→ WebSocket Server
→ Client UI Updates Instantly
```

---

## REAL-TIME PRINCIPLES

---

### 1. Event-Driven Architecture

System MUST be fully event-driven.

Every action produces an event.

---

### 2. Push-Based Updates

Server pushes updates.

Client MUST NOT poll.

---

### 3. Single Source of Truth

All events originate from:

→ database-backed state changes

---

### 4. Deterministic Updates

UI reflects actual system state — never inferred state.

---

## EVENT SYSTEM INTEGRATION

Events MUST be emitted for:

- pipeline lifecycle
- task lifecycle
- connector activity
- node status
- approvals
- notifications

---

## REQUIRED EVENT TYPES

```json
[
  "pipeline_started",
  "pipeline_stage_update",
  "pipeline_completed",
  "task_created",
  "task_updated",
  "task_failed",
  "approval_requested",
  "approval_resolved",
  "connector_event",
  "node_status_update",
  "notification"
]
```

---

## EVENT STRUCTURE

```json
{
  "event_id": "uuid",
  "event_type": "string",
  "project_id": "uuid",
  "payload": {},
  "timestamp": "UTC"
}
```

---

## EVENT BUS

System MUST include an event bus.

Responsibilities:

- distribute events
- ensure ordering (per entity)
- support async processing
- prevent event loss

---

## EVENT ORDERING RULE

Events MUST be processed in order per entity_id.

If out-of-order:

- queue until order restored
OR
- reject event

---

## WEBSOCKET SYSTEM

---

### Core Requirements

WebSocket MUST:

- maintain persistent connection
- be authenticated
- be project-scoped
- support reconnection

---

### Connection Flow

```
client connects
→ authenticate
→ subscribe to project
→ receive events
```

---

### Message Format

```json
{
  "event": "string",
  "project_id": "uuid",
  "payload": {}
}
```

---

## UI SUBSCRIPTION MODEL

UI MUST:

- subscribe to project events
- listen to WebSocket
- update state immediately

---

## UI EVENT HANDLING

Example:

```javascript
socket.on("task_updated", (data) => {
  updateTaskUI(data)
})
```

---

## REAL-TIME COMPONENTS

UI MUST update instantly:

- chat messages
- task status
- pipeline progress
- approvals
- notifications
- node status
- integration status

---

## STREAMING SUPPORT

System MUST support:

- streaming responses (chat)
- incremental updates
- partial results

---

## RECONNECTION LOGIC

If WebSocket disconnects:

1. reconnect automatically
2. re-authenticate
3. re-subscribe
4. fetch missed events (if needed)

---

## FALLBACK RULE

Polling MAY be used ONLY for:

- initial data load
- recovery sync

Polling MUST NOT be used for live updates.

---

## FAILURE HANDLING

If event fails:

- retry emission
- log failure
- ensure eventual consistency

---

## EVENT DELIVERY GUARANTEE

System MUST ensure:

- at-least-once delivery
- idempotent processing
- no silent event loss

---

## PERFORMANCE REQUIREMENTS

System MUST:

- handle high event volume
- maintain low latency (<100ms target)
- scale horizontally

---

## SECURITY RULES

WebSocket MUST:

- authenticate users
- validate project access
- prevent cross-project leakage

Events MUST:

- be sanitized
- not expose secrets

---

## LOGGING

All real-time events MUST log:

```json
{
  "event": "realtime_event",
  "event_type": "",
  "status": "",
  "timestamp": ""
}
```

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- use polling for live updates
- fake real-time with timers
- emit events without state change
- skip event emission

---

## FINAL RULE

NOVA is a real-time system.

If updates are not instant → system is incorrect.