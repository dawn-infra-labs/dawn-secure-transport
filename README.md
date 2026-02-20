# Dawn Bridge Core

**Modular, censorship‑resistant transport and routing core implemented in Rust.**

Dawn Bridge Core provides a reusable foundation for building next‑generation circumvention systems, secure communication tools, and resilient transport layers.  
It is designed as a modular, extensible, and high‑performance Rust workspace, offering pluggable transports, decentralized node discovery, and intelligent routing for adversarial network environments.

All components are released under the AGPLv3 license to maximize transparency, ecosystem contribution, and long‑term sustainability.

---

## ✨ Key Capabilities

- Modular Rust workspace with cleanly separated crates  
- Six advanced censorship‑resistant transport protocols (REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS, TUIC v5)  
- Traffic obfuscation and DPI evasion (TLS fingerprint spoofing, behavioral simulation, dynamic port rotation)  
- Decentralized node discovery using DHT + DNS TXT  
- AI‑driven routing engine with multi‑hop support and per‑application routing decisions  
- Secure handshake and key‑management primitives  
- Designed for integration into VPNs, proxies, and decentralized communication systems

---

## 🧩 Architecture Overview

Dawn Bridge Core is organized into three major modules:

### A. Decentralized Node Discovery (DHT + DNS TXT)
Implements a censorship‑resistant node distribution system using a structured DHT and DNS TXT records.  
Supports remote configuration, policy delivery, node prioritization, and dynamic updates.

### B. Pluggable Transport Framework
A unified Rust framework implementing six modern circumvention transports:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP (Stream / Packet)  
- VLESS  
- TUIC v5  

These transports support multiple network environments and censorship conditions.

### C. AI‑Driven Routing Engine
Optimizes path selection based on success rate, load, and censorship risk.  
Supports multi‑hop routing and per‑application routing decisions for enhanced resilience.

Detailed architecture documents are available in the `architecture/` directory, including the threat model and end‑to‑end data‑flow specifications.

---

## 📁 Repository Structure

dawn-bridge-core/
│
├── README.md
│
├── architecture/
│   ├── overview.md
│   ├── transport-architecture.md
│   ├── node-discovery-architecture.md
│   ├── ai-routing-architecture.md
│   ├── crypto-and-future-extensions.md
│   ├── threat-model.md
│   └── data-flow.md
│
├── modules/
│   ├── transport-framework/
│   │   └── README.md
│   ├── node-discovery/
│   │   └── README.md
│   └── ai-routing/
│       └── README.md
│
├── roadmap/
│   ├── milestones.md
│   ├── deliverables.md
│   └── timeline.md
│
├── crates/
├── docs/
├── examples/
├── scripts/
├── tests/
│
├── PROTOCOLS.md
├── LICENSE
└── Cargo.toml

---

## 🔒 Security & Threat Model

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

## 🚀 Roadmap

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

## 🔮 Future Extensions

Due to current time and budget constraints, this phase does not include post‑quantum cryptography (PQC).  
The architecture is designed with modular cryptographic interfaces, allowing PQC algorithms to be added in future phases without breaking compatibility.

Similarly, the transport framework is intentionally pluggable, enabling additional censorship‑resistant protocols to be integrated as they emerge.

These extensions will be added in future development cycles under the same AGPLv3 license.

---

## 📜 License

This project is licensed under AGPLv3.  
All modules developed in this repository will remain open and reusable for the circumvention ecosystem.

---

## 🤝 Contributing

Contributions are welcome.  
A `CONTRIBUTING.md` file will be added in a future update.

---

## 🌐 Why This Matters

Modern censorship systems increasingly rely on:

- IP + SNI blocking  
- TLS fingerprinting  
- Active probing  
- Traffic classification  
- Protocol‑level heuristics  

Dawn Bridge Core provides a flexible, modular, and future‑proof foundation for building tools that can adapt to evolving adversarial environments.

It is not a VPN or a product by itself —  
it is infrastructure for the next generation of censorship‑resistant systems.
