# Node Discovery Architecture

## 1. Overview

The node discovery subsystem provides censorship‑resilient distribution of node information.  
It ensures that clients can obtain fresh, reliable, and tamper‑resistant endpoint data even under active blocking, DNS poisoning, or regional network interference.

Dawn Bridge Core uses a multi‑channel discovery strategy combining:

- Distributed Hash Table (DHT)
- DNS TXT‑based fallback
- Remote policy delivery
- Node ranking and scoring

This layered approach ensures that no single discovery mechanism becomes a point of failure.

---

## 2. Design Principles

### Decentralization
Avoid reliance on centralized servers or single points of failure.

### Redundancy
Multiple discovery channels operate in parallel.

### Censorship Resistance
Discovery must survive DNS poisoning, IP blocking, and protocol fingerprinting.

### Freshness
Clients must always be able to obtain up‑to‑date node lists and routing policies.

### Minimal Metadata
Discovery queries should not reveal sensitive information about the client.

---

## 3. Discovery Flow Overview

```
Client
-> Discovery Engine
-> DHT DNS TXT Policies
-> Ranked Node List
```

The discovery engine aggregates data from multiple sources, validates it,  
and produces a prioritized list of nodes for the routing engine.

---

## 4. DHT‑Based Discovery

The Distributed Hash Table is the primary decentralized mechanism.

### Characteristics
- No central server
- Resistant to IP blocking
- Nodes publish endpoint metadata
- Clients retrieve entries using hashed keys
- Supports rotation and churn

### Published Metadata

```
address
port
transport_types
public_key
last_seen
score
```

### Strengths
- Highly censorship‑resistant
- Scales naturally
- No single point of failure

### Weaknesses
- Requires bootstrap nodes
- Slower than DNS for initial discovery

---

## 5. DNS TXT‑Based Fallback

DNS TXT records provide a lightweight, globally accessible fallback channel.

### Characteristics
- Works even when DHT is unreachable
- Easy to update
- Can be cached by clients
- Supports multiple TXT entries

### Example TXT Payload

```
node1.example.com 443 xtls hysteria2
node2.example.net 443 reality trojan
```

### Strengths
- Fast
- Simple
- Works in most networks

### Weaknesses
- Vulnerable to DNS poisoning
- Requires domain ownership

---

## 6. Remote Policy Delivery

Policies include:

- Preferred transports
- Risk scores
- Regional routing rules
- Node deprecation notices
- Transport fallback priorities

Policies are delivered through:

- DHT entries
- DNS TXT
- Optional remote endpoints

### Example Policy Structure

```
preferred_transports reality xtls
avoid_regions region_x
deprecated_nodes node123
fallback_order xhttp trojan
```

---

## 7. Node Ranking & Scoring

The discovery engine assigns a score to each node based on:

- Availability
- Latency
- Historical reliability
- Transport support
- Regional blocking patterns
- Policy hints

### Example Scoring Structure

```
node_id
availability_score
performance_score
risk_score
final_score
```

Nodes with higher final scores are prioritized by the routing engine.

---

## 8. Security Considerations

### Threats
- DNS poisoning
- DHT pollution
- Fake node injection
- Replay attacks
- Metadata correlation

### Mitigations
- Signature verification
- Multi‑source validation
- Expiration timestamps
- Policy‑driven filtering
- Redundant discovery channels

---

## 9. Summary

The node discovery subsystem ensures that Dawn Bridge Core can operate reliably in adversarial environments.  
By combining DHT, DNS TXT, remote policies, and scoring, the system achieves:

- High resilience
- Decentralization
- Freshness
- Censorship resistance
- Adaptive node selection

This foundation enables the routing engine to build robust multi‑hop paths even under heavy network interference.
