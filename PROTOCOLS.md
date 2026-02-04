# Dawn Bridge Core — Supported Protocols

This document provides a detailed overview of all transport protocols supported by Dawn Bridge Core.  
It explains their purpose, characteristics, strengths, weaknesses, and how they fit into the unified transport framework.

The goal is to provide a clear, technical, and future‑proof reference for contributors, auditors, and researchers.

---

# 1. Overview

Dawn Bridge Core supports a **multi‑transport strategy** to maximize censorship resistance, performance, and adaptability.

Supported protocols:

- Reality  
- xHTTP  
- XTLS  
- VLESS  
- Hysteria2  
- Trojan  

Each protocol is integrated through the **Unified Transport Framework**, ensuring consistent behavior, shared abstractions, and AI‑driven selection.

---

# 2. Protocol Comparison Table

```text
Protocol     | Type            | Strengths                          | Weaknesses
-------------|-----------------|-------------------------------------|------------------------------
Reality      | TLS mimicry     | indistinguishable from HTTPS        | complex config
xHTTP        | HTTP obfuscation| blends into normal web traffic      | moderate overhead
XTLS         | TLS acceleration| high performance, low overhead      | fingerprintable if misused
VLESS        | lightweight     | simple, flexible, low metadata      | requires obfuscation layer
Hysteria2    | QUIC-based      | high-speed, anti-throttling         | QUIC is increasingly targeted
Trojan       | TLS camouflage  | strong mimicry, simple handshake    | SNI-based blocking possible
```

---

# 3. Protocol Details

## 3.1 Reality

### Description
Reality is a TLS‑based protocol designed to be **cryptographically indistinguishable from real HTTPS traffic**.

### Strengths
- excellent mimicry  
- strong resistance to active probing  
- minimal metadata leakage  

### Weaknesses
- configuration complexity  
- requires precise certificate handling  

### Use Cases
- high‑risk regions  
- environments with aggressive DPI  

---

## 3.2 xHTTP

### Description
xHTTP is an obfuscation layer that wraps traffic inside **legitimate‑looking HTTP flows**.

### Strengths
- blends into normal web traffic  
- flexible header manipulation  
- good for low‑intensity censorship  

### Weaknesses
- moderate overhead  
- weaker against advanced DPI  

### Use Cases
- medium‑control regions  
- fallback transport  

---

## 3.3 XTLS

### Description
XTLS is a high‑performance TLS variant optimized for low overhead and efficient data transfer.

### Strengths
- excellent performance  
- reduced CPU usage  
- low latency  

### Weaknesses
- fingerprintable if misconfigured  
- requires strict adherence to spec  

### Use Cases
- performance‑critical scenarios  
- stable networks  

---

## 3.4 VLESS

### Description
VLESS is a lightweight, flexible protocol with minimal metadata and strong extensibility.

### Strengths
- simple  
- low overhead  
- easy to integrate with obfuscation layers  

### Weaknesses
- requires additional camouflage  
- handshake is not inherently mimicry‑safe  

### Use Cases
- custom obfuscation  
- multi‑transport fallback  

---

## 3.5 Hysteria2

### Description
Hysteria2 is a QUIC‑based protocol optimized for **anti‑throttling** and high‑latency networks.

### Strengths
- excellent throughput  
- strong resistance to bandwidth throttling  
- good for unstable networks  

### Weaknesses
- QUIC is increasingly targeted by censors  
- handshake fingerprinting risks  

### Use Cases
- high‑latency regions  
- networks with heavy throttling  

---

## 3.6 Trojan

### Description
Trojan disguises traffic as **standard TLS traffic to a legitimate HTTPS server**.

### Strengths
- simple  
- strong mimicry  
- easy to deploy  

### Weaknesses
- SNI filtering can block it  
- limited flexibility  

### Use Cases
- low‑risk regions  
- simple deployments  

---

# 4. Unified Transport Framework Integration

All protocols share a common abstraction layer:

```text
Transport
  ├── Handshake
  ├── Encryption
  ├── Obfuscation
  ├── Session Management
  └── Error Handling
```

This ensures:

- consistent API  
- shared security guarantees  
- AI‑driven protocol selection  
- simplified maintenance  

---

# 5. Protocol Selection Logic

Dawn Bridge Core uses AI routing to select the optimal protocol based on:

- regional censorship intensity  
- network conditions  
- application type  
- risk scoring  
- historical performance  

Example logic:

```text
High-risk region → Reality / Trojan
Medium-risk region → xHTTP / VLESS
High-latency network → Hysteria2
Performance-critical → XTLS
```

---

# 6. Future Protocols (Planned)

Potential future additions:

- MASQUE (HTTP/3 proxying)
- uTLS variants
- Encrypted ClientHello (ECH) transports
- PQC‑enhanced handshakes

These will be evaluated based on:

- censorship resilience  
- performance  
- implementation complexity  
- ecosystem maturity  

---

# 7. Security Notes

- all protocols must minimize metadata  
- mimicry must be precise  
- handshake behavior must match real protocols  
- transports must fail closed under probing  
- padding and timing jitter are required  

---

# 8. Contribution Notes

When adding or modifying a protocol:

- follow the Unified Transport Framework  
- document handshake behavior  
- document fingerprinting risks  
- include integration tests  
- update routing logic
