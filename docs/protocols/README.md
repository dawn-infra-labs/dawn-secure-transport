# Protocol Documentation

This directory contains all protocol‑related documentation for Dawn Bridge Core.  
It provides detailed specifications for the Rux Protocol Suite, the Source Protocols it builds upon, and the Rust Unified Transport Layer (RUTL) that unifies them under a consistent abstraction.

These documents are intended for contributors, auditors, and researchers working on transport behavior, censorship resistance, routing intelligence, or protocol integration.

---

## 1. Rux Protocol Suite

The Rux Protocol Suite defines three cohesive transports, each designed for specific adversarial environments.  
They are built by amalgamating or extending Source Protocols into unified, full‑featured designs.

### **ruxvv (Performance)**
Amalgamates: REALITY + uTLS + XTLS‑Vision + VLESS  
Optimized for high‑performance scenarios with flexible, metadata‑minimal routing.

### **ruxsv (Stealth)**
Amalgamates: REALITY + uTLS + XHTTP (Stream) + VLESS  
Designed for deep concealment under strict censorship, resistant to probing and advanced DPI.

### **ruxpv (Survival)**
Amalgamates: REALITY + uTLS + XHTTP (Packet) + VLESS  
Survival‑mode transport that fragments traffic into discrete HTTP packets, eliminating long‑connection signatures under extreme censorship.

Each protocol has its own dedicated document:

```
ruxvv.md
ruxsv.md
ruxpv.md
```

---

## 2. Source Protocols

The Rux Protocol Suite is built on top of several well‑established transport and obfuscation protocols.  
These are documented together in:

```
source-protocols.md
```

It covers:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  

This file provides background context and comparison for contributors working on transport behavior or integration.

---

## 3. Rust Unified Transport Layer (RUTL)

The Rust Unified Transport Layer (RUTL) provides the abstraction that unifies all transports—both Source Protocols and the Rux Protocol Suite—under a consistent interface.

RUTL defines:

- a unified handshake model  
- consistent encryption and key schedule handling  
- shared obfuscation and camouflage primitives  
- session lifecycle management  
- transport‑agnostic error semantics  
- a stable API surface for contributors and extensions  

```
RUTL
  ├── Handshake
  ├── Encryption
  ├── Obfuscation
  ├── Session Management
  └── Error Handling
```

This abstraction ensures:

- consistent behavior across all transports  
- shared security guarantees  
- simplified maintenance  
- clean separation between protocol logic and application logic  
- compatibility with AI‑driven protocol selection  

- RUTL: see RUTL.md for the unified abstraction layer that orchestrates all protocols

---

## 4. Directory Structure

```
protocols/
│
├── README.md              ← this file
├── ruxvv.md
├── ruxsv.md
├── ruxpv.md
└── source-protocols.md
```

Each file provides a focused, self‑contained specification.

---

## 5. Relationship to Other Documentation

The protocol documentation complements:

- `architecture/` — system‑level design  
- `modules/` — module‑level behavior  
- `docs/security-considerations.md` — threat surfaces and mitigation  
- `docs/censorship-landscape.md` — regional blocking patterns  
- `docs/design-decisions.md` — rationale behind protocol choices  

Together, these documents provide a complete view of Dawn Bridge Core’s transport and censorship‑resistance strategy.

---

## 6. Protocol Document Structure

Each protocol specification in this directory follows a consistent structure to ensure clarity, auditability, and implementation correctness:

1. **Overview**  
   High‑level description and intended use cases.

2. **Amalgamation / Extension Details**  
   Source protocols involved and the rationale behind the design.

3. **State Machine (Explicit Behavior Model)**  
   Each protocol defines a formal state machine describing:  
   - handshake flow  
   - authentication behavior  
   - error and probe‑response behavior  
   - transition conditions  
   - teardown semantics  

   Example (Mermaid):

   ```mermaid
   stateDiagram-v2
       [*] --> Idle
       Idle --> Handshaking: REALITY authentication
       Handshaking --> Established: verification success
       Handshaking --> FakeSite: verification failure
       Established --> Streaming
       Streaming --> Closing
       FakeSite --> [*]: return 404 and close
   ```

4. **Observability Model**  
   Defines what can be observed by:  
   - the client  
   - the server  
   - the routing engine  
   - the censorship adversary  

   Includes:  
   - state exposure  
   - metrics  
   - error surfaces  
   - probe‑response behavior  
   - timing characteristics  

5. **Security Notes**  
   Metadata minimization, mimicry fidelity, padding, jitter, and probe resistance.

6. **Integration with RUTL**  
   How the protocol maps onto the Rust Unified Transport Layer abstraction.
