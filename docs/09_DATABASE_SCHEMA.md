# NOVA — Database Schema (Authoritative)

## Purpose

Defines all persistent data structures.

The database is:
- the single source of truth
- authoritative system state
- required for all execution

---

## DEPLOYMENT MODEL (LOCKED)

Single-tenant:

```
1 NOVA instance = 1 organization
```

NO multi-org support in same DB.

---

## GLOBAL RULES

- ALL records MUST include `project_id` where applicable
- ALL IDs MUST be UUID (v4)
- ALL timestamps MUST be UTC
- NO implicit relationships
- ALL writes MUST go through pipeline

---

# CORE TABLES

---

## users

```sql
users (
  user_id UUID PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  role TEXT CHECK (role IN ('viewer','operator','admin')),
  status TEXT CHECK (status IN ('active','inactive')) DEFAULT 'active',
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
```

---

## teams

```sql
teams (
  team_id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
```

---

## team_members

```sql
team_members (
  team_id UUID,
  user_id UUID,
  role TEXT,
  PRIMARY KEY (team_id, user_id)
);
```

---

## projects

```sql
projects (
  project_id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  owner_user_id UUID,
  storage_config JSONB,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
```

---

## project_users

```sql
project_users (
  user_id UUID,
  project_id UUID,
  role TEXT CHECK (role IN ('viewer','operator','admin')),
  PRIMARY KEY (user_id, project_id)
);
```

---

# PIPELINE

---

## pipeline_runs

```sql
pipeline_runs (
  pipeline_run_id UUID PRIMARY KEY,
  project_id UUID,
  status TEXT CHECK (status IN ('running','completed','failed','cancelled')),
  current_stage TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

---

## pipeline_stage_history

```sql
pipeline_stage_history (
  id UUID PRIMARY KEY,
  pipeline_run_id UUID,
  stage TEXT,
  status TEXT,
  input JSONB,
  output JSONB,
  timestamp TIMESTAMP
);
```

---

# TASK SYSTEM

---

## tasks

```sql
tasks (
  task_id UUID PRIMARY KEY,
  project_id UUID,
  plan_version INT,
  status TEXT CHECK (status IN ('queued','running','completed','failed','cancelled')),
  created_at TIMESTAMP
);
```

---

## steps

```sql
steps (
  step_id UUID PRIMARY KEY,
  task_id UUID,
  capability TEXT,
  status TEXT,
  attempt_count INT DEFAULT 0,
  created_at TIMESTAMP
);
```

---

# CANONICAL DATA

---

## products

```sql
products (
  product_id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  sku TEXT,
  price DECIMAL,
  currency TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

---

## inventory_items

```sql
inventory_items (
  inventory_item_id UUID PRIMARY KEY,
  product_id UUID,
  location_id TEXT,
  on_hand INT,
  available INT,
  reserved INT,
  updated_at TIMESTAMP
);
```

---

## orders

```sql
orders (
  order_id UUID PRIMARY KEY,
  customer_id UUID,
  status TEXT,
  total DECIMAL,
  currency TEXT,
  created_at TIMESTAMP
);
```

---

## customers

```sql
customers (
  customer_id UUID PRIMARY KEY,
  email TEXT,
  name TEXT,
  created_at TIMESTAMP
);
```

---

# CONNECTORS

---

## connectors

```sql
connectors (
  connector_id UUID PRIMARY KEY,
  type TEXT,
  provider TEXT,
  status TEXT,
  created_at TIMESTAMP
);
```

---

## connector_instances

```sql
connector_instances (
  instance_id UUID PRIMARY KEY,
  project_id UUID,
  connector_id UUID,
  config JSONB,
  status TEXT
);
```

---

# ROLE SYSTEM

---

## roles

```sql
roles (
  role_id UUID PRIMARY KEY,
  name TEXT,
  definition JSONB
);
```

---

## role_assignments

```sql
role_assignments (
  assignment_id UUID PRIMARY KEY,
  user_id UUID,
  project_id UUID,
  role_id UUID
);
```

---

# MAPPING

---

## id_mappings

```sql
id_mappings (
  mapping_id UUID PRIMARY KEY,
  source_system TEXT,
  external_id TEXT,
  canonical_id UUID,
  entity_type TEXT
);
```

---

# RECONCILIATION

---

## reconciliation_jobs

```sql
reconciliation_jobs (
  job_id UUID PRIMARY KEY,
  project_id UUID,
  status TEXT,
  created_at TIMESTAMP
);
```

---

## reconciliation_logs

```sql
reconciliation_logs (
  log_id UUID PRIMARY KEY,
  job_id UUID,
  details JSONB,
  timestamp TIMESTAMP
);
```

---

# QUEUE

---

## job_queue

```sql
job_queue (
  job_id UUID PRIMARY KEY,
  task_id UUID,
  status TEXT,
  attempt_count INT,
  created_at TIMESTAMP
);
```

---

# LOCKING

---

## locks

```sql
locks (
  lock_id UUID PRIMARY KEY,
  resource TEXT UNIQUE,
  owner TEXT,
  expires_at TIMESTAMP
);
```

---

# EVENTS

---

## events

```sql
events (
  event_id UUID PRIMARY KEY,
  project_id UUID,
  type TEXT,
  data JSONB,
  created_at TIMESTAMP
);
```

---

# FINAL RULE

The database defines reality.

If it is not in the database → it does not exist.