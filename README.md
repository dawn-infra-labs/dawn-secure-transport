# Dawn Bridge Core

**Modular, censorship‑resistant transport and routing core implemented in Rust.**

Dawn Bridge Core provides a reusable foundation for building next‑generation circumvention systems, secure communication tools, and resilient transport layers.  
It is designed as a **modular, extensible, and high‑performance Rust workspace**, offering pluggable transports, decentralized node discovery, and intelligent routing for adversarial network environments.

All components are released under the **AGPLv3 license** to maximize transparency, ecosystem contribution, and long‑term sustainability.

---

## ✨ Key Capabilities

- Modular Rust workspace with cleanly separated crates  
- Six advanced censorship‑resistant transport protocols (xHTTP, XTLS, Hysteria2, VLESS, Reality, Trojan)  
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
A unified Rust framework implementing six state‑of‑the‑art circumvention transports with protocol camouflage, DPI evasion, and adaptive behavior.

### C. AI‑Driven Routing Engine
Optimizes path selection based on success rate, load, and censorship risk.  
Supports multi‑hop routing and per‑application routing decisions for enhanced resilience.

Detailed architecture documents are available in the `architecture/` directory.

---

## 📁 Repository Structure

```text
dawn-bridge-core/
│
├── README.md
│
├── architecture/
│   ├── overview.md
│   ├── transport-architecture.md
│   ├── node-discovery-architecture.md
│   ├── ai-routing-architecture.md
│   └── crypto-and-future-extensions.md
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

A full threat model is documented in `architecture/overview.md`.
