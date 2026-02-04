# Censorship Landscape

This document provides an overview of global censorship patterns, techniques, and trends relevant to Dawn Bridge Core.  
Understanding the censorship landscape is essential for designing resilient transports, routing strategies, and discovery mechanisms.

The landscape varies significantly across regions, adversary capabilities, and political environments.

---

## 1. Censorship Models

### Centralized Censorship
A single national firewall controls all international traffic.

Characteristics:
- uniform filtering rules  
- centralized DPI infrastructure  
- predictable blocking behavior  

Implications:
- protocol blocking is common  
- active probing is widely used  
- multi‑transport rotation is essential  

---

### Decentralized Censorship
Multiple ISPs implement censorship independently.

Characteristics:
- inconsistent filtering  
- varied DPI capabilities  
- regional differences  

Implications:
- routing must adapt per‑region  
- fallback mechanisms are critical  

---

### Hybrid Censorship
Combination of centralized backbone filtering and ISP‑level policies.

Characteristics:
- layered filtering  
- mixed DPI quality  
- selective blocking  

Implications:
- multi‑hop routing can bypass regional blocks  
- transport diversity increases survivability  

---

## 2. Common Censorship Techniques

### Protocol Blocking
Blocking based on:
- TLS fingerprints  
- QUIC version negotiation  
- HTTP header patterns  
- packet size signatures  

Mitigation:
- mimicry  
- padding  
- transport diversity  

---

### Active Probing
Censors actively interact with servers to detect forbidden protocols.

Techniques:
- fake handshakes  
- malformed packets  
- replay attempts  

Mitigation:
- fail‑closed behavior  
- strict handshake validation  

---

### Traffic Shaping & Throttling
Reducing bandwidth or increasing latency for suspicious traffic.

Targets:
- VPNs  
- proxies  
- encrypted tunnels  

Mitigation:
- traffic shaping  
- timing jitter  
- multi‑transport fallback  

---

### IP Blocking
Blocking specific IPs or ranges.

Mitigation:
- multi‑hop routing  
- dynamic node discovery  
- DHT‑based distribution  

---

### SNI Filtering
Blocking based on TLS SNI fields.

Mitigation:
- encrypted SNI  
- SNI camouflage  
- non‑TLS transports  

---

## 3. Regional Censorship Patterns

### High‑Control Regions
Characteristics:
- nationwide DPI  
- active probing  
- protocol fingerprinting  
- rapid adaptation  

Implications:
- require multi‑transport  
- require AI routing  
- require obfuscation  

---

### Medium‑Control Regions
Characteristics:
- ISP‑level filtering  
- inconsistent enforcement  
- partial DPI  

Implications:
- fallback transports are effective  
- discovery must handle partial blocking  

---

### Low‑Control Regions
Characteristics:
- minimal filtering  
- occasional blocking  
- political event‑based restrictions  

Implications:
- performance‑optimized transports preferred  

---

## 4. Emerging Trends

### Machine‑Learning‑Based Censorship
Censors increasingly use ML to classify:
- traffic patterns  
- burst behavior  
- timing signatures  

Mitigation:
- randomized padding  
- adaptive obfuscation  
- protocol rotation  

---

### QUIC‑Focused Blocking
QUIC is becoming a major target due to:
- encrypted metadata  
- high adoption  
- fingerprintable handshake  

Mitigation:
- mimicry of legitimate QUIC services  
- fallback to non‑QUIC transports  

---

### Event‑Triggered Censorship
Blocking increases during:
- elections  
- protests  
- political events  

Mitigation:
- dynamic routing  
- multi‑hop paths  
- decentralized discovery  

---

## 5. Implications for Dawn Bridge Core

### Transport Layer
- must support multiple protocols  
- must mimic legitimate traffic  
- must resist active probing  

### Discovery Layer
- must avoid central points of failure  
- must resist poisoning  
- must support fallback mechanisms  

### Routing Layer
- must adapt to regional differences  
- must evaluate risk dynamically  
- must support multi‑hop routing  

### Overall System
- must remain flexible  
- must evolve with censorship  
- must integrate new research continuously
