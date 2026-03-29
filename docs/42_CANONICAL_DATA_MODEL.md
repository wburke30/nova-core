# NOVA — Canonical Data Model (Authoritative)

## Purpose

Defines the **universal data schema** used internally by NOVA.

ALL systems MUST map into this model.

Ensures:

- consistency across integrations
- clean system behavior
- no format conflicts
- predictable execution

---

## CORE RULE

NOVA operates ONLY on canonical data.

Raw external data MUST NEVER enter the pipeline.

---

## GLOBAL RULES

- ALL IDs MUST be UUID (v4)
- ALL timestamps MUST be UTC
- ALL enums MUST be strictly validated
- ALL relationships MUST be explicit
- NO implicit fields allowed

---

# ENTITY DEFINITIONS

---

## 1. Product

```json
{
  "product_id": "uuid",
  "name": "string",
  "sku": "string|null",
  "description": "string|null",
  "price": "decimal",
  "currency": "ISO4217",
  "status": "active|inactive",
  "metadata": {},
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

### REQUIRED
- product_id
- name
- price
- currency

---

## 2. InventoryItem

```json
{
  "inventory_item_id": "uuid",
  "product_id": "uuid",
  "location_id": "string",
  "on_hand": "integer",
  "available": "integer",
  "reserved": "integer",
  "reorder_point": "integer|null",
  "updated_at": "timestamp"
}
```

### RULES
- available = on_hand - reserved
- values MUST NOT be negative

---

## 3. Order

```json
{
  "order_id": "uuid",
  "customer_id": "uuid",
  "status": "pending|paid|fulfilled|cancelled",
  "currency": "ISO4217",
  "total": "decimal",
  "items": [],
  "source": "string",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

---

## 4. OrderItem

```json
{
  "order_item_id": "uuid",
  "order_id": "uuid",
  "product_id": "uuid",
  "quantity": "integer",
  "unit_price": "decimal"
}
```

---

## 5. Customer

```json
{
  "customer_id": "uuid",
  "email": "string",
  "name": "string|null",
  "metadata": {},
  "created_at": "timestamp"
}
```

---

## 6. Message

```json
{
  "message_id": "uuid",
  "project_id": "uuid",
  "user_id": "uuid",
  "channel": "chat|api|webhook|whatsapp|telegram|discord|email",
  "content": "string",
  "timestamp": "timestamp"
}
```

---

## 7. Event

```json
{
  "event_id": "uuid",
  "project_id": "uuid",
  "type": "string",
  "source": "string",
  "data": {},
  "timestamp": "timestamp"
}
```

---

# RELATIONSHIPS

| Entity | Relation |
|------|--------|
| Product → InventoryItem | 1:N |
| Order → OrderItem | 1:N |
| Customer → Order | 1:N |

---

# SOURCE OF TRUTH RULES

| Entity | Authority |
|--------|----------|
| orders | external system (marketplace/POS) |
| inventory | internal system |
| pricing | configurable |
| customer | configurable |

---

# MAPPING REQUIREMENTS

All external data MUST map:

| External | Canonical |
|----------|----------|
| ASIN | product_id |
| SKU | sku |
| OrderId | order_id |

---

# VALIDATION RULES

Reject data if:

- required fields missing
- invalid enum values
- invalid relationships
- incorrect data types

---

# EXTENSIBILITY

Entities MAY include:

```json
"metadata": {}
```

Used for:

- domain-specific fields
- integration-specific data

---

# VERSIONING

Model MUST:

- support version changes
- maintain backward compatibility
- provide migration paths

---

# CONFLICT HANDLING

If data conflicts:

1. determine source of truth  
2. trigger reconciliation  
3. resolve  

---

# STORAGE RULES

Canonical data MUST:

- be stored in database
- be accessible to pipeline
- be consistent across system

---

# SECURITY RULES

Data MUST:

- respect permissions
- be scoped per project
- not leak across contexts

---

# FORBIDDEN BEHAVIOR

System MUST NOT:

- process raw external data
- skip mapping stage
- mix incompatible formats

---

# FINAL RULE

Canonical data is the system language.

If data is not canonical → system is inconsistent.