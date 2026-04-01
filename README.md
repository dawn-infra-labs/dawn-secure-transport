# Dawn Bridge Core

**Modular, censorship‑resistant transport and routing core implemented in Rust.**

Dawn Bridge Core provides a reusable foundation for building next‑generation circumvention systems, secure communication tools, and resilient transport layers.  
It is designed as a modular, extensible, and high‑performance Rust workspace, offering:

- A unified transport abstraction  
- A suite of amalgamated and extended transport protocols  
- Decentralized node discovery  
- Intelligent routing for adversarial network environments  

All components are released under the AGPLv3 license to maximize transparency, ecosystem contribution, and long‑term sustainability.

---

# ✨ Key Capabilities

- Modular Rust workspace with cleanly separated crates  
- Rux Protocol Suite (ruxsv, ruxvv, ruxte)  
- Unified transport abstraction layer (RUTL)  
- Zero‑cost abstractions enabling low memory overhead and high QPS performance under heavy concurrency  
- Traffic obfuscation and DPI evasion  
- Decentralized node discovery (DHT + DNS TXT)  
- AI‑driven routing engine with multi‑hop support  
- Secure handshake and key‑management primitives  
- Designed for integration into VPNs, proxies, and decentralized communication systems  

---

# 🚀 Rux Protocol Suite

The Rux Protocol Suite is Dawn Bridge Core’s primary contribution:  
a set of Rust‑based transport protocols built through amalgamation and protocol‑level extension.

For detailed specifications, protocol diagrams, and behavioral notes, see the documentation in the `docs/` directory.

---

## Source Protocols

Dawn Bridge Core incorporates several source protocols as foundational building blocks:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  
- TUIC v5  

These protocols provide the raw mechanisms required for constructing higher‑level designs.  
The project does not alter their semantics or implementation.

---

## Amalgamated Protocols

Protocols that combine multiple source protocols into cohesive, full‑featured transports.

### **ruxvv**
- Amalgamates: REALITY + uTLS + XTLS‑Vision + VLESS  
- A full‑capability proxy, encryption, transport, and obfuscation protocol — the **“performance edition”**, optimized for **high‑efficiency traversal** across complex network paths

### **ruxsv**
- Amalgamates: REALITY + uTLS + XHTTP (Stream) + VLESS  
- A full‑capability proxy, encryption, transport, and obfuscation protocol — the **“stealth edition”**, optimized for **deep concealment** under strict censorship

---

## Extensions Protocol

### **ruxte**
- A protocol‑level extension built on the original TUIC v5 implementation, adding optional TCP fallback without modifying TUIC’s semantics  
- A QUIC‑powered **“all‑terrain” transport engine**, suitable for a wide range of restricted network environments

---

# 🏗 Rust Unified Transport Layer (RUTL)

All protocols in the Rux Protocol Suite operate under the **Rust Unified Transport Layer (RUTL)** —  
a shared abstraction that provides:

- Unified connection lifecycle  
- Shared error handling  
- Consistent configuration model  
- Automatic TCP/UDP switching (where supported)  
- Extensible transport pipeline  
- Common handshake and routing interfaces  

RUTL is the architectural foundation that enables the suite to function as a coherent system.

---

# 🧩 Architecture Overview

Dawn Bridge Core is organized into three major modules:

---

## A. Decentralized Node Discovery (DHT + DNS TXT)

Implements a censorship‑resistant node distribution system using a structured DHT and DNS TXT records.

Capabilities include:

- Multi‑source node discovery  
- Remote configuration and policy delivery  
- Node prioritization and scoring  
- Dynamic updates under censorship pressure  

---

## B. Transport Layer: Rux Protocol Suite

The transport subsystem includes:

- **ruxvv**  
- **ruxsv**  
- **ruxte**  
- **RUTL unified abstraction layer**

---

## C. AI‑Driven Routing Engine

Optimizes path selection based on:

- Success rate  
- Latency  
- Load  
- Censorship risk  
- Historical performance  

Supports:

- Multi‑hop routing  
- Per‑application routing  
- Adaptive fallback  
- Risk‑aware path selection  

Detailed architecture documents are available in the `architecture/` directory.

---

# 📁 Repository Structure

```
dawn-bridge-core/
│
├── .github/         — GitHub workflows, CI configuration, and repository automation
├── architecture/    — High‑level system architecture, data‑flow diagrams, and threat models
├── crates/          — Rust crates implementing transports, routing, discovery, and shared utilities
├── docs/            — Protocol specifications, RUTL documentation, and detailed technical notes
├── examples/        — Minimal runnable examples demonstrating integration and usage
├── modules/         — Core subsystems (transport, discovery, routing) organized as modular components
├── roadmap/         — Milestones, development phases, and long‑term planning documents
├── scripts/         — Development scripts, tooling, and automation helpers
├── tests/           — Integration tests and validation suites
│
├── .gitattributes
├── Cargo.toml
├── LICENSE
├── PROTOCOLS.md
└── README.md
```

---

# 🔒 Security & Threat Model

Dawn Bridge Core is designed for adversarial environments involving:

- IP blocking  
- Protocol fingerprinting  
- Active probing  
- Traffic analysis  
- Selective throttling  
- Metadata inspection  

The architecture emphasizes:

- Protocol agility  
- Transport obfuscation  
- Decentralized discovery  
- Multi‑hop routing  
- Minimal metadata exposure  

A full threat model is documented in `architecture/threat-model.md`.

---

# 🚀 Roadmap

### Phase 1 — Core Architecture (MVP)
- Modular workspace  
- Transport stubs  
- Basic DHT discovery  
- Secure primitives  

### Phase 2 — Distributed Node Network
- Multi‑source discovery  
- Remote policy delivery  
- Automatic node updates  

### Phase 3 — AI Routing Engine
- Multi‑hop routing  
- Risk‑aware path selection  
- Per‑application routing  

### Phase 4 — Future Extensions
- Post‑quantum cryptography (PQC) integration  
- Additional censorship‑resistant transport protocols  

Full details are in the `roadmap/` directory.

---

# 🔮 Future Extensions

The architecture is designed with modular cryptographic interfaces, allowing PQC algorithms to be added in future phases without breaking compatibility.

Similarly, the transport framework is intentionally pluggable, enabling additional censorship‑resistant protocols to be integrated as they emerge.

These extensions will be added in future development cycles under the same AGPLv3 license.

---

# 📜 License

This project is licensed under AGPLv3.  
All modules developed in this repository will remain open and reusable for the circumvention ecosystem.

---

# 🤝 Contributing

Contributions are welcome.  
A `CONTRIBUTING.md` file will be added in a future update.

---

# 🌐 Why This Matters

Modern censorship systems increasingly rely on:

- IP + SNI blocking  
- TLS fingerprinting  
- Active probing  
- Traffic classification  
- Protocol‑level heuristics  

Dawn Bridge Core provides a flexible, modular, and future‑proof foundation for building tools that can adapt to evolving adversarial environments.

It is not a VPN or a product by itself —  
it is infrastructure for the next generation of censorship‑resistant systems.
