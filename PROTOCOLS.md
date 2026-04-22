★  

# Dawnset — Rux Protocol Suite Overview

This document provides a high‑level overview of the protocols supported by **dawnset**.  

For detailed specifications of the Rux Protocol Suite (**ruxvv, ruxsv, ruxpv**) and the **Rust Unified Transport Layer (RUTL)**, see `docs/protocols/`.

---

## 1. Protocol Categories

**dawnset** organizes protocols into two categories:

### **Amalgamated Protocols**  
Unified, full‑featured transports created by combining multiple source protocols into cohesive designs — not simple stacks, but carefully integrated systems that balance performance, concealment, and resilience.

- **ruxvv (Performance‑oriented)**  
  REALITY + uTLS + XTLS‑Vision + VLESS

- **ruxsv (Stealth‑oriented)**  
  REALITY + uTLS + XHTTP (Stream) + VLESS

- **ruxpv (Survival‑oriented)**  
  REALITY + uTLS + XHTTP (Packet) + VLESS

### **Source Protocols**  
REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS.

---

## 2. Comparison (Source Protocols)

| Protocol     | Type                | Strengths                          | Weaknesses |
|--------------|---------------------|------------------------------------|------------|
| REALITY      | TLS mimicry         | indistinguishable from HTTPS        | complex config |
| uTLS         | TLS fingerprinting  | Chrome‑like handshake behavior      | requires tuning |
| XTLS‑Vision  | TCP obfuscation     | high performance, low overhead      | fingerprintable if misused |
| XHTTP        | HTTP camouflage     | blends into normal web traffic      | moderate overhead |
| VLESS        | lightweight         | simple, flexible, low metadata      | requires obfuscation layer |

---

## 3. **Rust Unified Transport Layer (RUTL)**

The **Rust Unified Transport Layer (RUTL)** is the central orchestrator that unifies Source Protocols, the Rux Protocol Suite, and additional full‑feature protocols (e.g., TUIC v5, Juicity).  
It defines a consistent interface for transport behavior, enabling protocol interchangeability, heuristic routing, and multi‑path concurrency.

**RUTL** provides:

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

This orchestration ensures:

- consistent behavior across all transports  
- shared security guarantees  
- simplified maintenance  
- clean separation between protocol logic and application logic  
- heuristic or reinforcement learning‑based routing and adaptive protocol switching  
- multi‑path concurrency to generate chaotic traffic fingerprints  

For detailed design notes and engineering considerations, see `docs/protocols/RUTL.md`.

---

## 4. Protocol Selection Logic

**dawnset** uses heuristic or reinforcement learning‑based routing to select the optimal protocol based on:

- regional network restrictions  
- connectivity conditions  
- application type  
- risk scoring  
- historical performance  

Example logic:

```
High‑risk region → ruxsv (Stealth‑oriented)
Medium‑risk region → ruxvv (Performance‑oriented)
Extreme network restrictions → ruxpv (Survival‑oriented)
```

---

## 5. Future Protocols (Planned)

Future additions will be integrated into the Rux Protocol Suite as either new Amalgamated or Extension protocols.

Candidates under evaluation:

- MASQUE (HTTP/3 proxying)  
- ECH‑based transports  
- PQC‑enhanced handshakes  
- additional uTLS variants  

Evaluation criteria:

- resilience under restricted networks  
- performance characteristics  
- implementation complexity  
- ecosystem maturity  

---

## 6. Security Notes

All protocols within the Rux Suite and Source Protocols must adhere to strict security principles:

- minimize metadata leakage  
- ensure precise mimicry and handshake fidelity  
- fail closed under active probing  
- apply padding and timing jitter  
- avoid distinguishable flow patterns  
- maintain protocol‑consistent error behavior  

---

## 7. Contribution Notes

When adding or modifying a protocol:

- integrate with the **Rust Unified Transport Layer (RUTL, see `docs/protocols/RUTL.md`)**  
- document handshake behavior  
- document fingerprinting risks  
- include integration tests  
- update routing logic  
- ensure compatibility with heuristic or reinforcement learning‑based selection  

---
