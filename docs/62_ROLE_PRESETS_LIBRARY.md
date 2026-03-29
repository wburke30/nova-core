# NOVA — Role Presets Library (Authoritative)

## Purpose

Provides predefined role templates to accelerate onboarding and system setup.

Enables:

- fast system configuration
- non-technical usability
- guided role adoption

---

## Core Rule

Presets are OPTIONAL.

They MUST NOT limit system flexibility.

---

## Preset Definition

A preset is:

→ a pre-configured role

Includes:

- capabilities
- workflows
- connectors
- rules

---

## Preset Structure

```json
{
  "preset_id": "uuid",
  "name": "string",
  "description": "string",
  "role_definition": {},
  "category": "string",
  "version": "string"
}
```

---

## Preset Categories

---

### 1. Assistant / Secretary

- SendEmail
- ScheduleTask
- ManageReminders

---

### 2. Customer Support

- RespondToMessages
- CreateTickets
- ManageRequests

---

### 3. Ecommerce Manager

- UpdateInventory
- ProcessOrder
- SyncMarketplace

---

### 4. Marketing Manager

- CreateContent
- SchedulePosts
- ManageCampaigns

---

### 5. Operations Manager

- MonitorSystem
- AutomateTasks
- GenerateReports

---

### 6. Finance / Billing

- ProcessPayments
- TrackInvoices
- ManageSubscriptions

---

## Preset Usage

Presets MUST:

- be selectable during onboarding
- be editable after selection
- be combinable

---

## Multi-Preset Support

Users MUST be able to:

- select multiple presets
- merge functionality

---

## Customization

After selection, user MUST be able to:

- modify capabilities
- adjust workflows
- change connectors
- refine rules

---

## Preset Activation

Preset becomes active when:

- applied to project/user
- validated by system

---

## Preset Evolution

System MAY:

- suggest better presets
- recommend additions
- optimize configurations

---

## UI Requirements

UI MUST:

- display presets clearly
- describe what each does
- allow easy selection

---

## Logging

Preset actions MUST log:

```json
{
  "event": "preset_applied",
  "preset_id": "",
  "timestamp": ""
}
```

---

## Security Rules

Presets MUST:

- respect permissions
- not bypass approvals
- not auto-enable unsafe actions

---

## Forbidden Behavior

System MUST NOT:

- force preset usage
- lock user into preset
- prevent customization

---

## Final Rule

Presets accelerate setup.

They must never limit system capability.