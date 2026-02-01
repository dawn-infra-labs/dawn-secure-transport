# AI Routing Architecture

## 1. Overview

The AI routing subsystem selects optimal paths across multiple nodes under censorship, congestion, and dynamic network conditions.  
It evaluates transport performance, regional blocking patterns, and policy constraints to produce stable and efficient routes.

The routing engine operates continuously and adapts to real‑time conditions using lightweight scoring models.

---

## 2. Design Principles

### Adaptivity
Routing decisions must adjust to changing network conditions.

### Resilience
Routes must remain functional even when individual nodes degrade or become unreachable.

### Transport Awareness
Different transports behave differently under censorship.  
The routing engine must understand their characteristics.

### Minimal Overhead
Routing logic must remain lightweight and efficient.

---

## 3. Routing Flow Overview

```
Client
-> Routing Engine
-> Node Candidates
-> Scoring Model
-> Selected Route
```

The routing engine evaluates available nodes, applies scoring, and selects the best route for the client.

---

## 4. Node Candidate Collection

Node candidates come from:

- Discovery subsystem
- Cached historical data
- Remote policies
- Local heuristics

Each candidate includes:

```
node_id
address
port
transports
latency
availability
risk_score
```

---

## 5. Transport Evaluation

Each transport type has unique characteristics.  
The routing engine evaluates them based on:

- Latency
- Jitter
- Throughput
- Failure rate
- Censorship resistance

### Example Transport Metrics

```
transport xtls
latency 40ms
jitter 5ms
throughput high
failure_rate low

transport reality
latency 55ms
jitter 7ms
throughput medium
failure_rate very_low

transport hysteria2
latency 30ms
jitter 3ms
throughput very_high
failure_rate medium
```

---

## 6. Scoring Model

The scoring model assigns a final score to each node and transport combination.

Inputs include:

- Latency score
- Stability score
- Transport preference score
- Regional risk score
- Policy hints
- Historical performance

### Example Scoring Structure

```
node_id
transport xtls
latency_score 0.82
stability_score 0.91
risk_score 0.12
policy_score 0.95
final_score 0.88
```

Nodes with higher final scores are prioritized.

---

## 7. Route Selection

The routing engine selects:

- Single‑hop routes
- Multi‑hop routes
- Transport fallback sequences

### Example Route Output

```
route_id 001
hop1 node_a xtls
hop2 node_b reality
hop3 node_c hysteria2
final_score 0.91
```

---

## 8. Continuous Adaptation

The routing engine continuously monitors:

- Latency changes
- Node failures
- Transport degradation
- Regional blocking events

When conditions change, the engine recalculates scores and updates the route.

### Example Adaptation Event

```
event latency_spike
node node_b
old_latency 55ms
new_latency 120ms
action reroute
```

---

## 9. Security Considerations

### Threats
- Route poisoning
- Fake node injection
- Timing correlation attacks
- Transport fingerprinting

### Mitigations
- Signature verification
- Multi‑source validation
- Randomized route selection
- Transport obfuscation
- Periodic re‑evaluation

---

## 10. Summary

The AI routing subsystem provides adaptive, censorship‑resistant path selection.  
By combining transport evaluation, scoring models, and continuous monitoring, it ensures:

- High reliability
- Strong censorship resistance
- Efficient performance
- Dynamic adaptation

This routing layer works together with discovery and transport modules to maintain stable connectivity under adversarial conditions.
