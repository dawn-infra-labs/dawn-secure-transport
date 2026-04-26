
# ⚡ Dawn-Secure-Transport (abbreviated as **Dawnset**)

**A modular, security‑focused, privacy‑preserving, and resilient transport and routing core implemented in Rust.**

> **Positioning**: **Dawnset** is ***not*** a VPN or a product.  
> **Dawnset** is infrastructure for the next generation of secure and privacy‑preserving communication systems.

## Architectural Perspective

**Dawnset** adopts a top‑down architectural perspective:  
**the system is defined first by its abstract principles, then by its engineered structures, and only afterward by the materials used to implement them.**

This perspective ensures that Dawnset’s form is determined by its top‑level design rather than by the constraints of existing protocols.  
It reflects a core belief: **architecture should originate from abstract semantics, not from available materials.**

- **Abstract Layer — RUTL**  
  Establishes unified transport semantics, boundaries, and invariants that define what transport *is*, independent of any specific protocol.

- **Engineered Layer — Amalgamated Protocols**  
  Provides structured, consistent transports designed to embody the abstract semantics defined by RUTL.

- **Material Layer — Source Protocols**  
  Supplies concrete protocols only after the abstract and engineered layers are fully established.

This perspective enables Dawnset to avoid design inertia, escape material‑driven limitations, and maintain long‑term flexibility and innovation.

For a full explanation of Dawnset’s architectural philosophy, see  
**`docs/design-decisions.md`**.

## **Dawnset** provides a reusable foundation for next‑generation secure communication systems.  
It is built around a clean architectural separation:

1. **Rust Unified Transport Layer (RUTL)** — the first core  
2. **Amalgamated Protocols (ruxvv, ruxsv, ruxpv)** — the second core  
3. **Source Protocols** — internal building blocks  
4. **Decentralized node discovery**  
5. **AI‑driven routing engine**

All components are released under the AGPLv3 license to maximize transparency and ecosystem sustainability.

---

# 🧩 1. Rust Unified Transport Layer (RUTL)

**RUTL is the architectural foundation of Dawnset.**  
It defines the unified abstraction that all transport protocols must implement.

RUTL provides:

- Unified connection lifecycle  
- Shared error and capability model  
- Consistent configuration interface  
- Extensible transport pipeline  
- Common handshake and routing boundaries  
- Integration point for AI‑driven routing and multi‑path concurrency  

RUTL is the **first core** of Dawnset.  
It is the layer that makes the entire transport subsystem coherent.

### **RUTL is not a closed system**

Although Dawnset ships with its own Amalgamated Protocols,  
RUTL is designed to support any transport protocol that provides a complete structure  
(handshake, encryption, session lifecycle, error semantics, framing).  
Such protocols can be implemented as RUTL‑compatible transports without modifying the core.

Full specification:  
**`architecture/rutl.md`**

---

# 🚀 2. Amalgamated Protocols (Second Core)

Dawnset implements three **Amalgamated Protocols**, each produced through the amalgamation of multiple source protocols into a cohesive transport design.

### **Ruxvv — Performance‑oriented Amalgamated Protocol**
Optimized for high‑efficiency routing across complex paths.

### **Ruxsv — Stealth‑oriented Amalgamated Protocol**
Optimized for concealment under restrictive connectivity conditions.

### **Ruxpv — Survival‑oriented Amalgamated Protocol**
Optimized for resilience in unreliable networks through packet‑based modulation.

These protocols are the **second core** of Dawnset and operate under RUTL.

---

# 🔧 3. Source Protocols (Internal Components)

Dawnset uses the following source protocols as internal building blocks:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  

The reference implementations of these source protocols are primarily written in **Go**.

These are not exposed directly to the routing engine.  
They are used exclusively during the **amalgamation process** to construct the Amalgamated Protocols.

---

# 🏗 4. Architecture Overview

Dawnset is organized into major subsystems:

### A. Rust Unified Transport Layer (RUTL)
The unified abstraction for all transport protocols.

### B. Transport Layer: Amalgamated Protocols
Implements ruxvv, ruxsv, ruxpv using source protocol components.

### C. Decentralized Node Discovery
DHT + DNS TXT fallback with node verification and scoring.

### D. AI‑Driven Routing Engine
Adaptive, multi‑hop, risk‑aware routing for challenging connectivity environments  
(restricted, unstable, filtered, or unreliable networks).

Detailed architecture documents:  
**`architecture/`**

---

# 📦 5. Crates Workspace

The Rust workspace is located in `crates/`:

- `core/` — RUTL, runtime, shared types  
- `crypto/` — handshake primitives, key management  
- `discovery/` — DHT + DNS TXT  
- `transports/` — Amalgamated Protocols + source protocol components  

Workspace overview:  
**`crates/README.md`**

---

# 📁 6. Repository Structure

```
dawnset/
│
├── .github/         — CI, issue templates, PR templates
├── architecture/    — RUTL, system architecture, data‑flow, threat models
├── crates/          — Rust workspace (core, crypto, discovery, transports)
├── docs/            — Additional technical notes and protocol references
├── examples/        — Integration examples
├── modules/         — Core subsystems wiring and higher‑level composition
├── roadmap/         — Milestones and long‑term planning
├── scripts/         — Development tooling and automation
├── tests/           — Integration tests and validation suites
│
├── .gitattributes
├── Cargo.toml
├── LICENSE
├── PROTOCOLS.md
└── README.md
```

---

# 🔒 7. Security & Threat Model

Dawnset is designed for environments involving:

- Traffic classification  
- Protocol fingerprinting  
- Selective throttling  
- Metadata inspection  
- Unreliable or filtered networks  

The architecture emphasizes:

- Transport agility  
- Minimal metadata exposure  
- Multi‑hop routing  
- Decentralized discovery  
- Adaptive modulation  

Security design:
**`architecture/security-design.md`**  

---

# 🚀 8. Roadmap

### Phase 1 — Core Architecture (v0.2)
- RUTL abstraction  
- Transport stubs  
- Basic discovery  
- Crypto primitives  

### Phase 2 — Distributed Node Network (v0.3)
- Multi‑source discovery  
- Node scoring  
- Remote policy delivery  

### Phase 3 — AI Routing Engine (v0.4)
- Multi‑hop routing  
- Adaptive fallback  
- Risk‑aware path selection  

### Phase 4 — Future Extensions (v1.0)
- PQC integration  
- Additional Amalgamated Protocols  

---

# 📜 License

AGPLv3 — ensuring openness and long‑term sustainability.

---

# 🤝 Contributing

Contributions are welcome.  
A `CONTRIBUTING.md` file will be added in a future update.

---

# 🌐 Why This Matters

Modern network control systems increasingly rely on:

- IP + SNI blocking  
- TLS fingerprinting  
- Active probing  
- Traffic classification  
- Protocol‑level heuristics  

Dawnset provides a flexible, modular, and future‑proof foundation for building systems that can adapt to evolving connectivity challenges.  
Its crate structure allows developers to integrate individual components — such as cryptographic primitives or discovery modules — without adopting the entire framework.
