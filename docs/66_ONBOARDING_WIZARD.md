# NOVA — Onboarding Wizard (Authoritative)

## Purpose

Defines the guided onboarding experience that transforms NOVA from:

→ empty system  
→ fully configured, usable platform

Ensures:

- fast setup
- non-technical usability
- immediate value
- correct system configuration

---

## Core Rule

User MUST be able to complete onboarding without technical knowledge.

System MUST NOT allow execution until onboarding is complete.

---

## Onboarding Goals

Onboarding MUST:

- be simple
- be guided
- be fast
- produce a working system
- avoid overwhelming the user

---

## Onboarding Flow (MANDATORY)

---

### Step 1 — Welcome

Display:

- what NOVA is
- what it can do
- what will happen next

Rules:

- no technical jargon
- keep concise

---

### Step 2 — Create Admin User

User MUST:

- create account
- set credentials

System MUST:

- assign admin role
- secure authentication

---

### Step 3 — Create First Project

User MUST:

- name project
- optionally describe it

System MUST:

- create project context
- set as active project

---

### Step 4 — Select Storage (CRITICAL)

User MUST choose:

- Local
- Google Drive
- Dropbox

System MUST:

- validate connection
- confirm access
- store configuration

---

### Step 5 — Connect Integrations

User MAY connect:

- email (SendGrid, SMTP)
- messaging (WhatsApp, Telegram, Slack, Discord)
- commerce (Shopify, Amazon)

System MUST:

- test connection
- confirm success
- log integration

---

### Step 6 — Select Role Presets (CRITICAL)

User selects one or more roles:

Examples:

- Executive Assistant
- Ecommerce Manager
- Social Media Manager
- Operations Manager

System MUST:

- activate capabilities
- apply workflows
- assign connectors
- configure rules

---

### Step 7 — Configure Users & Teams (NEW — CRITICAL)

User MAY:

- invite team members
- assign roles
- define permissions

System MUST:

- support skipping (optional)
- allow later configuration

---

### Step 8 — Automation & Safety Settings

User configures:

- approval requirements
- automation level
- risk tolerance

Default MUST be:

→ safe (approvals ON)

---

### Step 9 — System Test (MANDATORY)

System MUST:

- execute test task
- verify pipeline
- verify integrations
- confirm output

User MUST see:

→ system working

---

### Step 10 — Completion

System:

- marks onboarding complete
- unlocks execution
- redirects to Chat

---

## Onboarding State Structure

```json
{
  "onboarding_complete": true,
  "project_id": "",
  "roles_selected": [],
  "integrations_connected": [],
  "storage_config": {},
  "users_configured": false,
  "automation_settings": {}
}
```

---

## UX Requirements

Onboarding MUST:

- show progress steps
- allow navigation between steps
- allow retry on failure
- allow resume if interrupted

---

## Failure Handling

If step fails:

- show clear error
- allow retry
- do not proceed until resolved

---

## Security Rules

Onboarding MUST:

- validate integrations securely
- protect credentials
- enforce admin creation

---

## Skippable Sections

User MAY skip:

- integrations
- teams setup

BUT:

- must be configurable later

---

## Logging

All onboarding steps MUST log:

```json
{
  "event": "onboarding_step",
  "step": "",
  "status": "",
  "timestamp": ""
}
```

---

## Forbidden Behavior

System MUST NOT:

- overwhelm user
- require technical input
- allow partial configuration to break system

---

## Final Rule

Onboarding must result in a working system.

If user cannot use NOVA after onboarding → onboarding failed.