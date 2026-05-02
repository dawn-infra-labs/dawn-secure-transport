
# Protocol Integration Architecture

This document describes how Dawnset integrates **Source Protocols**, **Amalgamated
Protocols**, and the **Rust Unified Transport Layer (RUTL)** into a cohesive,
capability‑driven transport system.  
It defines the boundaries, responsibilities, and integration flow across all
protocol layers.

Protocol integration ensures that Dawnset remains modular, extensible, and
consistent across diverse connectivity environments.

---

## 1. Architectural Overview

Dawnset’s transport architecture is composed of three layers:

```
Source Protocols  →  Amalgamated Protocols  →  RUTL  →  Routing Engine
```

### **1.1 Source Protocols**
Provide handshake primitives, framing behavior, and session characteristics.

### **1.2 Amalgamated Protocols**
Combine multiple Source Protocols into coherent transport families:
- ruxvv (Performance)
- ruxsv (Stealth)
- ruxpv (Survival)

### **1.3 RUTL**
Provides:
- unified lifecycle  
- capability surfaces  
- error semantics  
- transport‑agnostic interface  

### **1.4 Routing Engine**
Uses RUTL capabilities + heuristic/RL scoring to select transports.

---

## 2. Integration Goals

Protocol integration is designed to achieve:

### **2.1 Modularity**
Source Protocols can evolve independently without affecting RUTL or routing.

### **2.2 Consistency**
All transports expose a unified capability model.

### **2.3 Extensibility**
New protocols can be added without modifying existing ones.

### **2.4 Predictability**
Routing decisions rely on deterministic capability surfaces, not protocol names.

### **2.5 Separation of Concerns**
- Source Protocols define behavior  
- Amalgamated Protocols define composition  
- RUTL defines lifecycle  
- Routing defines selection  

---

## 3. Integration Flow

The integration pipeline follows four stages:

```
1. Source Protocol Composition
2. Amalgamated Protocol Construction
3. RUTL Capability Exposure
4. Routing Engine Consumption
```

---

## 4. Source Protocol Composition

Each Source Protocol contributes specific architectural components:

- REALITY → deterministic handshake structure  
- uTLS → handshake adaptation  
- XTLS‑Vision → efficient encrypted framing  
- XHTTP → stream/packet framing variants  
- VLESS → lightweight session model  

These components are **not** exposed directly.  
They are merged during Amalgamated Protocol construction.

---

## 5. Amalgamated Protocol Construction

Dawnset defines three Amalgamated Protocols:

### **5.1 ruxvv (Performance‑Oriented)**
Composition:
- REALITY  
- uTLS  
- XTLS‑Vision  
- VLESS  

Characteristics:
- high throughput  
- efficient framing  
- stable session behavior  

---

### **5.2 ruxsv (Stealth‑Oriented)**
Composition:
- REALITY  
- uTLS  
- XHTTP (Stream)  
- VLESS  

Characteristics:
- conservative handshake behavior  
- adaptive session shaping  
- region‑friendly behavior  

---

### **5.3 ruxpv (Survival‑Oriented)**
Composition:
- REALITY  
- uTLS  
- XHTTP (Packet)  
- VLESS  

Characteristics:
- resilient under unstable or high‑loss networks  
- granular recovery behavior  
- minimal assumptions about connectivity  

---

## 6. RUTL Capability Exposure

After construction, each Amalgamated Protocol exposes a **capability surface** to
RUTL.  
Capabilities include:

- handshake model  
- framing model  
- recovery behavior  
- rotation behavior  
- modulation support  
- reshaping support (optional)  
- PQC readiness  
- performance characteristics  

RUTL does **not** expose protocol names.  
It exposes **capabilities**, ensuring transport‑agnostic behavior.

---

## 7. RUTL Integration

RUTL provides:

### **7.1 Unified Lifecycle**
All transports follow the same:
- initialization  
- handshake  
- session management  
- rotation  
- teardown  

### **7.2 Unified Error Semantics**
Errors follow a consistent model across all transports.

### **7.3 Unified Interface**
All transports implement the same conceptual interface:

```
Transport {
    init()
    open()
    send()
    receive()
    close()
    metrics()
}
```

### **7.4 Capability‑Driven Behavior**
Routing decisions rely on:
- capability sets  
- performance metrics  
- risk coefficients  

not on protocol identity.

---

## 8. Routing Engine Consumption

The routing engine uses:

- RUTL capability surfaces  
- node discovery metadata  
- heuristic scoring  
- lightweight RL adjustments  

to select the appropriate Amalgamated Protocol.

Routing decisions consider:

- performance requirements  
- environmental constraints  
- risk score  
- region metadata  
- historical outcomes  

Routing may switch transports dynamically when:
- performance degrades  
- risk increases  
- environment changes  

---

## 9. Optional Modulation & Reshaping

Some transports support optional modulation capabilities:

- timing reshaping  
- micro‑padding  
- chaff insertion  
- packet boundary normalization  

These are exposed as **RUTL capabilities**, not protocol features.

Routing may prefer reshaping‑capable transports in high‑risk scenarios.

---

## 10. Future Protocol Integration

Future transports integrate through the same pipeline:

1. Define Source Protocol components  
2. Construct new Amalgamated Protocol  
3. Expose capabilities through RUTL  
4. Allow routing engine to consume capabilities  

This ensures long‑term extensibility without architectural changes.

---

## 11. Summary

Protocol integration in Dawnset ensures:

- modularity  
- extensibility  
- predictable behavior  
- capability‑driven routing  
- consistent lifecycle semantics  
- clean separation between protocol layers  

By combining Source Protocols into Amalgamated Protocols and exposing them through
RUTL, Dawnset achieves a flexible, future‑proof transport architecture suitable
for diverse connectivity environments.
