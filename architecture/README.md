# Architecture Documentation

This directory contains the technical architecture of **Dawn Bridge Core**, including the system overview, module‑level designs, and future extension plans.  
It serves as the entry point for understanding how the core components interact, how the system operates in adversarial network environments, and how each module can be extended or replaced.

---

## 📘 Document Index

### 1. `overview.md`
High‑level architecture summary covering design principles, system goals, module relationships, data flow, and the overall threat model.  
This is the recommended starting point.

### 2. `transport-architecture.md`
Detailed design of the pluggable transport framework, including protocol abstraction, obfuscation layers, DPI‑resistant behaviors, and transport agility mechanisms.

### 3. `node-discovery-architecture.md`
Architecture of the decentralized node discovery system, including DHT structure, DNS TXT integration, remote policy delivery, and node prioritization logic.

### 4. `ai-routing-architecture.md`
Design of the AI‑driven routing engine, covering routing signals, multi‑hop path selection, risk‑aware decision models, and adaptive routing behavior.

### 5. `crypto-and-future-extensions.md`
Cryptographic interfaces, security assumptions, and future extension plans such as PQC integration and additional censorship‑resistant transports.

---

## 📚 Purpose of This Directory

The documents in this directory are intended for:

- System architects  
- Security researchers  
- Contributors implementing new transports or routing strategies  
- Reviewers evaluating the system’s design and threat model  

Each file focuses on a single subsystem to ensure clarity, modularity, and long‑term maintainability.

---

## 🧭 Recommended Reading Order

1. **overview.md**  
2. transport‑architecture.md  
3. node‑discovery‑architecture.md  
4. ai‑routing‑architecture.md  
5. crypto‑and‑future‑extensions.md

This order provides a smooth progression from high‑level concepts to subsystem‑level details.
