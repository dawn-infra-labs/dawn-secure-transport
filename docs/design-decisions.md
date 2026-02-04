# Design Decisions

This document records the major architectural and strategic decisions made during the design of Dawn Bridge Core.  
It provides transparency, historical context, and rationale for choices that shape the system’s architecture, security model, and long‑term direction.

Each decision includes motivation, alternatives considered, and the reasoning behind the final choice.

---

## 1. Architecture First, Implementation Later

### Decision
The project follows a documentation‑first approach before writing any Rust code.

### Motivation
- ensure architectural clarity  
- avoid premature implementation  
- reduce refactoring cost  
- align with funder expectations  
- support onboarding for future contributors  

### Alternatives Considered
- implement first, document later  
- prototype‑driven development  

### Rationale
A complex censorship‑resistant system requires stable architecture before implementation.  
Documentation‑first ensures long‑term maintainability and reduces technical debt.

---

## 2. Modular System Design

### Decision
The system is divided into three core modules:
- Transport Framework  
- Node Discovery  
- AI Routing  

### Motivation
- clear separation of concerns  
- independent testing  
- easier future extensions  
- improved security isolation  

### Alternatives Considered
- monolithic architecture  
- protocol‑specific implementations  

### Rationale
A modular design enables flexibility, scalability, and resilience against censorship evolution.

---

## 3. Multi‑Transport Strategy

### Decision
Support six complementary transport protocols:
Reality, xHTTP, XTLS, VLESS, Hysteria2, Trojan.

### Motivation
- fingerprint diversity  
- resilience against protocol blocking  
- performance flexibility  
- defense in depth  

### Alternatives Considered
- single‑protocol design  
- custom proprietary protocol  

### Rationale
No single protocol can survive all censorship environments.  
A multi‑transport approach maximizes survivability.

---

## 4. Unified Transport Framework

### Decision
All transports share a common abstraction layer.

### Motivation
- reduce duplicated logic  
- simplify protocol integration  
- enable AI‑driven protocol selection  
- improve maintainability  

### Alternatives Considered
- independent protocol implementations  
- protocol‑specific routing logic  

### Rationale
A unified framework ensures consistency and reduces complexity.

---

## 5. Decentralized Node Discovery

### Decision
Use DHT as the primary discovery mechanism, with DNS TXT as fallback.

### Motivation
- avoid central points of failure  
- resist censorship  
- support global distribution  

### Alternatives Considered
- centralized API  
- static configuration files  

### Rationale
Decentralization is essential for censorship resistance and long‑term sustainability.

---

## 6. AI‑Driven Routing

### Decision
Routing decisions are based on classification, risk scoring, and optimization.

### Motivation
- adapt to dynamic censorship  
- optimize performance  
- reduce detectability  
- support multi‑hop routing  

### Alternatives Considered
- static routing rules  
- manual configuration  

### Rationale
Censorship environments change rapidly; routing must adapt automatically.

---

## 7. Multi‑Hop Routing Support

### Decision
Support multi‑hop routing for resilience and anonymity.

### Motivation
- bypass regional blocks  
- reduce correlation risk  
- improve path diversity  

### Alternatives Considered
- single‑hop only  
- Tor‑style onion routing  

### Rationale
Multi‑hop provides a balance between performance and resilience without the overhead of full onion routing.

---

## 8. PQC‑Ready Cryptography

### Decision
Design the crypto layer to support post‑quantum algorithms in the future.

### Motivation
- long‑term security  
- future‑proofing  
- alignment with global cryptographic trends  

### Alternatives Considered
- classical cryptography only  

### Rationale
Quantum‑resistant design ensures longevity and trustworthiness.

---

## 9. Reinforcement Learning for Routing (Future)

### Decision
Use RL models to improve routing decisions over time.

### Motivation
- adapt to evolving censorship  
- learn from historical performance  
- optimize protocol selection  

### Alternatives Considered
- heuristic‑based routing  
- static scoring models  

### Rationale
RL provides the best long‑term adaptability in adversarial environments.

---

## 10. Rust as the Implementation Language

### Decision
Rust is chosen for all core components.

### Motivation
- memory safety  
- performance  
- strong async ecosystem  
- secure by design  

### Alternatives Considered
- Go  
- C++  
- Python  

### Rationale
Rust provides the best balance of safety, performance, and long‑term maintainability.
