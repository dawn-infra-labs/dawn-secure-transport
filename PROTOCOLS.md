# Dawn Bridge Core — Supported Protocols

This document provides a detailed overview of all transport protocols supported by Dawn Bridge Core.  
It explains their purpose, characteristics, strengths, weaknesses, and how they fit into the unified transport framework.

The goal is to provide a clear, technical, and future‑proof reference for contributors, auditors, and researchers.

---

# 1. Overview

Dawn Bridge Core supports a **multi‑transport strategy** to maximize censorship resistance, performance, and adaptability.

Supported protocols:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  
- TUIC v5  

Each protocol is integrated through the **Unified Transport Framework**, ensuring consistent behavior, shared abstractions, and AI‑driven selection.

---

# 2. Protocol Comparison Table

    Protocol     | Type                | Strengths                          | Weaknesses
    -------------|---------------------|-------------------------------------|------------------------------
    REALITY      | TLS mimicry         | indistinguishable from HTTPS        | complex config
    uTLS         | TLS fingerprinting  | Chrome‑like handshake behavior      | requires careful tuning
    XTLS‑Vision  | TCP obfuscation     | high performance, low overhead      | fingerprintable if misused
    XHTTP        | HTTP/3 camouflage   | blends into normal web traffic      | moderate overhead
    VLESS        | lightweight         | simple, flexible, low metadata      | requires obfuscation layer
    TUIC v5      | QUIC‑based          | high‑speed, anti‑throttling         | QUIC is increasingly targeted

---

# 3. Protocol Details

## 3.1 REALITY

### Description
REALITY is a TLS‑based protocol designed to be **cryptographically indistinguishable from real HTTPS traffic**.

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

## 3.2 uTLS

### Description
uTLS modifies TLS handshake fingerprints to **match real Chrome‑like client behavior**.

### Strengths
- strong JA3 mimicry  
- avoids TLS fingerprint detection  
- compatible with multiple transports  

### Weaknesses
- requires careful tuning  
- misconfiguration reduces mimicry quality  

### Use Cases
- TLS camouflage  
- handshake obfuscation  

---

## 3.3 XTLS‑Vision

### Description
XTLS‑Vision is a high‑performance encrypted transport optimized for **low overhead and statistical flow obfuscation**.

### Strengths
- excellent performance  
- reduced CPU usage  
- strong resistance to flow analysis  

### Weaknesses
- fingerprintable if misconfigured  
- requires strict adherence to spec  

### Use Cases
- performance‑critical scenarios  
- stable networks  

---

## 3.4 XHTTP

### Description
XHTTP wraps traffic inside **legitimate‑looking HTTP/3 flows**, providing strong camouflage.

### Strengths
- blends into normal web traffic  
- flexible header and frame behavior  
- good for medium‑intensity censorship  

### Weaknesses
- moderate overhead  
- weaker against advanced DPI  

### Use Cases
- medium‑control regions  
- fallback transport  

---

## 3.5 VLESS

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

## 3.6 TUIC v5

### Description
TUIC v5 is a QUIC‑based protocol optimized for **high throughput and anti‑throttling**.

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

# 4. Unified Transport Framework Integration

    Transport
      ├── Handshake
      ├── Encryption
      ├── Obfuscation
      ├── Session Management
      └── Error Handling

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

    High-risk region → REALITY
    Medium-risk region → XHTTP / VLESS
    High-latency network → TUIC v5
    Performance-critical → XTLS‑Vision

---

# 6. Future Protocols (Planned)

Potential future additions:

- MASQUE (HTTP/3 proxying)
- additional uTLS variants
- ECH‑based transports
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
