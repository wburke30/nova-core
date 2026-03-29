# NOVA — Queue & Workers (Authoritative)

## Purpose

Defines how NOVA executes tasks asynchronously and at scale.

Enables:
- non-blocking execution
- distributed processing
- parallel workloads
- fault tolerance

---

## Core Rule

ALL execution MUST go through the queue system.

No direct execution allowed.

---

## Architecture

```
Pipeline → Job Queue → Worker → Tool → Result → Pipeline
```

---

## Queue System

The queue MUST:

- store pending tasks
- manage execution order
- support retries
- enforce concurrency limits

---

## Queue Structure

```json
{
  "job_id": "uuid",
  "task_id": "uuid",
  "project_id": "uuid",
  "status": "queued|running|completed|failed",
  "priority": "low|medium|high",
  "attempt_count": 0,
  "max_attempts": 3,
  "created_at": "timestamp"
}
```

---

## Worker System

Workers are responsible for:

- pulling jobs from queue
- executing tasks
- reporting results

---

## Worker Types

### 1. Local Worker
- runs on main system
- handles standard tasks

---

### 2. Node Worker (Distributed)

- runs on external nodes
- handles heavy or specialized tasks

---

### 3. Specialized Worker

- GPU processing
- data analysis
- high-load operations

---

## Worker Flow

```
worker polls queue
→ locks job
→ executes task
→ returns result
→ updates status
```

---

## Distributed Execution

Workers may run on:

- local machine
- Raspberry Pi nodes
- remote systems

---

## Node Routing

Jobs MUST be assigned based on:

- node capabilities
- current load
- task requirements

---

## Locking (CRITICAL)

Workers MUST:

- lock jobs before execution
- prevent duplicate execution

---

## Retry Logic

Retries MUST:

- be limited
- use exponential backoff
- respect idempotency

---

## Idempotency

Jobs MUST:

- produce same result on retry
- not duplicate actions

---

## Failure Handling

If worker fails:

- job returns to queue
- attempt_count increases
- retries if allowed

---

## Dead Letter Handling

If job exceeds retries:

- mark as failed
- log error
- notify system

---

## Concurrency Control

System MUST limit:

- max concurrent jobs
- per-node workload
- per-project workload

---

## Logging

Workers MUST log:

- execution start/end
- result
- errors
- retries

---

## Security Rules

Workers MUST:

- validate permissions
- run in isolated environments
- not access unauthorized data

---

## Performance Requirements

Workers MUST:

- be non-blocking
- scale horizontally
- support high throughput

---

## Final Rule

Queue controls execution.

Workers execute tasks.

Without queue → system is not scalable.