# NOVA — Time Model (Authoritative)

## Purpose

Defines how NOVA handles time across:

- system operations
- distributed nodes
- logs and events
- execution ordering

Ensures:

- consistency
- traceability
- correct sequencing

---

## Core Rule

ALL time MUST be stored and processed in UTC.

No exceptions.

---

## Time Format

System MUST use:

- ISO 8601 format
- UTC timezone

---

## Example

```json
{
  "timestamp": "2026-03-27T14:35:00Z"
}
```

---

## Time Sources

System MUST use:

### Primary
- system clock (synchronized)

---

### Secondary (optional)
- NTP (network time protocol)
- external time sources

---

## Synchronization

All nodes MUST:

- synchronize time
- maintain consistent clock

---

## Distributed Systems Rule

Time MUST be consistent across:

- nodes
- workers
- connectors

---

## Ordering Rules

Events MUST be ordered using:

- database timestamps
- NOT client-side timestamps

---

## Pipeline Integration

Pipeline MUST:

- record timestamps at each stage
- use UTC consistently

---

## Logging

All logs MUST include:

- timestamp (UTC)
- event ordering

---

## Scheduling

System MUST support:

- scheduled tasks
- cron-like execution
- timezone conversion for display only

---

## Timezone Handling

- store UTC
- convert to local timezone ONLY for UI display

---

## Failure Handling

If time drift detected:

- resync system clock
- log discrepancy
- adjust scheduling if needed

---

## Security Rules

System MUST:

- prevent time manipulation
- validate timestamps

---

## Forbidden Behavior

System MUST NOT:

- store local time
- rely on client time
- mix timezones in processing

---

## Final Rule

Time must be consistent across the system.

If time is inconsistent → system becomes unreliable.