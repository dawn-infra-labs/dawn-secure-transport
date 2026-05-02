
# Amalgamated Protocols

The **Amalgamated Protocols** are the second core of **Dawnset**.  
They are fully engineered transport designs produced through the amalgamation of
multiple source protocols into cohesive, capability‑driven structures that operate
on top of the Rust Unified Transport Layer (RUTL).

Each Amalgamated Protocol implements the RUTL interface, exposes a structured
capability set, and provides a complete handshake, session lifecycle, and routing
boundary model.

Dawnset currently defines three Amalgamated Protocols:

- **ruxvv** — performance‑oriented  
- **ruxsv** — stealth‑oriented  
- **ruxpv** — survival‑oriented  

These protocols are not simple stacks of components.  
They are **integrated transport systems** engineered to behave coherently under
RUTL’s unified abstraction.

---

## 1. Purpose and Role

The Amalgamated Protocols serve as Dawnset’s primary transport layer.  
Their goals are:

- **Capability specialization** — each protocol optimizes for a different operational profile  
- **Unified behavior** — all protocols conform to RUTL’s lifecycle and error semantics  
- **Transport agility** — routing can switch between protocols based on capability needs  
- **Resilience** — each protocol is engineered for a specific class of connectivity challenges  
- **Extensibility** — new Amalgamated Protocols can be introduced without modifying RUTL  

They provide the transport diversity required for adaptive routing and long‑term
architectural evolution.

---

## 2. Architectural Structure

Each Amalgamated Protocol is composed of:

### 2.1 Source Protocol Components

The following source protocols are used as internal building blocks:

- **REALITY**  
- **uTLS**  
- **XTLS‑Vision**  
- **XHTTP (Stream / Packet variants)**  
- **VLESS**

Source protocols contribute handshake primitives, framing behavior, and
session‑level characteristics, but they are **not exposed directly**.  
They are integrated into cohesive designs under the RUTL abstraction.

---

### 2.2 Unified RUTL Interface

All Amalgamated Protocols implement:

- RUTL lifecycle  
- RUTL capability model  
- RUTL handshake boundaries  
- RUTL error semantics  
- RUTL routing integration  

This ensures consistent behavior across all transports.

---

### 2.3 Capability Layering

Each protocol defines a structured capability set, including:

- Handshake capabilities  
- Session capabilities  
- Routing boundaries  
- Concurrency behavior  
- State transition guarantees  

Capabilities allow the routing engine and discovery subsystem to select the most
appropriate protocol for a given environment.

---

### 2.4 Integrated Session Model

Each protocol provides:

- A complete handshake  
- Session establishment  
- Framing and state transitions  
- Error propagation  
- Session rotation behavior  

These behaviors are engineered to be internally coherent and externally predictable
through RUTL.

---

## 3. Source Protocol Composition

Each Amalgamated Protocol is defined by a specific amalgamation of source protocols.
The composition is **intentional and engineered** rather than a simple layering of
independent components.

### 3.1 ruxvv — Performance‑Oriented Protocol

**Amalgamates: REALITY + uTLS + XTLS‑Vision + VLESS**

ruxvv is designed for:

- High throughput  
- Latency stability  
- Multi‑path concurrency in relatively stable environments  

Source protocol roles:

- **REALITY** — session integrity and endpoint verification  
- **uTLS** — client‑behavior handshake adaptation  
- **XTLS‑Vision** — efficient encrypted framing  
- **VLESS** — lightweight, flexible session model  

The result is a high‑efficiency transport with predictable performance and
well‑defined routing boundaries under RUTL.

---

### 3.2 ruxsv — Stealth‑Oriented Protocol

**Amalgamates: REALITY + uTLS + XHTTP (Stream) + VLESS**

ruxsv is designed for:

- Restrictive connectivity environments  
- Environments where observable characteristics must be minimized  

Source protocol roles:

- **REALITY** — endpoint verification with controlled exposure  
- **uTLS** — handshake behavior aligned with real‑world client patterns  
- **XHTTP (Stream)** — stream‑oriented HTTP behavior for transport shaping  
- **VLESS** — flexible, metadata‑minimal session model  

The result is a conservative, stealth‑oriented transport with capabilities tuned
for constrained environments.

---

### 3.3 ruxpv — Survival‑Oriented Protocol

**Amalgamates: REALITY + uTLS + XHTTP (Packet) + VLESS**

ruxpv is designed for:

- Unreliable or unstable networks  
- High‑loss paths and degraded connectivity conditions  

Source protocol roles:

- **REALITY** — session integrity under unstable conditions  
- **uTLS** — handshake compatibility across diverse environments  
- **XHTTP (Packet)** — packet‑oriented behavior for granular modulation and recovery  
- **VLESS** — minimal metadata session model with flexible routing compatibility  

The result is a survival‑oriented transport that prioritizes continuity and
degradation tolerance over raw performance.

---

## 4. Relationship to Other Architectural Modules

### 4.1 RUTL

All Amalgamated Protocols are **built on top of RUTL**.  
They rely on RUTL for:

- Lifecycle structure  
- Capability negotiation  
- Error semantics  
- Routing boundaries  

RUTL ensures that all protocols behave coherently.

---

### 4.2 Source Protocols

Source protocols provide internal components but are **not exposed**.  
They contribute:

- Handshake primitives  
- Framing logic  
- Behavioral characteristics  

The amalgamation process integrates these components into cohesive designs.

---

### 4.3 Node Discovery

Discovery uses protocol capabilities to:

- Rank nodes  
- Filter incompatible transports  
- Apply routing policies  

---

### 4.4 AI‑Driven Routing

Routing selects protocols based on:

- Capability requirements  
- Environmental constraints  
- Performance and risk signals  

---

### 4.5 Data Flow

The data‑flow architecture uses each protocol’s:

- Session model  
- Framing behavior  
- Routing boundaries  

to define packet movement across multi‑hop paths.

---

## 5. Extensibility and Future Evolution

The Amalgamated Protocol framework is designed for long‑term evolution.  
Future extensions may include:

- Additional protocol families  
- Enhanced capability categories  
- New handshake structures  
- Extended routing boundaries  
- Hybrid or adaptive protocol designs  

New protocols can be introduced without modifying RUTL or existing transports.

---

## 6. Summary

The Amalgamated Protocols form the second core of Dawnset.  
They provide specialized, capability‑driven transport designs engineered from
REALITY, uTLS, XTLS‑Vision, XHTTP (Stream / Packet), and VLESS, and unified
under RUTL.

By offering performance‑, stealth‑, and survival‑oriented behaviors, they enable
adaptive routing, resilient connectivity, and long‑term architectural flexibility.

They are fully integrated, fully engineered transports—not simple stacks—and they
serve as the operational backbone of Dawnset’s transport layer.
