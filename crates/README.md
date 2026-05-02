
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

The crates workspace follows Dawnset’s **architecture‑first 6+3 roadmap**.  
Only the implementation‑relevant phases are listed here.  
For the full roadmap, see:  
👉 `Roadmap/README.md`

---

### **Phase v0.1 — Architecture Foundation **

- No Rust implementation  
- Complete architectural documentation  
- Finalize RUTL abstract semantics  
- Finalize Amalgamated Protocols (ruxvv / ruxsv / ruxpv)  
- Finalize routing and discovery models  
- Finalize security model  
- Define crate boundaries for v0.2  

**Status: COMPLETED**

---

### **Phase v0.2 — Core Runtime & RUTL Implementation (Month 3)**

This phase corresponds to **Month 1–3** of the 6‑month core development cycle.

- Initialize workspace `Cargo.toml`  
- Implement core runtime (event loop, scheduler, error semantics)  
- Implement RUTL trait v1 (stable interface)  
- Implement foundational crypto primitives  
- Implement DNS TXT parsing + basic DHT  
- Add Amalgamated Protocol placeholders  
- Establish memory‑safety invariants  

**Version: v0.2**

---

### **Phase v0.3 — Full Protocol Suite Integration (Month 6)**

This phase corresponds to **Month 4–6** of the core development cycle.

- Implement Amalgamated Protocol logic (ruxvv / ruxsv / ruxpv)  
- Integrate transports with RUTL  
- Implement multi‑hop routing + scoring + recovery  
- Implement DHT health metrics  
- Implement zero‑copy optimization  
- Extend validation utilities  

**Version: v0.3**

---

### **Phase v0.4 — Hardening & External Audit Fixes (Month 9)**

This phase corresponds to **Month 7–9** of the roadmap.

- System‑wide hardening  
- Routing randomization  
- Cryptographic parameter strengthening  
- Metadata minimization  
- Large‑scale simulation validation  
- External security audit  
- Audit fixes + Technical Specification v0.4  

**Version: v0.4**

---

### **Future Work — Post‑v0.4**

After the v0.4 stable infrastructure milestone:

- Begin development of **Dawn‑Secure‑Publish (Dawnsep)**  
  A content‑publication infrastructure built atop Dawnset.
  
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
