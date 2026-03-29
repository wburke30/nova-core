# NOVA — Global Agent Rules (Authoritative)

## PURPOSE

Defines global execution behavior for Codex and all agents.

This file enforces:

- deterministic system building
- zero ambiguity execution
- strict adherence to NOVA architecture

---

# CORE RULE

You are NOT assisting.

You are BUILDING the system.

---

# EXECUTION CONTROL

You MUST:

- follow `/codex/ORCHESTRATOR.md`
- follow `/codex/RUNBOOK.md` EXACTLY
- execute steps in strict order
- continue until ALL steps are complete

You MUST NOT:

- stop early
- skip steps
- reorder execution

---

# FILE SYSTEM CONTRACT (MANDATORY)

You MUST use the following structure:

```
/docs      → system specifications (READ ONLY)
/codex     → build instructions (EXECUTE THESE)
/backend   → backend code (CREATE HERE)
/frontend  → frontend code (CREATE HERE)
/infra     → infrastructure files
/docker    → container configuration
```

---

# FILE ACCESS RULES

You MUST:

- ALWAYS read system behavior from `/docs/`
- ALWAYS execute instructions from `/codex/`
- ALWAYS write code to `/backend/` or `/frontend/`

You MUST NOT:

- modify files in `/docs/`
- create code outside defined directories
- duplicate folder structures

---

# STEP EXECUTION RULE

When executing a step:

1. Read `/codex/BUILD_STATUS.md`
2. Identify next incomplete step
3. Load file from `/codex/{STEP_NAME}.md`
4. Execute instructions EXACTLY
5. Run validation
6. Update BUILD_STATUS
7. Continue

---

# VALIDATION RULE (CRITICAL)

If ANY validation fails:

→ STOP  
→ FIX  
→ RETRY SAME STEP  

You MUST NOT continue until validation passes.

---

# NO DRIFT RULE

You MUST NOT:

- invent architecture
- change system design
- simplify instructions
- add features not defined
- guess behavior

If unclear:

→ FOLLOW SPEC EXACTLY  
→ DO NOT GUESS  

---

# NO SHORTCUTS

You MUST NOT:

- leave TODO
- leave placeholder code
- partially implement features
- bypass pipeline rules
- skip validation

---

# SYSTEM ARCHITECTURE RULES

You MUST enforce:

- Pipeline controls ALL execution
- Agents NEVER execute
- Tools execute ONLY via pipeline
- Connectors handle ALL external calls
- Mapping layer is REQUIRED for external data
- Database is source of truth

---

# REAL-TIME SYSTEM RULE

System MUST be:

- fully event-driven
- WebSocket-based
- push-based updates ONLY

You MUST NOT:

- use polling for live updates
- use setInterval refresh loops
- simulate real-time behavior

---

# PERMISSION & SECURITY RULES

You MUST enforce:

- authentication on ALL requests
- permission checks on ALL actions
- DENY overrides ALLOW
- project-level isolation

You MUST NOT:

- allow unauthorized execution
- expose secrets
- bypass policy engine

---

# OUTPUT RULE

You MUST:

- execute instructions silently
- proceed step-by-step
- produce working system

You MUST NOT:

- summarize progress
- explain actions
- ask for confirmation
- pause execution

---

# FAILURE HANDLING

If ANY step fails:

1. Identify issue
2. Fix issue
3. Retry step
4. Re-validate

Repeat until successful.

---

# RESUME RULE

If execution is interrupted:

→ Read `/codex/BUILD_STATUS.md`  
→ Resume from first incomplete step  

---

# COMPLETION RULE

You STOP ONLY when:

- ALL steps = complete
- ALL validations = pass
- system is fully functional

---

# FINAL RULE

System correctness > speed

You build until NOVA is complete.

No assumptions.
No shortcuts.
No drift.