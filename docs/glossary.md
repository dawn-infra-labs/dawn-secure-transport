# Glossary

This glossary defines key terminology used throughout the Dawn Bridge Core project.  
It ensures consistent understanding across architecture documents, module specifications, and implementation.

Terms are grouped by domain: transport, routing, discovery, cryptography, and censorship.

---

## Transport Terminology

### Transport Protocol
A network protocol used to encapsulate and transmit user traffic.  
Examples: REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS, TUIC v5.

### Transport Framework
The abstraction layer that unifies all transport protocols under a common interface.

### Handshake
The initial negotiation phase between client and server, establishing keys, parameters, and session context.

### Session
A logical communication channel established after a successful handshake.

### Obfuscation
Techniques used to disguise protocol behavior to evade detection.

### Fingerprint
Observable characteristics of a protocol that can be used for identification by censors.

---

## Routing Terminology

### AI Routing
A routing system that uses classification, risk scoring, and optimization to select the best transport and path.

### Application Classifier
A component that identifies the type of traffic (e.g., streaming, browsing, gaming).

### Risk Score
A numerical value representing the likelihood of censorship or detection for a given path or protocol.

### Path Optimization
The process of selecting the best route based on performance, risk, and policy.

### Multi‑Hop Routing
Routing traffic through multiple nodes to improve resilience or anonymity.

---

## Discovery Terminology

### Node Discovery
The process of finding available nodes without centralized infrastructure.

### DHT (Distributed Hash Table)
A decentralized lookup system used to store and retrieve node information.

### DNS TXT Fallback
A backup discovery mechanism using DNS TXT records when DHT is unavailable.

### Node Verification
The process of validating the authenticity and integrity of discovered nodes.

### Poisoning Attack
An attack where malicious actors inject false data into the discovery system.

---

## Cryptography Terminology

### Key Exchange
A method for securely establishing shared keys between client and server.

### PQC (Post‑Quantum Cryptography)
Cryptographic algorithms designed to resist quantum attacks.

### Hybrid Handshake
A handshake combining classical and PQC algorithms for transitional security.

### Integrity Check
A mechanism ensuring that data has not been tampered with.

### Ephemeral Keys
Short‑lived keys used to provide forward secrecy.

---

## Censorship Terminology

### DPI (Deep Packet Inspection)
A technique used by censors to analyze packet contents and detect protocols.

### Active Probing
A censorship technique where the censor interacts with servers to detect forbidden protocols.

### Traffic Shaping
Manipulating traffic characteristics to degrade performance.

### Protocol Blocking
The act of identifying and blocking specific protocols based on fingerprints.

### Collateral Damage
Unintended blocking of legitimate services due to aggressive censorship.

---

## Project Terminology

### Module
A self‑contained subsystem within Dawn Bridge Core (transport, discovery, routing).

### Crate
A Rust package representing a module implementation.

### Workspace
A collection of crates managed under a single Cargo configuration.

### Roadmap
A structured plan outlining milestones, deliverables, and timelines.

### Threat Model
A document describing potential adversaries, attack vectors, and security assumptions.
