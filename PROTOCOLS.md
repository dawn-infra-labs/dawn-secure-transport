# Dawnset — Protocol Architecture Overview

This document provides a high‑level overview of the protocol architecture used in **Dawnset**.  
It first introduces the **Rust Unified Transport Layer (RUTL)** as the first core,  
then describes the **Amalgamated Protocols** and the **Source Protocols** they are built from.

For detailed specifications, see `architecture/` and `docs/protocols/`.

---

# 1. Rust Unified Transport Layer (RUTL)

The **Rust Unified Transport Layer (RUTL)** is Dawnset’s **first core**.  
It defines the unified abstraction that all transports in Dawnset must implement.

RUTL provides:

- unified connection lifecycle  
- shared error and capability model  
- consistent configuration interface  
- extensible transport pipeline  
- handshake and routing boundaries  
- integration point for AI‑driven routing and multi‑path concurrency  

RUTL ensures:

- consistent behavior across all transports  
- shared security guarantees  
- clean separation between protocol logic and application logic  
- predictable integration for contributors and extensions  

### RUTL is not a closed system

Although Dawnset ships with its own Amalgamated Protocols,  
**RUTL is designed to support any transport protocol that provides a complete structure**, including:

- a well‑defined handshake  
- encryption and key schedule  
- session lifecycle  
- error semantics  
- framing or packetization rules  

Such protocols can be implemented as **RUTL‑compatible transports**,  
allowing Dawnset to integrate additional full‑feature protocols without modifying the core.

For detailed specifications, see `architecture/rutl.md`.

---

# 2. Protocol categories

On top of RUTL, Dawnset’s transport system is organized into two protocol categories:

1. **Amalgamated Protocols**  
   Full transports engineered by fusing multiple Source Protocols into a single, integrated design.  
   These are the protocols that the routing engine selects and operates on directly.

2. **Source Protocols**  
   Internal building blocks that provide handshake, camouflage, and framing behavior.  
   They are not exposed directly to applications or routing decisions, but are used during fusion.

This separation keeps RUTL as the stable core,  
while allowing protocol behavior to evolve through new Amalgamated Protocols and Source Protocol combinations.

---

# 3. Amalgamated Protocols

Dawnset defines three **Amalgamated Protocols**, each engineered by  
**fusing multiple Source Protocols into a single, integrated transport design**.  
These are not simple stacks; the components are tightly integrated at the RUTL layer.

### **ruxvv — Performance‑oriented Amalgamated Protocol**  
A performance‑oriented amalgamated protocol built from the following internal components:  
REALITY, uTLS, XTLS‑Vision, VLESS.  
Optimized for high‑efficiency routing and stable throughput.

### **ruxsv — Stealth‑oriented Amalgamated Protocol**  
A stealth‑oriented amalgamated protocol built from the following internal components:  
REALITY, uTLS, XHTTP (Stream), VLESS.  
Optimized for concealment in restrictive connectivity environments.

### **ruxpv — Survival‑oriented Amalgamated Protocol**  
A survival‑oriented amalgamated protocol built from the following internal components:  
REALITY, uTLS, XHTTP (Packet), VLESS.  
Optimized for resilience under unstable, filtered, or unreliable networks.

These descriptions are provided to help understand the lineage of each protocol.  
The actual implementations are **fully integrated designs** built on top of RUTL.

---

# 4. Source Protocols

Source Protocols are **internal building blocks** used during the construction of  
Amalgamated Protocols. They are **not exposed directly** to the routing engine  
or external interfaces.

- **REALITY** — TLS camouflage  
- **uTLS** — TLS fingerprint mimicry  
- **XTLS‑Vision** — high‑performance obfuscation  
- **XHTTP (Stream / Packet)** — HTTP‑based stream and packet camouflage  
- **VLESS** — lightweight session framing

These components provide handshake primitives, camouflage behavior, and transport semantics  
that are fused into the Amalgamated Protocols.

---

# 5. Protocol selection logic

Dawnset’s routing engine selects the appropriate Amalgamated Protocol based on  
connectivity conditions and risk scoring.

Example conceptual logic:

```
High‑risk region → ruxsv (Stealth‑oriented)
Medium‑risk region → ruxvv (Performance‑oriented)
Extreme network restrictions → ruxpv (Survival‑oriented)
```

This logic is implemented through Dawnset’s AI‑driven routing engine,  
not through static rules.

---

# 6. Future extensions

Future protocol extensions may be added as **RUTL‑compatible transports**,  
not as external protocol stacks.

Areas under evaluation include:

- MASQUE‑based transports  
- ECH‑assisted handshake concealment  
- PQC‑enhanced key exchange  
- additional uTLS variants  

All future additions must integrate cleanly with RUTL  
and follow Dawnset’s security and concealment principles.

---

# 7. Security principles

All protocols within Dawnset must adhere to strict security requirements:

- minimize metadata leakage  
- maintain handshake fidelity  
- resist active probing  
- apply padding and timing jitter  
- avoid distinguishable flow patterns  
- maintain protocol‑consistent error behavior  

---

# 8. Contribution notes

When adding or modifying a protocol:

- integrate with **RUTL**  
- document handshake behavior  
- document fingerprinting considerations  
- include integration tests  
- update routing logic if applicable  
- ensure compatibility with Dawnset’s concealment and resilience goals  

---
