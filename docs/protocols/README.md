# Protocol Documentation (Revised)

This directory contains all protocol‑related documentation for Dawnset.  
It provides specifications for the **Rust Unified Transport Layer (RUTL)**, the **Rux Protocol Suite**, and the **Source Protocols** that serve as material implementations.

These documents are intended for contributors, auditors, and researchers working on transport behavior, protocol semantics, distributed discovery, and routing integration.

---

# 1. Rust Unified Transport Layer (RUTL)

The **Rust Unified Transport Layer (RUTL)** is the **First Core** of Dawnset.  
It defines the unified abstraction that all transports—engineered or material—must conform to.

RUTL provides:

- a unified handshake model  
- consistent encryption and key schedule handling  
- session lifecycle management  
- transport‑agnostic error semantics  
- a stable API surface for contributors and extensions  

```
RUTL
  ├── Handshake
  ├── Encryption
  ├── Session Management
  └── Error Handling
```

RUTL ensures:

- consistent behavior across all transports  
- shared correctness and security properties  
- simplified maintenance  
- clean separation between protocol logic and application logic  
- compatibility with adaptive routing and transport selection  

See **RUTL.md** for the full specification.

---

# 2. Rux Protocol Suite (Amalgamated Protocols)

The Rux Protocol Suite is the **Second Core** of Dawnset.  
These engineered transports implement Dawnset’s unified semantics through **protocol harmonization**.

### **ruxvv — Performance Edition**  
Optimized for throughput stability and low overhead under typical network conditions.

### **ruxsv — Stealth Edition**  
Engineered for stable flow characteristics and **reduced metadata variability**, ensuring consistent behavior across diverse network conditions.  

### **ruxpv — Survival Edition**  
A packet‑oriented engineered transport designed for **resilient operation in Challenging Connectivity Environments**.

Each protocol has its own dedicated document:

```
ruxvv.md
ruxsv.md
ruxpv.md
```

---

# 3. Source Protocols (Material Layer)

The Rux Protocol Suite is constructed using several well‑established protocols as **material implementations**.

Documented in:

```
source-protocols.md
```

Includes:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  

This file provides background context for contributors working on protocol integration and engineered transport design.

---

# 4. Directory Structure

```
protocols/
│
├── README.md              ← this file
├── RUTL.md
├── ruxvv.md
├── ruxsv.md
├── ruxpv.md
└── source-protocols.md
```

Each file provides a focused, self‑contained specification.

---

# 5. Relationship to Other Documentation

The protocol documentation complements:

- `design-decisions.md` — architectural rationale  
- `security-considerations.md` — system‑level security considerations  
- `glossary.md` — terminology and definitions  
- `architecture/` — system‑level structure and module boundaries  

Together, these documents provide a complete view of Dawnset’s transport architecture.

---

# 6. Protocol Document Structure

Each protocol specification follows a consistent structure:

1. **Overview**  
2. **Protocol Harmonization Details**  
3. **State Machine (Explicit Behavior Model)**  
4. **Observability Model**  
5. **Security Notes**  
6. **Integration with RUTL**
