
# Node Discovery Architecture

The **Node Discovery** subsystem provides decentralized, resilient, and
transport‑agnostic distribution of node metadata for **Dawnset**.  
It ensures that clients can obtain fresh, validated, and capability‑rich node
information across diverse connectivity environments.

Node discovery integrates with:

- **RUTL** — for capability surfaces  
- **Amalgamated Protocols** — for transport compatibility  
- **Routing Engine** — for heuristic + lightweight RL scoring  
- **Deployment Models** — for regional or distributed metadata  

The subsystem is designed to operate reliably even when individual discovery
channels experience degradation or reachability issues.

---

## 1. Design Principles

### **1.1 Decentralization**
No single discovery channel is authoritative.  
Multiple independent sources contribute to the final node list.

### **1.2 Redundancy**
DHT, DNS TXT, and optional policy channels operate in parallel.

### **1.3 Resilience**
Discovery must remain functional across:

- regional reachability anomalies  
- partial network partitioning  
- inconsistent metadata sources  

### **1.4 Freshness**
Clients must always be able to retrieve up‑to‑date node metadata and policies.

### **1.5 Minimal Metadata Exposure**
Discovery queries reveal no sensitive client information.

---

## 2. Discovery Architecture Overview

```
Client
   ↓
Discovery Engine
   ↓
[DHT] [DNS TXT] [Policy Channels]
   ↓
Aggregated Node Metadata
   ↓
Node Ranking & Scoring
   ↓
Routing Engine
```

The discovery engine aggregates, validates, and prioritizes node metadata before
passing it to the routing engine.

---

## 3. DHT‑Based Discovery

The **Distributed Hash Table (DHT)** is the primary decentralized mechanism.

### Characteristics

- No central authority  
- Resistant to network partitioning  
- Supports natural churn and rotation  
- Nodes publish capability‑rich metadata  
- Clients retrieve entries using hashed keys  

### Published Metadata

```
address
port
capabilities (RUTL)
amalgamated_protocols
public_key
last_seen
region
score_hint
```

### Strengths

- Highly resilient  
- Scales naturally  
- Independent of DNS infrastructure  

### Considerations

- Requires bootstrap nodes  
- Slightly slower for first‑time discovery  

---

## 4. DNS TXT‑Based Fallback

DNS TXT records provide a lightweight, globally accessible fallback channel.

### Characteristics

- Fast initial discovery  
- Easy to update  
- Supports multiple TXT entries  
- Works in most network environments  

### Example TXT Payload

```
node1.example.com 443 ruxvv ruxsv
node2.example.net 443 ruxpv
```

### Strengths

- Low latency  
- Simple to deploy  
- Complements DHT  

### Considerations

- Requires domain ownership  
- Should not be the sole discovery mechanism  

---

## 5. Policy Channels

Policies provide additional metadata that influences routing and node selection.

### Policy Types

- Preferred transports  
- Regional routing hints  
- Node deprecation notices  
- Capability requirements  
- Fallback ordering  

### Delivery Mechanisms

- DHT entries  
- DNS TXT  
- Optional remote endpoints  

### Example Policy Structure

```
preferred_transports ruxsv ruxpv
avoid_regions region_x
deprecated_nodes node123
fallback_order ruxpv ruxsv ruxvv
```

Policies are merged with node metadata before scoring.

---

## 6. Node Ranking & Scoring

The discovery engine assigns a score to each node using:

- Availability  
- Latency estimates  
- Historical reliability  
- Supported capabilities (RUTL)  
- Amalgamated Protocol compatibility  
- Regional reachability  
- Policy hints  

### Example Scoring Structure

```
node_id
availability_score
capability_score
performance_score
region_score
policy_score
final_score
```

### Integration with Routing Engine

The routing engine applies:

- **heuristic scoring**  
- **lightweight RL adjustments**  

to refine node selection based on real‑world outcomes.

Discovery provides the raw metadata; routing provides adaptive decision logic.

---

## 7. Security Considerations

### Threats

- Inconsistent metadata  
- Malformed entries  
- Replay of outdated node information  
- Unauthorized node injection  

### Mitigations

- Signature verification  
- Multi‑source validation  
- Expiration timestamps  
- Policy‑driven filtering  
- Redundant discovery channels  

Discovery does not rely on any single trust anchor.

---

## 8. Interaction with Other Architectural Modules

### **RUTL**
Discovery exposes capability surfaces used by RUTL‑compatible transports.

### **Amalgamated Protocols**
Discovery indicates which transports each node supports.

### **Routing Engine**
Uses discovery metadata as input for heuristic + RL‑based path selection.

### **Deployment Models**
Discovery adapts to:

- single‑node  
- multi‑node  
- edge‑optimized  
- distributed deployments  

by adjusting metadata scope and region information.

---

## 9. Summary

The Node Discovery subsystem provides decentralized, resilient, and capability‑rich
metadata for Dawnset.  
By combining DHT, DNS TXT, policy channels, and structured scoring, it ensures:

- Freshness  
- Redundancy  
- Transport‑agnostic behavior  
- Compatibility with RUTL  
- Adaptive routing through heuristic + RL integration  

This foundation enables the routing engine to construct stable multi‑hop paths
across diverse connectivity environments.
