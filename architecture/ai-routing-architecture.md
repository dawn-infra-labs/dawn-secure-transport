# AI Routing Architecture

The AI Routing Engine leverages multi-factor heuristic weighting and lightweight reinforcement learning to provide adaptive, and privacy‑preserving path selection within **dawnset**.  
It evaluates network conditions, application behavior, and transport performance to determine the optimal routing strategy for each connection in **challenging connectivity environments (restricted, unstable, filtered, or unreliable networks)**.

This module integrates tightly with the transport framework and node discovery system, forming the decision‑making layer of the entire architecture.

---

## Background

Modern connectivity challenges include dynamic blocking strategies such as:

- protocol fingerprinting  
- active probing  
- selective throttling  
- application‑level traffic classification  
- behavioral analysis  

Static routing strategies cannot remain reliable in such environments.  
A resilient communication system must adapt continuously, learning from failures and adjusting routing decisions in real time.

The Intelligent Routing Engine provides this adaptability.

---

## Goals

The routing engine is designed to:

- maximize connection success rate  
- minimize detection risk  
- optimize latency and throughput  
- dynamically select the best transport protocol  
- support multi‑hop routing for high‑risk scenarios  
- automatically determine which applications require proxying  
- apply probabilistic decision models (such as Multi-Armed Bandit) to learn from historical performance and optimize the exploration-exploitation balance over time  

---

## Architecture Overview

The Intelligent Routing Engine consists of four major components:

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
- connectivity history  
- protocol detectability  
- regional filtering patterns  
- user‑defined policies  

This engine utilizes a heuristic scoring algorithm that processes real-time network telemetry.  
It calculates a dynamic risk coefficient by weighing factors such as protocol-specific entropy and handshake success rates.

Risk scores influence:

- whether to proxy  
- whether to use multi‑hop  
- which transport protocol to select  

---

### 3. Transport Selector
Chooses the optimal transport protocol from:

- REALITY  
- uTLS  
- XTLS‑Vision  
- XHTTP  
- VLESS  
- TUIC v5  

Selection is based on:

- connectivity risk  
- bandwidth requirements  
- latency sensitivity  
- historical success rate  
- probing resistance  

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

The Intelligent Routing Engine automatically determines **which applications should use the proxy and which should not**.

### Why this is necessary
- Sensitive apps (e.g., messaging platforms) must always use proxy  
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
- **Dynamic (heuristic/reinforcement model decides per connection)**  
- **Protocol‑specific routing**  
- **Multi‑hop enforcement for high‑risk apps**  

This capability is essential for both performance and resilience.

---

## Data Flow

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

The Intelligent Routing Engine is designed to support:

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
- On-device reinforcement learning: Integrating lightweight agents for real-time edge decision-making without cloud dependency  
- collaborative (privacy‑preserving) performance sharing  
- advanced anomaly detection  
- per‑domain routing policies  
- predictive connectivity modeling
