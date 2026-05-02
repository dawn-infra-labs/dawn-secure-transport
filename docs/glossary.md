# Glossary

This glossary defines the core terminology used throughout the Dawnset architecture.  
It provides consistent, implementation‑neutral definitions aligned with Dawnset’s role as **core infrastructure for next‑generation secure communication systems**.

Terms are grouped by architectural domain: **semantics, transport, routing, discovery, cryptography, and project structure**.

---

# 1. Architectural Semantics Terminology

### Transport Semantics  
The abstract rules and behaviors that define what a transport *is*, independent of any specific protocol.

### Transport Invariants  
Properties that must hold across all transports (e.g., session continuity, metadata boundaries).

### Transport Boundary  
The conceptual separation between transport behavior and higher‑level application logic.

### Abstract Transport Shape  
The high‑level structure of a transport before any protocol‑specific details are introduced.

### Engineered Transport  
A transport design that implements abstract semantics in a consistent, protocol‑agnostic form.

### Material Implementation  
Concrete protocol implementations that realize the engineered transport using existing technologies.

### Challenging Connectivity Environments  
**Restricted, unstable, filtered, or unreliable network conditions**.  
This is Dawnset’s core environmental model for describing operational constraints.

---

# 2. RUTL Terminology (First Core)

### RUTL (Rust Unified Transport Layer)  
The foundational abstraction layer defining unified transport semantics and interfaces.

### Transport Trait  
The core interface describing transport behavior.

### Session Trait  
The interface defining session lifecycle and state management.

### Handshake Trait  
The interface describing initial negotiation and capability establishment.

### Transport Context  
Metadata and state associated with a transport instance.

### Capability Negotiation  
The process of determining supported features between endpoints.

---

# 3. Amalgamated Protocols Terminology (Second Core)

### Amalgamated Protocol  
A protocol constructed by harmonizing multiple source protocols under unified semantics.

### ruxvv / ruxsv / ruxpv  
Dawnset’s three engineered transports, each aligned with a core profile:

- **ruxvv — Performance Edition**  
  Engineered for high throughput, low latency, and efficient path utilization.

- **ruxsv — Stealth Edition**  
  Engineered for low‑observability, stable streaming behavior in complex network environments.

- **ruxpv — Survival Edition**  
  Engineered for resilience and continuity in unstable or unreliable networks, using discrete message flows.

### Transport Profiles  
Dawnset’s three transport characteristics:  
**Performance / Stealth / Survival**.  
These describe behavioral priorities across heterogeneous network conditions.

### Consistency Layer  
A layer ensuring uniform behavior across different protocol implementations.

### Protocol Harmonization  
Aligning protocol behaviors to match Dawnset’s abstract transport semantics.

---

# 4. Source Protocols Terminology (Material Layer)

### Source Protocol  
A concrete protocol used as a building block for engineered transports.

### Protocol Surface  
Observable characteristics of a protocol relevant to interoperability and compatibility.

### Material Constraints  
Limitations or properties inherent to a specific protocol.

---

# 5. Routing Terminology (Routing Engine)

### Routing Engine  
The subsystem responsible for selecting transport paths based on performance and policy.

### Application Classifier  
Identifies traffic characteristics to inform routing decisions.

### Path Metrics  
Quantitative indicators used to evaluate route quality (latency, stability, throughput).

### Multi‑Hop Routing  
Forwarding traffic through multiple nodes to improve **Performance**, **Stealth**, or **Survival**.

### Adaptive Routing  
Dynamic adjustment of routing decisions based on real‑time conditions.

### Routing Profiles  
The three behavioral priorities used by the routing engine:  
**Performance / Stealth / Survival**.

---

# 6. Discovery Terminology (DHT + DNS)

### Node Discovery  
The process of identifying available nodes in a distributed environment.

### Distributed Hash Table (DHT)  
A decentralized system for storing and retrieving node information.

### DNS TXT Discovery  
A DNS‑based mechanism for publishing node metadata.

### Node Verification  
Ensuring that discovered nodes meet authenticity and integrity requirements.

### Discovery Metadata  
Information describing node capabilities and availability.

---

# 7. Cryptography Terminology

### Key Exchange  
The process of establishing shared cryptographic keys.

### PQC (Post‑Quantum Cryptography)  
Algorithms designed to remain secure against quantum‑capable adversaries.

### Hybrid Key Exchange  
Combining classical and PQC algorithms for transitional security.

### Integrity Protection  
Ensuring that transmitted data has not been modified.

### Ephemeral Keys  
Short‑lived keys used to provide forward secrecy.

---

# 8. Project Structure Terminology

### Workspace  
A collection of Rust crates managed under a unified configuration.

### Crate  
A Rust package representing a module or subsystem.

### Module  
A self‑contained architectural component within Dawnset.

### Core  
A subsystem providing foundational functionality (e.g., RUTL, Amalgamated Protocols).

### Roadmap  
A structured plan outlining development milestones.

### Security Review  
An architectural assessment of security properties, assumptions, and system‑level considerations.
