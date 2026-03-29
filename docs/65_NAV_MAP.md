# NOVA — Navigation Map (Authoritative)

## Purpose

Defines the primary navigation structure of NOVA.

Ensures:

- simplicity for non-technical users
- consistent UX
- scalable interface
- multi-user support

---

## Core Rule

Navigation MUST be simple, consistent, and predictable.

User MUST understand system without training.

---

## PRIMARY NAVIGATION (LEFT SIDEBAR)

Order is FIXED:

```
1. Chat
2. Projects
3. Tasks
4. Workflows
5. Approvals
6. Integrations
7. Analytics
8. Settings
```

---

## CORE PRINCIPLES

---

### Chat is Primary (CRITICAL)

Chat MUST:

- be default landing page
- act as main interface
- handle majority of interactions

---

### Projects Define Context

Everything user does is within a project.

User MUST NOT think about:

- pipeline
- agents
- system internals

---

### Simplicity

Navigation MUST:

- avoid technical terms
- be intuitive
- minimize options

---

## NAVIGATION ITEM DEFINITIONS

---

### 1. Chat

- main interaction interface
- natural language control
- shows recent activity
- displays real-time updates

---

### 2. Projects

- list all projects
- create/manage projects
- switch active project

---

### 3. Tasks

- active/completed tasks
- execution status
- logs and results

---

### 4. Workflows

- automation builder
- workflow management
- triggers and conditions

---

### 5. Approvals

- pending approvals
- decision interface
- approval history

---

### 6. Integrations

- connected systems
- add/manage connectors
- status monitoring

---

### 7. Analytics

- system usage
- performance metrics
- cost tracking

---

### 8. Settings

Contains system configuration sections:

```
Settings
  → Profile
  → Projects
  → Integrations
  → Users & Teams   ← (NEW — CRITICAL)
  → Roles
  → Storage
  → Automation
  → Theme
```

---

## USERS & TEAMS (NEW SECTION)

Inside Settings:

Users & Teams MUST allow:

- invite users
- assign roles
- manage team access
- control project permissions

---

## SECONDARY NAVIGATION (INSIDE PROJECT)

```
Overview
Tasks
Workflows
Data
Integrations
Logs
```

---

## RESPONSIVE BEHAVIOR

---

### Desktop

- sidebar fixed
- main content panel

---

### Tablet

- collapsible sidebar
- expanded content

---

### Mobile

- sidebar becomes drawer
- chat full width
- simplified layout

---

## UI BEHAVIOR RULES

Navigation MUST:

- highlight active item
- persist state
- update instantly

---

## ACCESSIBILITY

Navigation MUST:

- support keyboard navigation
- be readable on all devices
- maintain contrast

---

## FORBIDDEN BEHAVIOR

System MUST NOT:

- reorder navigation dynamically
- expose system internals
- overwhelm user

---

## FINAL RULE

Navigation defines user experience.

If navigation is confusing → system fails.