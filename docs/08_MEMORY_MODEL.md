# NOVA — Memory Model (Authoritative)

## Purpose

Defines how NOVA stores and retrieves contextual information to support reasoning and decision-making.

Memory improves:
- relevance
- continuity
- personalization

Memory MUST NOT override system truth.

---

## Core Rule

Memory supports reasoning.  
Database defines truth.

---

## Memory Types

### 1. Short-Term Memory
- session-based
- recent messages
- active context

---

### 2. Long-Term Memory
- persistent user/project data
- preferences
- history summaries

---

### 3. Semantic Memory (Vector)
- embeddings for similarity search
- used for contextual retrieval

---

### 4. System Memory
- internal state
- execution summaries
- logs (non-authoritative)

---

## Memory Structure

```json
{
  "memory_id": "uuid",
  "project_id": "uuid",
  "user_id": "uuid",
  "type": "short|long|semantic|system",
  "content": "string",
  "embedding": [],
  "metadata": {},
  "created_at": "timestamp"
}
```

---

## Memory Rules

- MUST be scoped per project
- MUST be scoped per user where applicable
- MUST be retrievable via query
- MUST NOT override canonical database data

---

## Memory Retrieval

Memory retrieval MUST:

- use semantic similarity (vector search)
- filter by project_id
- prioritize recent + relevant data

---

## Memory Write Conditions

Memory may be stored when:

- user explicitly saves information
- system identifies reusable knowledge
- execution produces meaningful results

---

## Memory Restrictions

Memory MUST NOT store:

- secrets
- credentials
- sensitive data without encryption
- raw connector payloads

---

## Conflict Handling

If memory conflicts with database:

→ database wins

---

## Memory vs Database

| Feature | Memory | Database |
|--------|--------|---------|
| truth source | ❌ | ✅ |
| contextual | ✅ | ❌ |
| query speed | fast | structured |
| persistence | optional | required |

---

## Pipeline Integration

Memory is used during:

```
load_memory_context stage
```

---

## Memory Update Flow

```
execution → result → memory_update stage → store memory
```

---

## Error Handling

If memory retrieval fails:

- pipeline continues
- system degrades gracefully

---

## Final Rule

Memory enhances intelligence.

It must NEVER corrupt truth.