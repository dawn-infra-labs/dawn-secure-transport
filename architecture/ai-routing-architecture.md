# AI Routing Architecture

The AI Routing Engine is responsible for intelligent, adaptive, and censorship‑resistant path selection within Dawn Bridge Core.  
It evaluates network conditions, censorship risk, application behavior, and transport performance to determine the optimal routing strategy for each connection.

This module integrates tightly with the transport framework and node discovery system, forming the decision‑making layer of the entire architecture.

---

## Background

Modern censorship systems employ dynamic blocking strategies, including:

- protocol fingerprinting  
- active probing  
- selective throttling  
- application‑level traffic classification  
- behavioral analysis  

Static routing strategies cannot survive in such environments.  
A resilient circumvention system must adapt continuously, learning from failures and adjusting routing decisions in real time.

The AI Routing Engine provides this adaptability.

---

## Goals

The routing engine is designed to:

- maximize connection success rate  
- minimize censorship detection  
- optimize latency and throughput  
- dynamically select the best transport protocol  
- support multi‑hop routing for high‑risk scenarios  
- automatically determine which applications require proxying  
- learn from historical performance and adapt over time  

---

## Architecture Overview

The AI Routing Engine consists of four major components:

### 1. Application Classifier
Identifies the originating application or traffic type using:

- package name (mobile)  
- process metadata (desktop)  
- DNS queries  
- TLS/SNI fingerprints  
- traffic behavior patterns  

This enables **per‑application routing decisions**.

---

### 2. Risk Assessment Engine
Assigns a risk score to each connection based on:

- application sensitivity  
- destination domain/IP  
- censorship history  
- protocol detectability  
- regional blocking patterns  
- user‑defined policies  

Risk scores influence:

- whether to proxy  
- whether to use multi‑hop  
- which transport protocol to select  

---

### 3. Transport Selector
Chooses the optimal transport protocol from:

- xHTTP  
- XTLS  
- Reality  
- VLESS  
- Hysteria2  
- Trojan  

Selection is based on:

- censorship risk  
- bandwidth requirements  
- latency sensitivity  
- historical success rate  
- active probing resistance  

---

### 4. Path Optimizer
Determines:

- single‑hop vs multi‑hop  
- node selection  
- fallback strategies  
- retry logic  
- load balancing  

It integrates with the node discovery system to obtain fresh node lists and performance metrics.

---

## Per‑Application Routing

The AI Routing Engine automatically determines **which applications should use the proxy and which should not**.

### Why this is necessary
- Sensitive apps (e.g., Telegram, Signal) must always use proxy  
- Local apps (e.g., banking, payments) must never use proxy  
- Some apps require dynamic decisions based on server location  
- Reduces unnecessary load on the proxy network  
- Minimizes detection risk  

### How it works
The engine evaluates:

- app identity  
- traffic patterns  
- destination domain  
- risk score  
- historical success rate  
- user preferences  

### Decision outcomes
- **Force Proxy**  
- **Force Direct**  
- **Dynamic (AI decides per connection)**  
- **Protocol‑specific routing**  
- **Multi‑hop enforcement for high‑risk apps**  

This capability is essential for both performance and censorship resistance.

---

## Data Flow

```
Application
   ↓
Application Classifier
   ↓
Risk Assessment Engine
   ↓
Transport Selector
   ↓
Path Optimizer
   ↓
Transport Framework
   ↓
Network
```

Each layer contributes to the final routing decision.

---

## Security Considerations

- No application metadata is transmitted externally  
- Risk scoring is local and privacy‑preserving  
- Routing decisions minimize exposure of sensitive traffic  
- Multi‑hop routing reduces correlation risk  
- Transport selection avoids detectable patterns  
- Adaptive learning avoids repeating failed strategies  

---

## Extensibility

The AI Routing Engine is designed to support:

- new transport protocols  
- new risk models  
- new application classifiers  
- region‑specific routing policies  
- user‑defined overrides  
- plugin‑based routing strategies  

The architecture ensures future growth without breaking compatibility.

---

## Future Work

Planned enhancements include:

- integration with PQC‑ready transports  
- reinforcement learning‑based routing  
- collaborative (privacy‑preserving) performance sharing  
- advanced anomaly detection  
- per‑domain routing policies  
- predictive censorship modeling
