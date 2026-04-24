# Crates Workspace Overview

The `crates/` directory contains the Rust workspace for **Dawnset**.  
It represents the implementation layer of the system, where each crate corresponds to a major subsystem defined in the architecture documentation.

This directory currently includes the initial workspace structure created during early planning.  
The crates are placeholders and will be populated during the **v0.2 (Core Implementation)** phase of the roadmap.

---

## 1. Current Workspace Structure

The existing crates reflect the modular architecture of Dawnset:

```text
crates/
│
├── core/
│   └── (runtime, session context, shared types)
│
├── crypto/
│   └── (handshake primitives, key management, PQC integration)
│
├── discovery/
│   └── (DHT, DNS TXT fallback, node verification)
│
└── transports/
    └── (REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS, TUIC v5)
```

Each crate maps directly to a subsystem described in the architecture documents.

---

## 2. Purpose of Each Crate

### `core/`
Provides foundational runtime components:

- session context  
- shared data structures  
- common utilities  
- cross‑module interfaces  

This crate acts as the integration layer between transports, discovery, and routing.

---

### `crypto/`
Implements all cryptographic operations:

- handshake primitives  
- key exchange  
- encryption utilities  
- PQC‑ready algorithms (future)  
- secure randomness  

This crate ensures cryptographic consistency across all transports.

---

### `discovery/`
Implements decentralized node discovery:

- DNS TXT fallback  
- DHT‑based peer discovery  
- node verification  
- integrity checks  
- local caching  

This crate integrates directly with the AI Routing Engine for node prioritization.

---

### `transports/`
Implements all supported transport protocols:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  
- TUIC v5  

Each protocol will be implemented as a submodule within this crate, unified by the Transport Framework.

---

## 3. Development Phases

The crates will be populated in alignment with the roadmap:

### Phase 1 — v0.2 (Core Implementation)
- initialize workspace Cargo.toml  
- implement core runtime  
- implement crypto primitives  
- implement DNS TXT + DHT discovery  
- implement unified transport abstraction  

### Phase 2 — v0.3 (Multi‑Transport & Multi‑Hop)
- implement multiple transport protocols  
- integrate node prioritization  
- implement multi‑hop routing logic  

### Phase 3 — v0.4 (Advanced Resilience)
- adaptive modulation layers  
- encrypted DHT overlay  
- region‑aware routing  

### Phase 4 — v1.0 (Production‑Ready)
- PQC handshake primitives  
- reinforcement‑learning‑based routing  
- full test coverage and hardening  

---

## 4. Current Status

The crates are intentionally empty at this stage.  
This is by design:

- architecture first  
- documentation first  
- implementation later  
- clean separation of phases  

This approach ensures the codebase remains stable, modular, and aligned with the system design.

---

## 5. Contribution Notes

When implementation begins:

- each crate will receive its own README  
- all crates will follow Rust best practices  
- modules will remain fully decoupled  
- testing will be integrated at the crate level  
- workspace will support reproducible builds.
