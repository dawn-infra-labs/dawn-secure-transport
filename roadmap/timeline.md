# Project Timeline

This document provides a chronological timeline for Dawn Bridge Core development.  
It aligns milestones, deliverables, and version targets into a clear sequence, enabling contributors and funders to understand the expected progression of the project.

The timeline is divided into four major phases: foundational, core implementation, advanced capabilities, and production readiness.

---

## Phase 1 — Foundational Architecture (Month 0–3)

### Month 0–1
- finalize architecture documents  
- complete threat model  
- complete data‑flow diagrams  
- define module boundaries  

### Month 1–2
- complete module‑level READMEs  
- complete roadmap documentation  
- define protocol specifications  

### Month 2–3
- prepare initial development environment  
- set up repository structure  
- prepare CI/CD skeleton  

---

## Phase 2 — Core Implementation (Month 3–6)

### Month 3–4
- implement transport abstraction layer  
- implement handshake engine  
- implement session manager  

### Month 4–5
- implement DNS TXT fallback  
- implement DHT bootstrap  
- implement node verification  

### Month 5–6
- implement application classifier  
- implement risk assessment engine  
- implement transport selector  

---

## Phase 3 — Multi‑Transport & Multi‑Hop (Month 6–9)

### Month 6–7
- implement Reality transport  
- implement xHTTP transport  

### Month 7–8
- implement Hysteria2 transport  
- implement VLESS transport  

### Month 8–9
- implement multi‑hop path optimizer  
- integrate node prioritization  
- implement fallback logic  

---

## Phase 4 — Advanced Resilience (Month 9–12)

### Month 9–10
- implement adaptive obfuscation  
- reduce protocol detectability  

### Month 10–11
- implement encrypted DHT overlay  
- add poisoning resistance  

### Month 11–12
- implement region‑aware routing  
- integrate remote configuration  

---

## Phase 5 — Production‑Ready (Month 12+)

### Month 12–15
- implement PQC handshake primitives  
- implement hybrid key exchange  

### Month 15–18
- implement reinforcement learning routing  
- implement predictive censorship modeling  

### Month 18+
- formal verification of critical components  
- reproducible builds  
- long‑term maintenance plan  

---

## Version Targets

```text
v0.1  Foundational architecture + documentation
v0.2  Core implementation (transport, discovery, routing MVP)
v0.3  Multi‑transport + multi‑hop routing
v0.4  Advanced resilience features
v1.0  Production‑ready system with PQC + RL routing
```

---

## Update Policy

The timeline will be updated when:

- new contributors join  
- new funding becomes available  
- censorship environments change  
- technical priorities shift
