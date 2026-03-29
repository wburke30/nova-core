# NOVA — Team & User Management (Authoritative)

## Purpose

Defines how NOVA manages:

- users
- teams
- organizations
- access control

Enables:

- multi-user environments
- team collaboration
- business-level deployment
- SaaS scalability

---

## Core Rule

NOVA MUST support multiple users and teams.

Single-user systems are NOT sufficient for production use.

---

## System Hierarchy

```
Organization (optional)
  → Teams
    → Users
      → Projects
```

---

## User Model

```json
{
  "user_id": "uuid",
  "name": "string",
  "email": "string",
  "role": "viewer|operator|admin",
  "created_at": "timestamp",
  "status": "active|inactive"
}
```

---

## Organization Model (Optional)

```json
{
  "org_id": "uuid",
  "name": "string",
  "owner_user_id": "uuid",
  "created_at": "timestamp"
}
```

---

## Team Model

```json
{
  "team_id": "uuid",
  "name": "string",
  "members": ["user_id"],
  "created_at": "timestamp"
}
```

---

## Project Access Model

```json
{
  "user_id": "",
  "project_id": "",
  "role": "viewer|operator|admin"
}
```

---

## Role Definitions

---

### Viewer
- read-only access
- cannot execute tasks

---

### Operator
- execute tasks
- limited external actions

---

### Admin
- full control
- manage users
- configure system

---

## Team Permissions

Teams MAY:

- share project access
- inherit permissions
- define group-level roles

---

## Access Control Rules

System MUST:

- enforce role-based permissions
- validate access at all layers
- restrict unauthorized actions

---

## User Lifecycle

---

### Create User

- via onboarding or admin
- assign role

---

### Invite User

- send invitation
- user accepts
- assign to project/team

---

### Remove User

- revoke access
- preserve audit logs

---

### Deactivate User

- disable access
- retain data

---

## Invitation System

System MUST support:

- email invitations
- role assignment on invite
- expiration of invites

---

## Role Assignment

Roles MUST be assignable:

- per user
- per project
- per team

---

## Permission Enforcement

Permissions MUST be enforced at:

- API layer
- pipeline
- tools
- connectors

---

## UI Requirements

System MUST include:

```
Settings → Users & Teams
```

User MUST be able to:

- view users
- manage roles
- manage teams
- assign project access

---

## Audit Logging

All user actions MUST log:

```json
{
  "event": "user_management",
  "user_id": "",
  "action": "",
  "timestamp": ""
}
```

---

## Security Rules

System MUST:

- validate identity
- enforce access control
- prevent privilege escalation

---

## Data Isolation

System MUST:

- isolate user data
- isolate project data
- prevent cross-user leakage

---

## Failure Handling

If user operation fails:

- log error
- prevent partial state
- allow retry

---

## Forbidden Behavior

System MUST NOT:

- allow access without assignment
- mix user data
- bypass permissions

---

## Final Rule

User and team management defines system scalability.

Without it → NOVA cannot operate in real-world environments.