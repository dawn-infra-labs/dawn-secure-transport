# Transport Architecture

## 1. Overview

The transport layer of **Dawnset** provides protocol agility, resilient communication, and endpoint stealth.  
It is designed around a unified abstraction that allows multiple transports to coexist, evolve, and be replaced without affecting higher‑level modules such as routing or discovery.

This document describes the architecture, interfaces, behaviors, and design principles of the five supported transports:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS    

and the future‑oriented PQC‑ready extensions.

The transport layer is responsible for:

- Establishing encrypted, stealth channels  
- Minimizing protocol fingerprintability  
- Handling automated endpoint verification and traffic analysis interference  
- Providing consistent APIs to the routing engine  
- Supporting dynamic switching and fallback  

For detailed specifications of the amalgamated and extended protocols in the Rux Protocol Suite, see the documentation in the `docs/` directory.

---

## 2. Design Principles

### Protocol Agility  
Transports must be replaceable at runtime without breaking application‑level behavior.

### Stealth by Default  
Every transport includes mechanisms to resist traffic analysis, classification, and automated protocol validation.

### Minimal Metadata  
Transports avoid exposing identifiable metadata such as protocol banners, fixed packet sizes, or deterministic timing.

### Unified Interface  
All transports implement a common interface so the routing engine can treat them uniformly.

### Extensibility  
New transports can be added without modifying existing ones.

---

## 3. Unified Transport Interface

All transports implement the following conceptual interface:

```
Transport {
    init(config)
    open_connection(target)
    send(data)
    receive()
    close()
    get_metrics() {
        latency
        jitter
        throughput
        error_rate
    }
}
```

The routing engine interacts with transports only through this interface, enabling:

- Multi‑path relaying  
- Dynamic switching  
- Performance‑aware selection  
- Risk‑aware selection  

The complete end‑to‑end handshake and packet flow are described in `data-flow.md`.

---

## 4. Supported Transports

**Dawnset** supports six primary transports.  
Each transport is designed to adapt to different connectivity constraints and network conditions.

---

### 4.1 REALITY

**Purpose**  
A modern stealth layer designed to provide authentication integrity and endpoint concealment.

**Characteristics**  
- Mimics legitimate TLS servers without terminating TLS  
- Rejects unauthorized clients with indistinguishable behavior  
- Resistant to automated endpoint verification  
- No static fingerprints  
- No detectable protocol banners  

**Strengths**  
- Extremely difficult to classify  
- Excellent for high‑risk regions  
- Strong endpoint stealth  

**Weaknesses**  
- Requires correct server configuration  
- Slightly more complex deployment  

---

### 4.2 uTLS

**Purpose**  
A TLS fingerprint adaptation layer that mimics real‑world client behavior.

**Characteristics**  
- Adjusts ClientHello parameters  
- Controls cipher suite ordering  
- Tunes TLS extensions  
- Aligns JA3/JA4 fingerprints with popular clients    

**Strengths**  
- Reduces detectability  
- Integrates with REALITY, XHTTP, and XTLS‑Vision  
- Lightweight and flexible  

**Weaknesses**  
- Provides camouflage but not independent encryption  
- Requires pairing with other transports  

---

### 4.3 XTLS‑Vision

**Purpose**  
A transport designed to provide encrypted communication with advanced fingerprint resistance.

**Characteristics**  
- TLS‑based encryption  
- Custom handshake patterns to avoid JA3 fingerprinting  
- Randomized record sizes  
- Timing jitter injection  
- Optional session resumption obfuscation  

**Strengths**  
- Strong encryption  
- Difficult to fingerprint  
- Good for high‑security scenarios  

**Weaknesses**  
- Slightly higher overhead  
- Requires careful tuning to avoid TLS anomalies  

---

### 4.4 XHTTP

**Purpose**  
A lightweight, resilient HTTP‑based transport designed to blend with normal web traffic.

**Characteristics**  
- Uses HTTP semantics as camouflage  
- Supports HTTP/1.1 and HTTP/2  
- Packet morphing to mimic browser behavior  
- Optional domain‑fronting (when available)  
- Resistant to simple traffic analysis and keyword filtering  

**Strengths**  
- High compatibility  
- Low fingerprintability  
- Works well in restrictive environments  

**Weaknesses**  
- Lower throughput compared to binary transports  
- Susceptible to heavy throttling on port 80/443  

---

### 4.5 VLESS

**Purpose**  
A flexible, metadata‑minimal transport suitable for multi‑path relaying.

**Characteristics**  
- Lightweight binary protocol  
- No identifiable magic bytes  
- Extensible command structure  
- Supports multiplexing  
- Works well as a building block for chained hops  

**Strengths**  
- Very low overhead  
- Good for multi‑hop paths  
- Easy to extend  

**Weaknesses**  
- Requires additional modulation layers for traffic analysis resistance  

---

## 5. PQC‑Ready Extensions

**Purpose**  
Prepare **Dawnset** for the post‑quantum era.

**Characteristics**  
- Hybrid key exchange (classical + PQC)  
- Pluggable PQC algorithms  
- Backward‑compatible with existing transports  
- No changes required at the application layer  

**Goals**  
- Long‑term confidentiality  
- Resistance to future quantum adversaries  
- Smooth migration path  

---

## 6. Transport Modulation Layers

All transports may apply additional modulation:

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
- Connectivity constraints  
- Risk score  
- Historical performance  
- Regional reachability patterns  

The engine may switch transports dynamically when:

- Performance degrades  
- Interference is detected  
- Risk increases  

---

## 8. Summary

The transport layer provides the foundation for resilient communication.  
By supporting six specialized transports and PQC‑ready extensions, **Dawnset** achieves:

- Protocol agility  
- Authentication integrity and endpoint stealth  
- High performance  
- Long‑term security  
- Adaptability to evolving connectivity challenges  

This modular design ensures that new transports can be added as threats evolve, without disrupting the rest of the system.
