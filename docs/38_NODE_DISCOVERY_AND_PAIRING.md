# NOVA — Node Discovery & Pairing (Authoritative)

## Purpose

Defines how NOVA discovers, pairs, and trusts external nodes.

Enables:

- zero/low-config node onboarding
- distributed execution
- secure expansion of system capacity

---

## Core Rule

No node may execute tasks until:

- it is discovered
- it is approved
- it is authenticated

---

## Discovery Methods

---

### 1. LAN Discovery (DEFAULT)

Nodes MUST support:

- mDNS / Bonjour
- local network scanning
- broadcast discovery

---

### 2. Manual Registration

User may:

- manually add node via IP/hostname
- provide credentials

---

### 3. Remote Pairing (Advanced)

- secure tunnel (VPN / SSH / Cloudflare tunnel)
- explicit approval required

---

## Discovery Flow

```
node boots
→ announces presence (LAN)
→ NOVA detects node
→ node appears in UI
→ user approves
→ node paired
```

---

## Node Announcement

Nodes MUST broadcast:

```json
{
  "node_id": "",
  "hostname": "",
  "capabilities": [],
  "version": ""
}
```

---

## Pairing Process

### Step 1 — Detection
- node appears in "Available Nodes"

---

### Step 2 — Approval
User MUST confirm:

- trust node
- allow integration

---

### Step 3 — Authentication

System MUST establish:

- secure key exchange
- identity verification

---

### Step 4 — Registration

Node added to:

- node registry
- database

---

## Node Identity

Each node MUST have:

- unique node_id
- secure credentials
- verified identity

---

## Trust Model

Nodes MUST be:

- explicitly trusted
- scoped per project/system
- revocable

---

## Capability Mapping

After pairing:

- node capabilities must be registered
- used for task routing

---

## UI Requirements

System MUST display:

- available nodes
- node status
- pairing requests

---

## Security Rules

Node pairing MUST:

- require approval
- use encryption
- prevent spoofing

---

## Revocation

User MUST be able to:

- remove node
- revoke access
- disable execution

---

## Failure Handling

If pairing fails:

- retry allowed
- log failure
- prevent partial registration

---

## Logging

All pairing events MUST log:

```json
{
  "event": "node_pairing",
  "node_id": "",
  "status": "approved|rejected",
  "timestamp": ""
}
```

---

## Forbidden Behavior

System MUST NOT:

- auto-trust nodes
- allow unauthenticated nodes
- expose nodes publicly without control

---

## Final Rule

Node pairing defines system expansion.

If pairing is insecure → system is compromised.