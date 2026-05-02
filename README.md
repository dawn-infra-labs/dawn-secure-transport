# ⚡ Dawn-Secure-Transport (abbreviated as **Dawnset**)

**A modular, memory‑safe, and resilient transport‑layer infrastructure implemented in Rust.**

> **Positioning**: **Dawnset is not a VPN, not a product, and not a service.**  
> It is **core infrastructure** for next‑generation secure and privacy‑preserving communication systems.

---

# 🧭 Architectural Perspective

Dawnset adopts a top‑down architectural perspective:  
**the system is defined first by its abstract principles, then by its engineered structures, and only afterward by the materials used to implement them.**

This perspective ensures that Dawnset’s form is determined by its architecture rather than the constraints of existing protocols. Architecture originates from abstract semantics, not from available materials.

### **Abstract Layer — RUTL (Rust Unified Transport Layer)**  
Defines unified transport semantics, boundaries, and invariants that describe what transport is, independent of any specific protocol (**The First Core**).

### **Engineered Layer — Amalgamated Protocols**  
Provides structured, consistent transports (ruxvv, ruxsv, ruxpv) designed to embody the abstract semantics defined by RUTL (**The Second Core**).

### **Material Layer — Source Protocols**  
Supplies concrete protocols only after the abstract and engineered layers are fully established.

Full architectural philosophy: **`docs/design-decisions.md`**

---

# 🧩 1. Rust Unified Transport Layer (RUTL)

RUTL is the **architectural foundation** of Dawnset. It provides:

- **Unified connection lifecycle** and shared error/capability models  
- **Handshake and routing boundaries** to ensure structural consistency  
- Integration point for **multi-path concurrency** and the **AI-Driven Routing Engine**

### **RUTL is not a closed system**  
Any protocol providing a complete structure (handshake, encryption, framing) can be implemented as a RUTL‑compatible transport.

Full specification: **`architecture/rutl.md`**

---

# 🚀 2. Amalgamated Protocols (Second Core)

Dawnset implements three Amalgamated Protocols, each produced by the amalgamation of source protocols into a cohesive design:

- **Ruxvv — Performance‑oriented**  
  Optimized for high‑efficiency routing across complex paths.

- **Ruxsv — Stealth‑oriented**  
  Optimized for **stable flow characteristics and reduced metadata variability** under constrained connectivity conditions.

- **Ruxpv — Survival‑oriented**  
  Optimized for resilience in unreliable networks through packet‑based modulation.

---

# 🔧 3. Source Protocols (Internal Components)

Dawnset uses source protocols (e.g., **REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS**) as internal building components.  
These are used exclusively during the amalgamation process to construct the Amalgamated Protocols and are not exposed directly to the routing engine.

The **original community versions** of these source protocols are implemented in **Go**.

Detailed list: **`PROTOCOLS.md`**

---

# 🏗 4. Architecture Overview

- **RUTL** — Unified abstraction for all transport protocols  
- **Transport Layer** — Amalgamated Protocols (ruxvv, ruxsv, ruxpv)  
- **Decentralized Node Discovery** — DHT + DNS TXT fallback with node verification and scoring  
- **AI-Driven Routing Engine** — Multi-hop, context-aware path selection for constrained environments  

---

# 🔒 5. Security & System Conditions

Dawnset is designed to operate reliably across a wide range of network conditions, including:

- **Traffic pattern analysis**  
- **Protocol characteristic analysis**  
- **Endpoint availability constraints**  
- **Unsolicited protocol interaction**  
- **Variable throughput conditions**

The architecture emphasizes transport agility, minimal metadata exposure, and adaptive modulation.  
Design details: **`architecture/security-design.md`**

---

# 📦 6. Crates Workspace

The Rust workspace is located in **`crates/`**:

- `core/` — RUTL traits, runtime, and shared types  
- `crypto/` — Handshake primitives and key management  
- `discovery/` — DHT and DNS TXT discovery  
- `transports/` — Amalgamated Protocols + source protocol components  

---

# 📁 7. Repository Structure

```
dawnset/
│
├── .github/         — CI, issue templates, PR templates
├── architecture/    — RUTL, system architecture, data‑flow, security models
├── crates/          — Rust workspace (core, crypto, discovery, transports)
├── docs/            — Technical notes and protocol references
├── examples/        — Integration examples
├── roadmap/         — Full 6+3 roadmap and long‑term planning
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

# 🚀 8. Roadmap Summary (6+3 Engineering Model)

The full development plan is maintained in:  
👉 **`roadmap/README.md`**

- **Phase 1 (v0.2)** — RUTL semantics, state machine modeling, and core runtime  
- **Phase 2 (v0.3)** — Full Amalgamated Protocol suite reconstruction  
- **Phase 3 (v0.4)** — Hardening, external review, and technical specification  

---

# 🛠 Development & Quality Assurance

To maintain high engineering standards and project integrity, Dawnset includes a dedicated suite of automation scripts for developers and auditors.

### Environment Setup
Initializes the development environment and ensures all required security components (e.g., `cargo-audit`) are installed:
```bash
./scripts/setup-dev.sh
```

### Architectural Integrity
Validates the workspace structure and ensures all strategic documentation is present in the root directory:
```bash
./scripts/workspace-check.sh
```

### Security Auditing
Performs supply chain vulnerability scans and monitors for accidental credential exposure within the source tree:
```bash
./scripts/security-audit.sh
```

---

# 🌐 Why This Matters

Modern communication systems require adaptability, modularity, and long‑term resilience.  
Dawnset provides a **flexible, memory‑safe, and future‑proof foundation** for building systems that operate reliably across diverse connectivity conditions.

Its crate‑based structure allows developers to integrate individual components — such as cryptographic primitives or discovery modules — without adopting the entire framework.

---

# 📜 License

AGPLv3 — ensuring openness and ecosystem sustainability.
