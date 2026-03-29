# NOVA — Runtime Modes (Authoritative)

## Purpose

Defines how NOVA operates under different system modes.

Runtime modes modify:

- execution permissions
- automation behavior
- visibility
- system responses

---

## Core Rule

Runtime mode ALWAYS overrides:

- automation settings
- execution permissions
- default behavior

---

## Supported Modes

---

### 1. NORMAL (Default)

- full functionality enabled
- pipeline execution allowed
- approvals enforced as configured

---

### 2. OBSERVER MODE

Purpose:
→ view-only mode

Behavior:

- execution DISABLED
- planning allowed
- analysis allowed
- no actions performed

---

### 3. PRIVATE MODE

Purpose:
→ isolated session

Behavior:

- no execution
- no memory persistence
- no cross-project access
- no learning from session

Allowed:
- browsing
- analysis

---

### 4. SILENT MODE

Purpose:
→ stop interaction

Behavior:

- system does not respond
- no processing
- no listening

Exit:
- explicit user command

---

### 5. EMERGENCY STOP (CRITICAL)

Trigger phrase:
```
nova emergency stop
```

Behavior:

- stop ALL running tasks
- cancel pipeline runs
- disable execution
- exit private mode if active

---

## Mode Structure

```json
{
  "mode": "normal|observer|private|silent|emergency_stop",
  "execution_enabled": true,
  "memory_enabled": true,
  "automation_enabled": true,
  "external_access": true
}
```

---

## Mode Overrides

| Mode | Execution | Memory | Automation | External |
|------|----------|--------|------------|----------|
| normal | ✅ | ✅ | ✅ | ✅ |
| observer | ❌ | ✅ | ❌ | ❌ |
| private | ❌ | ❌ | ❌ | ❌ |
| silent | ❌ | ❌ | ❌ | ❌ |
| emergency | ❌ | ❌ | ❌ | ❌ |

---

## Switching Modes

Mode changes MUST:

- require user confirmation (except emergency)
- be logged
- apply immediately

---

## Mode Persistence

- default: normal
- mode resets on restart (unless configured)

---

## Safety Rules

- emergency stop overrides ALL
- private mode blocks all data sharing
- observer mode prevents execution

---

## UI Requirements

System must clearly display:

- current mode
- restrictions applied

---

## Integration Behavior

In restricted modes:

- connectors disabled
- API calls blocked
- file writes blocked

---

## Failure Handling

If mode change fails:

- system must revert to previous mode
- log failure

---

## Final Rule

Runtime mode defines system behavior.

If ignored → system is unsafe.