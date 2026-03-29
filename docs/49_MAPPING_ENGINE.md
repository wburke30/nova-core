# NOVA — Mapping Engine (Authoritative)

## Purpose

Defines how NOVA translates data between:

- external systems
- internal canonical model

Ensures:

- consistency
- interoperability
- clean integration logic

---

## Core Rule

ALL external data MUST be mapped to the canonical model before processing.

No raw external data may enter the pipeline.

---

## Mapping Definition

Mapping is the process of:

```
external_data → canonical_data
canonical_data → external_data
```

---

## Mapping Structure

```json
{
  "mapping_id": "uuid",
  "source_system": "string",
  "entity_type": "string",
  "mapping_rules": {},
  "version": "string"
}
```

---

## Mapping Rules

Mapping MUST define:

- field-to-field relationships
- data transformations
- default values

---

## Example Mapping

### External (Shopify)

```json
{
  "variant_id": "123",
  "price": "10.00"
}
```

---

### Canonical

```json
{
  "product_id": "123",
  "price": 10.0
}
```

---

## Field Mapping Example

```json
{
  "variant_id": "product_id",
  "price": "price"
}
```

---

## Bidirectional Mapping

System MUST support:

- inbound mapping (external → canonical)
- outbound mapping (canonical → external)

---

## Mapping Responsibilities

Mapping Engine MUST:

- normalize data types
- enforce canonical structure
- resolve field differences

---

## Mapping Validation

Mapping MUST:

- validate schema
- reject invalid data
- ensure required fields present

---

## Adaptive Mapping (Advanced)

System MAY:

- suggest mappings based on patterns
- learn from repeated mappings

BUT:

- must require approval before applying

---

## Conflict Handling

If mapping conflict occurs:

- log issue
- reject mapping OR
- require manual resolution

---

## Versioning

Mappings MUST:

- support versioning
- allow updates
- maintain backward compatibility

---

## Storage

Mappings MUST be stored in:

- database
- scoped per project/integration

---

## Pipeline Integration

Mapping occurs at:

```
map_to_canonical stage
```

---

## Logging

All mapping actions MUST log:

```json
{
  "event": "mapping",
  "source": "",
  "entity": "",
  "status": "",
  "timestamp": ""
}
```

---

## Security Rules

Mapping MUST:

- sanitize input
- prevent injection
- validate data types

---

## Forbidden Behavior

System MUST NOT:

- bypass mapping engine
- assume field equivalence
- process raw external data

---

## Final Rule

Mapping enables system interoperability.

Without mapping → integrations fail.