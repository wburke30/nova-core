# NOVA — Onboarding System (Authoritative)

## Purpose

Defines the onboarding process that transforms NOVA from:

→ empty system  
→ fully configured, usable platform

---

## Core Rule

NOVA MUST NOT allow execution until onboarding is complete.

---

## Goals

Onboarding must:

- be simple (non-technical users)
- produce a working system
- configure core components
- reduce setup friction
- establish trust

---

## Onboarding Flow (MANDATORY)

### Step 1 — Welcome

- introduce NOVA
- explain:
  - what it does
  - how it works (briefly)
- no technical jargon

---

### Step 2 — Create Admin User

- collect:
  - name
  - login credentials
- assign admin role

---

### Step 3 — Project Setup

User creates first project:

- project name
- optional description

This becomes:
→ primary working context

---

### Step 4 — Storage Selection

User selects where data is stored:

- local
- Google Drive
- Dropbox

System MUST:

- validate connection
- confirm path

---

### Step 5 — Integration Setup

User connects systems:

Examples:

- email (SendGrid / Gmail)
- messaging (WhatsApp / Telegram / Slack / Discord)
- commerce (Shopify / Amazon)

System MUST:

- test connection
- confirm success

---

### Step 6 — Role Presets (CRITICAL)

User selects one or more roles:

Examples:

- Executive Assistant
- Ecommerce Manager
- Social Media Manager

Each role activates:

- capabilities
- workflows
- connectors
- rules

---

### Step 7 — Approval & Safety Settings

User configures:

- approval requirements
- automation level
- risk tolerance

Defaults MUST be safe:

→ approvals required

---

### Step 8 — System Test (MANDATORY)

System must run test actions:

Examples:

- send test message
- list integrations
- create sample task

User must see:
→ system working

---

### Step 9 — Completion

System unlocks execution

User lands on:
→ Chat (home)

---

## Onboarding Data Structure

```json
{
  "onboarding_complete": true,
  "project_id": "",
  "roles_selected": [],
  "integrations_connected": [],
  "storage_config": {},
  "approval_settings": {}
}
```

---

## Rules

- onboarding must be resumable
- onboarding must be idempotent
- onboarding must not break system state

---

## UX Rules

- minimal steps
- clear explanations
- no overwhelming options
- progress indicator required

---

## Failure Handling

If onboarding step fails:

- retry allowed
- user must be notified
- system must not proceed

---

## Security

Onboarding MUST:

- validate integrations securely
- protect credentials
- enforce admin creation

---

## Final Rule

Onboarding must result in a usable system.

If user cannot use NOVA after onboarding → onboarding failed.