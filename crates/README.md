
# Dawnset Crates Workspace Overview

The `crates/` directory contains the Rust workspace for **Dawnset**.  
It represents the implementation layer of the system, where each crate corresponds
to a major subsystem defined in the architecture documentation.

All crates are currently placeholders and will be populated during the  
**v0.2 (Core Implementation)** phase of the roadmap.

---

## 1. Workspace Structure

The workspace mirrors the modular architecture of Dawnset:

```text
crates/
│
├── core/
│   └── (runtime, session context, shared types, RUTL traits)
│
├── crypto/
│   └── (handshake primitives, key exchange, randomness)
│
├── discovery/
│   └── (DHT, DNS TXT fallback, metadata validation)
│
└── transports/
    └── (Amalgamated Protocols + source protocol components)
```

Each crate maps directly to a subsystem described in the architecture.

---

## 2. Purpose of Each Crate

### `core/`
Provides foundational runtime components and the  
**Rust Unified Transport Layer (RUTL)** abstraction:

- session context  
- shared data structures  
- common utilities  
- RUTL traits and capability interfaces  
- cross‑module integration points  

This crate acts as the central coordination layer between transports,
discovery, and routing.

---

### `crypto/`
Implements cryptographic operations used across Dawnset:

- handshake primitives  
- hybrid key exchange  
- encryption utilities  
- secure randomness  
- PQC‑ready extension points  

This crate ensures cryptographic consistency across all transport protocols.

---

### `discovery/`
Implements decentralized node discovery mechanisms:

- DNS TXT fallback  
- DHT‑based peer discovery  
- metadata validation  
- integrity checks  
- local caching  

This crate integrates with routing for node prioritization and scoring.

---

### `transports/`
Implements the transport layer for Dawnset, including:

- **Amalgamated Protocols** (ruxvv, ruxsv, ruxpv)  
- internal **source protocol components**  
  (REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS)

These protocols are consumed by the **Rust Unified Transport Layer (RUTL)**  
to provide a unified interface to the routing engine.

---

## 3. Development Phases

The workspace follows Dawnset’s architecture‑first roadmap:

### Phase 0 — v0.1 (Architecture Foundation)
- no Rust implementation  
- complete architectural documentation  
- finalize RUTL model  
- finalize Amalgamated Protocols  
- finalize routing & discovery models  
- finalize security model  
- prepare crate boundaries for v0.2  

***Status: [COMPLETED]***  

### Phase 1 — v0.2 (Core Implementation)
- initialize workspace Cargo.toml  
- implement core runtime  
- implement crypto primitives  
- implement DNS TXT + DHT discovery  
- implement RUTL abstraction  
- add Amalgamated Protocol placeholders  

### Phase 2 — v0.3 (Transport & Routing Integration)
- implement Amalgamated Protocol logic  
- integrate RUTL with routing  
- implement multi‑hop routing  

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

All crates are intentionally empty at this stage.  
This is by design:

- architecture first  
- documentation first  
- implementation later  
- clean separation of phases  

This ensures the codebase remains stable, modular, and aligned with the system design.

---

## 5. Contribution Notes

When implementation begins:

- each crate will receive its own README  
- modules will remain fully decoupled  
- testing will be integrated at the crate level  
- workspace will support reproducible builds  
- all crates will follow Rust best practices
