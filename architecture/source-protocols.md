
# Source Protocol Architecture

The **Source Protocols** are the foundational building blocks used during the
construction of Dawnset’s Amalgamated Protocols.  
They are not exposed directly to applications or routing logic.  
Instead, they provide handshake primitives, framing behavior, and session‑level
characteristics that are integrated into cohesive transport designs under RUTL.

Dawnset defines five source protocols:

- **REALITY**  
- **uTLS**  
- **XTLS‑Vision**  
- **XHTTP (Stream / Packet variants)**  
- **VLESS**

These protocols contribute different architectural properties, which are combined
to form the performance‑, stealth‑, and survival‑oriented Amalgamated Protocols
(ruxvv, ruxsv, ruxpv).

---

## 1. Purpose and Role

Source Protocols serve three architectural purposes:

1. **Provide reusable handshake and session primitives**  
2. **Offer framing and behavioral components for amalgamation**  
3. **Enable capability‑driven routing through RUTL abstraction**

They are **not** standalone transports in Dawnset.  
All external behavior is mediated through RUTL and the Amalgamated Protocols.

---

## 2. REALITY

REALITY contributes:

- Deterministic handshake structure  
- Endpoint verification semantics  
- Session integrity guarantees  
- Compatibility with hybrid key exchange models  

Architectural role:

- Provides the “structural backbone” for session establishment  
- Supplies stable primitives used across all three Amalgamated Protocols  
- Ensures consistent capability surfaces for routing decisions  

---

## 3. uTLS

uTLS contributes:

- Client‑behavior handshake adaptation  
- Configurable TLS extension ordering  
- Cipher suite negotiation alignment  
- Fingerprint‑agnostic ClientHello shaping  

Architectural role:

- Provides handshake adaptation behavior  
- Enables compatibility across diverse environments  
- Supplies behavioral components used in ruxvv, ruxsv, and ruxpv  

uTLS does **not** define its own encryption envelope; it adapts the behavior of
other protocols integrated through RUTL.

---

## 4. XTLS‑Vision

XTLS‑Vision contributes:

- TLS 1.3‑based handshake structure  
- Efficient encrypted framing  
- PQC extension compatibility  

Architectural role:

- Provides high‑efficiency framing behavior  
- Supplies performance‑oriented components used primarily in ruxvv  
- Integrates cleanly with hybrid key exchange models  

---

## 5. XHTTP (Stream / Packet)

XHTTP contributes two variants:

### **5.1 Stream Variant**
- Stream‑oriented framing  
- HTTP‑compatible session behavior  
- Adaptive request/response sequencing  

Architectural role:
- Used in ruxsv for its conservative, adaptive behavior

### **5.2 Packet Variant**
- Packet‑oriented framing  
- Granular session recovery behavior  
- Modulation‑friendly packet boundaries  

Architectural role:
- Used in ruxpv for its resilience under unstable or high‑loss networks

---

## 6. VLESS

VLESS contributes:

- Lightweight handshake  
- Minimal metadata session model  
- Flexible framing behavior  

Architectural role:

- Provides a low‑overhead session structure  
- Supplies flexible components used across all Amalgamated Protocols  
- Ensures compatibility with RUTL’s capability model  

---

## 7. Integration with RUTL

Source Protocols do **not** interact with RUTL directly.  
Instead:

- Their components are merged during the amalgamation process  
- RUTL provides the unified lifecycle, capability model, and error semantics  
- Routing decisions rely on RUTL‑exposed capabilities, not source‑protocol details  

This ensures that routing behavior remains deterministic and algorithm‑driven.

---

## 8. Interaction with the Routing Engine

Although Source Protocols are not visible to the routing engine, their **derived
capabilities** influence routing decisions through:

- RUTL capability surfaces  
- Amalgamated Protocol behavior  
- Node discovery metadata  

Routing decisions use:

- **heuristic scoring**  
- **lightweight RL adjustments**  
- **capability‑driven evaluation**

to select the appropriate Amalgamated Protocol.

---

## 9. Relationship to Amalgamated Protocols

The three Amalgamated Protocols are constructed from Source Protocols as follows:

- **ruxvv (Performance)**  
  REALITY + uTLS + XTLS‑Vision + VLESS  

- **ruxsv (Stealth)**  
  REALITY + uTLS + XHTTP (Stream) + VLESS  

- **ruxpv (Survival)**  
  REALITY + uTLS + XHTTP (Packet) + VLESS  

Source Protocols define the **behavioral identity** of each transport, while RUTL
ensures unified lifecycle and capability semantics.

---

## 10. Summary

Source Protocols provide the internal components used to construct Dawnset’s
Amalgamated Protocols.  
They contribute handshake primitives, framing behavior, and session characteristics,
but are never exposed directly.  
All external behavior is mediated through RUTL, ensuring:

- architectural consistency  
- capability‑driven routing  
- extensibility  
- long‑term maintainability  

They form the foundation upon which Dawnset’s transport architecture is built.
