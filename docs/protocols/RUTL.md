# Rust Unified Transport Layer (RUTL)

## Overview

The **Rust Unified Transport Layer (RUTL)** is the **First Core** of Dawnset’s architecture.  
It defines the unified abstraction for all transports and orchestrates protocol lifecycles, multipath flows, and routing‑aware transport selection.

RUTL provides:

- a common semantic model for transports  
- a stable interface for engineered and material protocols  
- a foundation for heuristic and model‑driven routing decisions  

It is the layer upon which both amalgamated protocols (ruxvv, ruxsv, ruxpv) and standalone full‑feature protocols (e.g., TUIC v5, Juicity) can run consistently.

---

## Design goals

- **Unified Semantics** — a single abstraction for handshake, session, and error behavior.  
- **Protocol Interchangeability** — seamless switching between different transports under one interface.  
- **Security Consistency** — shared handling of encryption, key schedules, and metadata management.  
- **Extensibility** — support for both amalgamated protocols and standalone full‑feature protocols.  
- **Operational Stability** — centralized lifecycle and error semantics for easier maintenance.  

---

## Core components

- **Handshake Layer**  
  Unified negotiation model across TLS‑based, QUIC‑based, and custom transports.

- **Encryption & Key Schedule**  
  Consistent handling of cryptographic primitives, key derivation, and session keys.

- **Session Management**  
  Session lifecycle, multiplexing, connection pooling, and graceful teardown.

- **Error Semantics**  
  Transport‑agnostic error model with well‑defined, consistent behavior across implementations.

- **Transport Abstraction**  
  Traits and interfaces that define the abstract transport shape and invariants.

---

## Supported transports

RUTL supports both engineered and standalone protocols.

**Rux Protocol Suite (Engineered Transports)**  
- **ruxvv — Performance Edition**  
- **ruxsv — Stealth Edition**  
- **ruxpv — Survival Edition**

**Source Protocols (Material Implementations)**  
- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  

**Standalone Full‑Feature Protocols**  
- TUIC v5  
- Juicity  
- Future candidates: MASQUE, ECH‑based transports, PQC‑enhanced handshakes  

RUTL treats all of these as implementations of a common transport abstraction.

---

## Integration with routing and orchestration

RUTL works closely with Dawnset’s routing engine.

- **Heuristic Weighting Engine**  
  The routing layer can assign weights to transports based on path quality metrics and select transports accordingly.

- **Lightweight Model‑Driven Selection**  
  Deployments may optionally use lightweight reinforcement‑learning models or similar techniques to refine transport and path selection over time.

- **Multipath Coordination**  
  RUTL supports concurrent use of multiple transports or paths, enabling redundancy, smoother failover, and performance aggregation where applicable.

RUTL itself remains deterministic and interface‑focused; routing logic is pluggable and can evolve independently.

---

## Security and maintenance

- **Consistent Cryptographic Handling**  
  Centralized handling of key schedules, session keys, and algorithm selection.

- **Unified Error Semantics**  
  A shared error model across transports simplifies reasoning, logging, and auditing.

- **Metadata Management**  
  Support for reducing unnecessary metadata variability at the abstraction layer.

- **Extensible Transport Registry**  
  A structured way to add, deprecate, or update transports without disrupting the overall architecture.

---

## Engineering considerations

- **Consistency Buffer**  
  RUTL may introduce lightweight buffering to maintain consistent stream or message semantics when coordinating multiple underlying transports.

- **Resource‑Aware Operation**  
  On constrained devices, RUTL can operate in resource‑aware modes such as limiting concurrent paths or preferring lower‑overhead transports.

- **Observability Hooks**  
  Standardized metrics and logging points allow operators and researchers to analyze transport behavior, performance, and reliability without coupling to specific protocol internals.
