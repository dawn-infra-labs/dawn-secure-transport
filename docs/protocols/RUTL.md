# Rust Unified Transport Layer (RUTL)

## Overview
The **Rust Unified Transport Layer (RUTL)** is the central orchestrator of Dawn Bridge Core’s transport system.  
It manages protocol lifecycles, coordinates multi‑path flows, and enables AI‑driven dynamic routing.  
RUTL provides auxiliary capabilities such as fingerprint libraries, shared obfuscation primitives, and unified error semantics.  

It is the foundation upon which both **amalgamated protocols** (ruxvv, ruxsv, ruxpv) and **standalone full‑feature protocols** (e.g., TUIC v5, Juicity) can run seamlessly.

---

## Design Goals
- **Protocol Interchangeability** — seamless switching between different transports.  
- **Security Consistency** — shared primitives for encryption, handshake fidelity, and metadata minimization.  
- **Extensibility** — support for both amalgamated protocols and standalone full‑feature protocols.  
- **Maintenance Stability** — centralized error semantics and lifecycle management.  
- **Censorship Resistance** — unified obfuscation and camouflage strategies.  

---

## Core Components
- **Handshake** — unified negotiation across TLS, QUIC, and custom transports.  
- **Encryption / Key Schedule** — consistent handling of cryptographic primitives.  
- **Obfuscation / Camouflage** — shared DPI evasion logic, padding, and jitter.  
- **Session Management** — lifecycle, multiplexing, and connection pooling.  
- **Error Handling** — transport‑agnostic semantics, fail‑closed behavior.  

---

## Supported Protocols
RUTL supports both amalgamated and standalone protocols:

- **Rux Suite Editions**  
  - ruxvv (Performance)  
  - ruxsv (Stealth)  
  - ruxpv (Survival)  

- **Source Protocols**  
  - REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS  

- **Full‑Feature Protocols**  
  - TUIC v5 (QUIC‑based, anti‑throttling)  
  - Juicity (QUIC‑powered, high‑speed transport)  
  - Future candidates: MASQUE, ECH‑based transports, PQC‑enhanced handshakes  

---

## Integration Notes
- RUTL does not modify protocol semantics; it provides a **unified interface**.  
- Amalgamated protocols (ruxvv, ruxsv, ruxpv) rely on RUTL for handshake, encryption delegation, and obfuscation.  
- Full‑feature protocols (TUIC v5, Juicity) are supported directly under RUTL without amalgamation.  
- RUTL ensures consistent routing logic and AI‑driven protocol selection.  
- Supports **multi‑path concurrency**, allowing multiple protocols to run simultaneously, producing mixed traffic flows that confuse statistical analysis models.  

---

## Security & Maintenance
- **Automatic fingerprint updates** for uTLS to mitigate Parrot ID lag.  
- **Fail‑closed behavior** under active probing.  
- **Unified error semantics** across all transports.  
- **Extensible pipeline** for adding new censorship‑resistant protocols.  

---

## Engineering Considerations
- **Consistency Buffer**  
  RUTL introduces a lightweight reassembly buffer to ensure TCP sequence consistency when simulating a unified stream across multiple concurrent protocols.  

- **Adaptive Resource Mode**  
  On mobile devices, RUTL provides an energy‑saving scheduling mode. When censorship intensity is low, the engine reduces concurrent paths to minimize CPU and memory usage.
