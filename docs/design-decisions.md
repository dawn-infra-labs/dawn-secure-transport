# Design Decisions

This document records the major architectural and strategic decisions made during
the design of Dawnset.  
It provides transparency, historical context, and rationale for choices that
shape the system’s architecture, security model, and long‑term direction.

Each decision includes motivation, alternatives considered, and the reasoning
behind the final choice.

---

## 1. Architectural Order: From Abstract Principles to Concrete Materials

Dawnset follows a top‑down architectural order:  
**first define abstract principles, then define engineered structures, and only
after that select concrete materials.**

This order reflects a core philosophy:  
**the system’s form must be determined by its top‑level design, not by the
limitations of existing protocols.**

### 1. Abstract Layer — RUTL  
The system first defines unified transport semantics, boundaries, state models,
and replaceability principles.  
This layer determines *what transport is*, independent of any specific protocol.

### 2. Engineered Layer — Amalgamated Protocols  
Once the abstract semantics are defined, Dawnset specifies engineered protocol
families that embody those semantics.  
These protocols represent structure, not materials.

### 3. Material Layer — Source Protocols  
Only after the abstract and engineered layers are established does the system
select concrete protocols as implementation materials.  
Materials serve the structure, not the other way around.

### Why This Order Matters  
This architectural order enables Dawnset to:

- avoid being constrained by existing protocol behavior  
- escape inertia and conventional design patterns  
- preserve long‑term innovation space  
- ensure future replaceability and extensibility  
- maintain clarity between semantics, structure, and materials  

This top‑down approach is central to Dawnset’s identity and long‑term evolution.

---

## 2. Architecture First, Implementation Later

### Decision
The project follows an **architecture‑first, implementation‑second** approach.

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
A system intended to operate in **challenging connectivity environments
(restricted, unstable, filtered, or unreliable networks)** requires stable
architecture before implementation.  
Documentation‑first ensures long‑term maintainability and reduces technical debt.

---

## 3. Modular System Architecture

### Decision
Dawnset is structured into four core architectural layers, in the following
order:

1. **Rust Unified Transport Layer (RUTL)**  
2. **Amalgamated Protocols (ruxvv, ruxsv, ruxpv)**  
3. **Decentralized Node Discovery**  
4. **AI‑Driven Routing Engine**

### Motivation
- establish RUTL as the foundational abstraction for all transports  
- treat Amalgamated Protocols as engineered, first‑class transports built on RUTL  
- ensure routing and discovery operate on unified transport semantics  
- allow each layer to evolve independently without cross‑layer coupling  

### Alternatives Considered
- monolithic architecture  
- protocol‑specific implementations  
- exposing raw source protocols directly  

### Rationale
This ordering reflects Dawnset’s architectural philosophy:  
**first define abstract semantics (RUTL), then define engineered transports
(Amalgamated Protocols), then build discovery and routing on top.**

---

## 4. Multi‑Transport Strategy

### Decision
Support multiple complementary transport protocols:
REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS.

### Motivation
- protocol diversity  
- resilience across heterogeneous networks  
- performance flexibility  
- defense in depth  

### Alternatives Considered
- single‑protocol design  
- custom proprietary protocol  

### Rationale
No single protocol performs reliably across all connectivity conditions.  
A multi‑transport approach maximizes robustness.

---

## 5. Amalgamated Protocols as Engineered Transports

### Decision
Dawnset defines three **Amalgamated Protocols**—ruxvv, ruxsv, ruxpv—as cohesive,
engineered transports built from multiple source protocols.

### Motivation
- provide consistent behavior across heterogeneous networks  
- unify performance, observability, and robustness profiles  
- reduce complexity for routing and discovery  
- avoid exposing internal protocol composition to end users  
- ensure long‑term maintainability and auditability  

### Alternatives Considered
- exposing raw source protocols directly  
- treating compositions as ad‑hoc stacks  
- defining entirely new proprietary protocols  

### Rationale
Amalgamated Protocols provide a **stable, well‑defined transport surface** while
leveraging the strengths of multiple underlying protocols.  
They allow Dawnset to offer predictable behavior without locking in specific
implementation details or handshake mechanisms.

---

## 6. Unified Transport Framework (RUTL)

### Decision
All transports share a unified abstraction layer.

### Motivation
- reduce duplicated logic  
- simplify protocol integration  
- enable routing‑informed transport orchestration  
- improve maintainability  

### Alternatives Considered
- independent protocol implementations  
- protocol‑specific routing logic  

### Rationale
A unified framework ensures consistency and reduces complexity.

---

## 7. Decentralized Node Discovery

### Decision
Use DHT as the primary discovery mechanism, with DNS TXT as fallback.

### Motivation
- avoid central points of failure  
- support global distribution  
- maintain reachability in constrained networks  

### Alternatives Considered
- centralized API  
- static configuration files  

### Rationale
Decentralization improves resilience and long‑term sustainability.

---

## 8. AI‑Driven Routing Engine

### Decision
Routing decisions use a combination of:
- classification  
- heuristic scoring  
- optional lightweight reinforcement learning  

### Motivation
- adapt to dynamic connectivity conditions  
- optimize performance  
- support multi‑hop routing  
- reduce reliance on static rules  

### Alternatives Considered
- static routing tables  
- manual configuration  

### Rationale
Connectivity environments evolve rapidly; routing must adapt automatically while
remaining transparent and auditable.

---

## 9. Multi‑Hop Routing Support

### Decision
Support multi‑hop routing for path diversity and resilience.

### Motivation
- mitigate regional constraints  
- reduce correlation risk  
- improve reliability across heterogeneous networks  

### Alternatives Considered
- single‑hop only  
- Tor‑style onion routing  

### Rationale
Multi‑hop provides a balance between performance and resilience without the
overhead of full onion routing.

---

## 10. PQC‑Ready Cryptography

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

## 11. Lightweight Reinforcement Learning (Future Option)

### Decision
Lightweight RL may be used to refine routing decisions over time.

### Motivation
- adapt to evolving connectivity patterns  
- learn from historical performance  
- improve transport orchestration  

### Alternatives Considered
- heuristic‑only routing  
- static scoring models  

### Rationale
RL provides long‑term adaptability while remaining optional and transparent.

---

## 12. Rust as the Implementation Language

### Decision
Rust is chosen for all core components.

### Motivation
- memory safety  
- performance  
- strong async ecosystem  
- secure‑by‑design principles  

### Alternatives Considered
- Go  
- C++  
- Python  

### Rationale
Rust provides the best balance of safety, performance, and long‑term
maintainability for Dawnset.
