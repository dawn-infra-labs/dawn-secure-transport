# Crates Workspace Overview

The `crates/` directory contains the Rust workspace for Dawn Bridge Core.  
It represents the implementation layer of the project, where each crate corresponds to a major subsystem defined in the architecture and module documentation.

This directory already includes the initial crate structure created during early planning.  
The crates are currently placeholders and will be populated during the v0.2 (Core Implementation) phase of the roadmap.

---

## Current Workspace Structure

The existing crates reflect the modular architecture of Dawn Bridge Core:

```text
crates/
│
├── core/
│   └── (core runtime, session context, shared types)
│
├── crypto/
│   └── (handshake primitives, key management, PQC integration)
│
├── discovery/
│   └── (DHT, DNS TXT fallback, node verification)
│
└── transports/
    └── (xHTTP, XTLS, Reality, VLESS, Hysteria2, Trojan)
```

Each crate maps directly to a subsystem described in the architecture documents.

---

## Purpose of Each Crate

### `core/`
Provides the foundational runtime components:

- session context  
- shared data structures  
- common utilities  
- cross‑module interfaces  

This crate acts as the glue between transports, discovery, and routing.

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

This crate integrates directly with AI Routing for node prioritization.

---

### `transports/`
Implements all supported transport protocols:

- xHTTP  
- XTLS  
- Reality  
- VLESS  
- Hysteria2  
- Trojan  

Each protocol will be implemented as a submodule within this crate, unified by the Transport Framework.

---

## Development Phases

The crates will be populated in alignment with the roadmap:

### Phase 1 — v0.2 (Core Implementation)
- initialize workspace Cargo.toml  
- implement core runtime  
- implement crypto primitives  
- implement DNS TXT + DHT discovery  
- implement transport abstraction layer  

### Phase 2 — v0.3 (Multi‑Transport & Multi‑Hop)
- implement multiple transport protocols  
- integrate node prioritization  
- implement multi‑hop routing logic  

### Phase 3 — v0.4 (Advanced Resilience)
- adaptive obfuscation  
- encrypted DHT overlay  
- region‑aware routing  

### Phase 4 — v1.0 (Production‑Ready)
- PQC handshake primitives  
- reinforcement learning routing  
- full test coverage and hardening  

---

## Current Status

The crates are intentionally empty at this stage.  
This is by design:

- architecture first  
- documentation first  
- implementation later  
- clean separation of phases  

This approach ensures the codebase will be stable, modular, and aligned with the system design.

---

## Contribution Notes

When implementation begins:

- each crate will receive its own README  
- all crates will follow Rust best practices  
- modules will remain fully decoupled  
- testing will be integrated at the crate level  
- workspace will support reproducible builds
