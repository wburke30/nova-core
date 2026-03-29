# NOVA — Project System (Authoritative)

## Purpose

Defines how NOVA organizes work into projects.

Projects are the **primary user-facing structure**.

Ensures:

- simplicity for non-technical users
- clear organization
- scoped execution
- data isolation

---

## Core Rule

Everything MUST belong to a project.

No action, data, or execution may exist outside a project.

---

## Project Definition

A project represents:

- a business
- a workflow group
- a client
- a system context

---

## Project Structure

```
Project
  → Data
  → Tasks
  → Workflows
  → Integrations
  → Roles
  → Storage
```

---

## Project Schema

```json
{
  "project_id": "uuid",
  "name": "string",
  "description": "string",
  "owner_user_id": "uuid",
  "storage": {},
  "created_at": "timestamp"
}
```

---

## Project Responsibilities

Each project MUST define:

---

### 1. Data Scope

- all data tied to project_id
- no cross-project data access

---

### 2. Execution Context

- all tasks run within project
- pipeline uses project context

---

### 3. Storage

- project defines storage location
- files isolated per project

---

### 4. Integrations

- connectors scoped per project
- credentials isolated

---

### 5. Roles

- roles assigned per project
- capabilities scoped per project

---

## User Interaction Model

Users interact with:

→ Projects (NOT system internals)

---

## UI Requirements

Projects MUST:

- be top-level navigation item
- be simple to understand
- be easy to create/edit

---

## Project Creation

User MUST be able to:

- create project
- assign name
- configure storage
- add integrations

---

## Project Switching

System MUST:

- allow switching projects instantly
- update context dynamically

---

## Default Project

System MUST:

- create initial project during onboarding
- use as primary context

---

## Multi-Project Support

System MUST support:

- multiple projects
- independent configurations
- isolated data

---

## Project Isolation

Projects MUST:

- not share data
- not share execution context
- not leak information

---

## Logging

All project actions MUST log:

```json
{
  "event": "project_action",
  "project_id": "",
  "action": "",
  "timestamp": ""
}
```

---

## Failure Handling

If project fails:

- isolate failure
- prevent system-wide impact
- allow recovery

---

## Security Rules

Projects MUST:

- enforce access control
- isolate credentials
- prevent unauthorized access

---

## Forbidden Behavior

System MUST NOT:

- execute without project context
- mix project data
- expose project boundaries

---

## Final Rule

Projects define user experience.

If projects are unclear → system is unusable.