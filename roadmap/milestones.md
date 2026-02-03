# Project Milestones

This document defines the major milestones for Dawn Bridge Core.  
Milestones represent significant checkpoints in the project’s development, combining architectural progress, module implementation, and system integration.

Milestones are grouped into three phases: foundational, integration, and advanced capabilities.

---

## Phase 1 — Foundational Architecture (v0.1)

### M1.1 — Architecture Documentation Complete
- all architecture/*.md files finalized  
- threat model and data‑flow diagrams completed  
- module boundaries defined  

### M1.2 — Module Documentation Complete
- transport‑framework/README.md  
- node‑discovery/README.md  
- ai‑routing/README.md  

### M1.3 — Roadmap & Planning Complete
- roadmap/README.md  
- milestones.md  
- deliverables.md  
- timeline.md  

---

## Phase 2 — Core Implementation (v0.2)

### M2.1 — Transport Framework MVP
- abstraction layer implemented  
- handshake engine implemented  
- session manager implemented  
- protocol registry implemented  

### M2.2 — Node Discovery MVP
- DNS TXT fallback implemented  
- DHT bootstrap implemented  
- node verification implemented  

### M2.3 — AI Routing MVP
- application classifier implemented  
- basic risk engine implemented  
- transport selector implemented  

---

## Phase 3 — Multi‑Transport & Multi‑Hop (v0.3)

### M3.1 — Multi‑Transport Support
- Reality implemented  
- xHTTP implemented  
- Hysteria2 implemented  

### M3.2 — Multi‑Hop Routing
- path optimizer supports multi‑hop  
- node prioritization integrated  
- fallback logic implemented  

---

## Phase 4 — Advanced Resilience (v0.4)

### M4.1 — Adaptive Obfuscation
- transport‑level obfuscation tuning  
- detectability reduction  

### M4.2 — Encrypted DHT Overlay
- secure routing for discovery  
- poisoning resistance  

### M4.3 — Region‑Aware Routing
- region‑specific risk models  
- adaptive protocol selection  

---

## Phase 5 — Production‑Ready (v1.0)

### M5.1 — PQC‑Ready Transport Layer
- PQC handshake primitives  
- hybrid key exchange  

### M5.2 — Reinforcement Learning Routing
- adaptive routing based on historical performance  
- predictive censorship modeling  

### M5.3 — Stability & Hardening
- reproducible builds  
- formal verification of critical components  
- long‑term maintenance plan
