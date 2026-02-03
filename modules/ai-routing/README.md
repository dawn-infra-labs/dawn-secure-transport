# AI Routing Module

The AI Routing module provides intelligent, adaptive, and censorship‑resistant routing decisions for Dawn Bridge Core.  
It evaluates application behavior, network conditions, censorship risk, and transport performance to determine the optimal routing strategy for each connection.

This module integrates closely with the transport framework and node discovery system, forming the decision‑making layer of the entire architecture.

---

## Background

Modern censorship systems employ dynamic blocking strategies such as:

- protocol fingerprinting  
- active probing  
- selective throttling  
- application‑level traffic classification  
- behavioral analysis  

Static routing strategies cannot survive in such environments.  
A resilient circumvention system must adapt continuously, learning from failures and adjusting routing decisions in real time.

The AI Routing module provides this adaptability.

---

## Goals

This module is designed to:

- maximize connection success rate  
- minimize censorship detection  
- optimize latency and throughput  
- dynamically select the best transport protocol  
- support multi‑hop routing for high‑risk scenarios  
- automatically determine which applications require proxying  
- learn from historical performance and adapt over time  
- integrate seamlessly with node discovery and transport framework  

---

## Architecture Overview

The AI Routing module consists of four major components:

### 1. Application Classifier
Identifies the originating application or traffic type using:

- package name / process metadata  
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

## Directory Structure

```text
ai-routing/
│
├── src/
│   ├── classifier.rs
│   ├── risk.rs
│   ├── selector.rs
│   ├── optimizer.rs
│   └── models.rs
│
└── README.md
```

---

## Core Interfaces (English‑only code block)

Application classifier:

```rust
pub trait AppClassifier {
    fn classify(&self, metadata: &FlowMetadata) -> AppCategory;
}
```

Risk assessment:

```rust
pub trait RiskEngine {
    fn score(&self, ctx: &RoutingContext) -> RiskLevel;
}
```

Transport selection:

```rust
pub trait TransportSelector {
    fn select(&self, ctx: &RoutingContext) -> String;
}
```

Path optimization:

```rust
pub trait PathOptimizer {
    fn build_path(&self, nodes: Vec<NodeInfo>, ctx: &RoutingContext) -> RoutingPath;
}
```

---

## Per‑Application Routing

The AI Routing module automatically determines **which applications should use the proxy and which should not**.

Decision outcomes include:

- **Force Proxy**  
- **Force Direct**  
- **Dynamic (AI decides per connection)**  
- **Protocol‑specific routing**  
- **Multi‑hop enforcement for high‑risk apps**  

This capability is essential for both performance and censorship resistance.

---

## Data Flow

Routing decisions follow this pipeline:

1. **Application Classifier**  
2. **Risk Assessment Engine**  
3. **Transport Selector**  
4. **Path Optimizer**  
5. **Transport Framework**  
6. **Network**

Each layer contributes to the final routing decision.

---

## Integration with Other Modules

### With Transport Framework
AI Routing receives:

- protocol capabilities  
- performance metrics  
- detectability characteristics  
- handshake success/failure signals  

### With Node Discovery
AI Routing receives:

- fresh node lists  
- node metadata  
- performance metrics  
- risk indicators  

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

The module is designed to support:

- new routing strategies  
- new risk models  
- new application classifiers  
- region‑specific routing policies  
- user‑defined overrides  
- plugin‑based routing logic  

---

## Future Work

Planned enhancements include:

- reinforcement learning‑based routing  
- collaborative (privacy‑preserving) performance sharing  
- advanced anomaly detection  
- predictive censorship modeling  
- PQC‑ready routing strategies
