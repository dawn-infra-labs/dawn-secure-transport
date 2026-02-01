# Transport Architecture

## 1. Overview

The transport layer of Dawn Bridge Core provides protocol agility, censorship resistance, and obfuscation.  
It is designed around a unified abstraction that allows multiple transports to coexist, evolve, and be replaced without affecting higher‑level modules such as routing or discovery.

This document describes the architecture, interfaces, behaviors, and design principles of the six supported transports:

- XHTTP  
- XTLS  
- Reality  
- VLESS  
- Hysteria2  
- Trojan  

and the future‑oriented PQC‑ready extensions.

The transport layer is responsible for:

- Establishing encrypted, obfuscated channels  
- Minimizing protocol fingerprintability  
- Handling active probing and DPI interference  
- Providing consistent APIs to the routing engine  
- Supporting dynamic switching and fallback  

---

## 2. Design Principles

### Protocol Agility
Transports must be replaceable at runtime without breaking application‑level behavior.

### Obfuscation by Default
Every transport includes mechanisms to resist DPI, traffic classification, and active probing.

### Minimal Metadata
Transports avoid exposing identifiable metadata such as protocol banners, fixed packet sizes, or deterministic timing.

### Unified Interface
All transports implement a common interface so the routing engine can treat them uniformly.

### Extensibility
New transports can be added without modifying existing ones.

---

## 3. Unified Transport Interface

All transports implement the following conceptual interface:
Transport {
    init(config)
    open_connection(target)
    send(data)
    receive()
    close()
    get_metrics() → {
        latency
        jitter
        throughput
        error_rate
    }
}

`
Transport {
    init(config)
    open_connection(target)
    send(data)
    receive()
    close()
    getmetrics() → latency, jitter, throughput, errorrate
}
`

The routing engine interacts with transports only through this interface, enabling:

- Multi‑hop routing  
- Dynamic switching  
- Performance‑aware selection  
- Risk‑aware selection  

---

## 4. Supported Transports

Dawn Bridge Core supports six primary transports.  
Each transport is designed to resist different censorship strategies and network conditions.

---

## 4.1 XHTTP

### Purpose
A lightweight, censorship‑resilient HTTP‑based transport designed to blend with normal web traffic.

### Characteristics
- Uses HTTP semantics as camouflage  
- Supports HTTP/1.1 and HTTP/2  
- Packet morphing to mimic browser behavior  
- Optional domain‑fronting (when available)  
- Resistant to simple DPI and keyword filtering  

### Strengths
- High compatibility  
- Low fingerprintability  
- Works well in restrictive environments  

### Weaknesses
- Lower throughput compared to binary transports  
- Susceptible to heavy throttling on port 80/443  

---

## 4.2 XTLS

### Purpose
A transport designed to provide encrypted communication with advanced fingerprint resistance.

### Characteristics
- TLS‑based encryption  
- Custom handshake patterns to avoid JA3 fingerprinting  
- Randomized record sizes  
- Timing jitter injection  
- Optional session resumption obfuscation  

### Strengths
- Strong encryption  
- Difficult to fingerprint  
- Good for high‑security scenarios  

### Weaknesses
- Slightly higher overhead  
- Requires careful tuning to avoid TLS anomalies  

---

## 4.3 Reality

### Purpose
A modern obfuscation layer designed to resist active probing and advanced DPI.

### Characteristics
- Mimics legitimate TLS servers without terminating TLS  
- Rejects unauthorized clients with indistinguishable behavior  
- Resistant to active probing  
- No static fingerprints  
- No detectable protocol banners  

### Strengths
- Extremely difficult to detect  
- Excellent for high‑risk regions  
- Strong active‑probe resistance  

### Weaknesses
- Requires correct server configuration  
- Slightly more complex deployment  

---

## 4.4 VLESS

### Purpose
A flexible, metadata‑minimal transport suitable for multi‑hop routing.

### Characteristics
- Lightweight binary protocol  
- No identifiable magic bytes  
- Extensible command structure  
- Supports multiplexing  
- Works well as a building block for chained hops  

### Strengths
- Very low overhead  
- Good for multi‑hop paths  
- Easy to extend  

### Weaknesses
- Requires additional obfuscation layers for DPI resistance  

---

## 4.5 Hysteria2

### Purpose
A high‑performance QUIC‑based transport optimized for unstable or high‑latency networks.

### Characteristics
- Built on QUIC  
- Congestion control optimized for censorship environments  
- High throughput  
- NAT‑friendly  
- Resistant to packet loss and throttling  

### Strengths
- Fast  
- Stable under poor network conditions  
- Excellent for large data flows  

### Weaknesses
- QUIC fingerprinting must be mitigated  
- Higher CPU usage  

---

## 4.6 Trojan

### Purpose
A TLS‑camouflaged transport designed to blend perfectly with normal HTTPS traffic.

### Characteristics
- Uses real TLS  
- Traffic indistinguishable from HTTPS  
- No protocol banners  
- Simple and stable  

### Strengths
- Very high camouflage  
- Easy to deploy  
- Works well in moderate censorship environments  

### Weaknesses
- Can be throttled if TLS traffic is throttled  
- Less flexible than VLESS or Hysteria2  

---

## 5. PQC‑Ready Extensions

### Purpose
Prepare Dawn Bridge Core for the post‑quantum era.

### Characteristics
- Hybrid key exchange (classical + PQC)  
- Pluggable PQC algorithms  
- Backward‑compatible with existing transports  
- No changes required at the application layer  

### Goals
- Long‑term confidentiality  
- Resistance to future quantum adversaries  
- Smooth migration path  

---

## 6. Transport Obfuscation Layers

All transports may apply additional obfuscation:

- Randomized packet sizing  
- Timing jitter  
- Traffic morphing  
- Padding injection  
- Header camouflage  
- Flow‑shape randomization  

These layers are modular and can be enabled per‑transport.

---

## 7. Transport Selection Logic

The routing engine selects transports based on:

- Latency  
- Throughput  
- Reliability  
- Censorship pressure  
- Risk score  
- Historical performance  
- Regional blocking patterns  

The engine may switch transports dynamically when:

- Performance degrades  
- Blocking is detected  
- Risk increases  

---

## 8. Summary

The transport layer provides the foundation for censorship‑resistant communication.  
By supporting six specialized transports and PQC‑ready extensions, Dawn Bridge Core achieves:

- Protocol agility  
- Strong obfuscation  
- High performance  
- Long‑term security  
- Adaptability to evolving censorship techniques  

This modular design ensures that new transports can be added as threats evolve, without disrupting the rest of the system.
