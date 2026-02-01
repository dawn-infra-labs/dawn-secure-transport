# AI Routing Architecture

## 1. Overview

The AI routing subsystem selects optimal paths across multiple nodes under censorship, congestion, and dynamic network conditions.  
It evaluates transport performance, regional blocking patterns, and policy constraints to produce stable and efficient routes.

The routing engine operates continuously and adapts to real‑time conditions using lightweight scoring models.

---

## 2. Design Principles

### Adaptivity
Routing decisions must adjust to changing network conditions and feedback from live measurements.

### Resilience
Routes must remain functional even when individual nodes degrade, fail, or become unreachable.

### Transport Awareness
Different transports behave differently under censorship and congestion.  
The routing engine must understand their characteristics and trade‑offs.

### Minimal Overhead
Routing logic must remain lightweight and efficient, avoiding heavy computation on constrained clients.

---

## 3. Routing Flow Overview

Client  
-> Routing Engine  
-> Node Candidates  
-> Scoring Model  
-> Selected Route  

The routing engine evaluates available nodes, applies scoring, and selects the best route for the client based on current conditions and policies.

---

## 4. Node Candidate Collection

Node candidates are collected from multiple sources:

- Discovery subsystem (DHT, DNS TXT, policies)
- Cached historical performance data
- Remote policy hints
- Local heuristics and recent connection results

Each candidate includes basic metadata and dynamic metrics:

node_id  
address  
port  
transports  
latency  
availability  
risk_score  
region  

This information is used as input to the scoring model.

---

## 5. Transport Evaluation

Each transport type has unique behavior under censorship and load.  
The routing engine evaluates transports along several dimensions:

- Latency
- Jitter
- Throughput
- Failure rate
- Censorship resistance
- Handshake robustness

Example transport metrics:

transport xtls  
latency 40ms  
jitter 5ms  
throughput high  
failure_rate low  
censorship_resistance high  

transport reality  
latency 55ms  
jitter 7ms  
throughput medium  
failure_rate very_low  
censorship_resistance very_high  

transport hysteria2  
latency 30ms  
jitter 3ms  
throughput very_high  
failure_rate medium  
censorship_resistance medium  

These metrics are combined with policy preferences to determine which transports are preferred in a given environment.

---

## 6. Scoring Model

The scoring model assigns a final score to each node and transport combination.  
It is designed to be simple enough to run on clients while still capturing key trade‑offs.

Inputs include:

- Latency score
- Stability score
- Transport preference score
- Regional risk score
- Policy hints
- Historical performance trends

Example scoring structure:

node_id  
transport xtls  
latency_score 0.82  
stability_score 0.91  
risk_score 0.12  
policy_score 0.95  
history_score 0.87  
final_score 0.88  

Nodes with higher final scores are prioritized when building routes.

---

## 7. Route Selection

The routing engine can select:

- Single‑hop routes (direct to one node)
- Multi‑hop routes (chained through several nodes)
- Transport fallback sequences for resilience

Example route output:

route_id 001  
hop1 node_a xtls  
hop2 node_b reality  
hop3 node_c hysteria2  
final_score 0.91  

The engine may also maintain multiple candidate routes and switch between them when conditions change.

---

## 8. Continuous Adaptation

The routing engine continuously monitors:

- Latency changes
- Packet loss
- Node failures
- Transport degradation
- Regional blocking events
- Policy updates

When conditions change beyond defined thresholds, the engine recalculates scores and updates the active route.

Example adaptation event:

event latency_spike  
node node_b  
old_latency 55ms  
new_latency 120ms  
action reroute  
reason performance_degradation  

This allows the system to react quickly to censorship actions or network congestion.

---

## 9. Security Considerations

### Threats

- Route poisoning
- Fake node injection
- Timing correlation attacks
- Transport fingerprinting
- Policy manipulation

### Mitigations

- Signature verification for node metadata and policies
- Multi‑source validation of discovery data
- Randomized route selection within a safe score range
- Transport obfuscation and protocol camouflage
- Periodic re‑evaluation of routes and transports

---

## 10. Summary

The AI routing subsystem provides adaptive, censorship‑resistant path selection across heterogeneous transports and nodes.  
By combining transport evaluation, scoring models, and continuous monitoring, it ensures:

- High reliability under changing conditions  
- Strong censorship resistance  
- Efficient performance  
- Dynamic adaptation to network and policy shifts  

This routing layer works together with discovery and transport modules to maintain stable connectivity in adversarial environments.
