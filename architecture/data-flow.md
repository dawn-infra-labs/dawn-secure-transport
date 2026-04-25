
# Data Flow Architecture

This document describes the end‑to‑end data flow within **Dawnset**, covering
session initialization, handshake sequencing, capability negotiation, routing
decisions, multi‑hop forwarding, and session rotation.  
It provides a unified view of how data moves through the system across all
Amalgamated Protocols and routing layers.

The data‑flow architecture is fully **transport‑agnostic** and relies on:

- **RUTL** for lifecycle and capability semantics  
- **Amalgamated Protocols** for transport behavior  
- **Node Discovery** for node metadata  
- **Heuristic + lightweight RL routing** for adaptive path selection  

---

## 1. High‑Level Overview

Dawnset processes data through five major stages:

1. **Session Initialization**  
2. **Handshake & Capability Negotiation**  
3. **Route Selection**  
4. **Multi‑Hop Forwarding**  
5. **Response Path & Session Rotation**

These stages apply uniformly across all transports.

---

## 2. Session Initialization

When a client initiates a connection, it prepares:

- Ephemeral session identity  
- Supported key‑exchange capabilities  
- RUTL capability set  
- Application‑level routing context  
- Initial heuristic/RL‑derived risk coefficient  

At this stage, the client does **not** reveal destination information.

Session initialization is strictly local and does not transmit metadata externally.

---

## 3. Handshake & Capability Negotiation

### 3.1 Unified Handshake Boundary

All Amalgamated Protocols implement the RUTL handshake boundary, which includes:

- Transport selection  
- Capability negotiation  
- Session key establishment  
- Error‑model alignment  
- Routing boundary confirmation  

The handshake is transport‑specific internally but unified externally through RUTL.

---

### 3.2 Key Exchange

Dawnset supports:

- Classical key exchange  
- PQC key exchange  
- Hybrid key exchange  

The shared secret is derived through a transport‑agnostic KDF process.

---

### 3.3 Handshake Flow

1. Client → Server: capability declaration  
2. Server → Client: capability confirmation  
3. Both sides: derive ephemeral keys  
4. Both sides: validate session integrity  
5. Secure session established  

After this point, all routing metadata and session instructions are encrypted.

---

## 4. Route Selection

Once the secure session is established, the client requests a route.

### 4.1 Routing Engine Inputs

The routing engine evaluates:

- Node discovery metadata  
- Transport capabilities  
- Historical session outcomes  
- Latency and throughput estimates  
- Environmental variability  
- Heuristic scoring factors  
- Lightweight RL adjustments  

### 4.2 Routing Engine Outputs

The engine produces a **Route Descriptor**:

```
RouteDescriptor {
    hops: [node1, node2, node3, ...]
    per_hop_keys: [...]
    capability_requirements: CapabilitySet
    rotation_after: duration
}
```

The descriptor is encrypted and delivered only to the first hop.

---

## 5. Multi‑Hop Forwarding

### 5.1 Layered Forwarding Model

Dawnset uses a **layered forwarding model** compatible with all transports:

- Each hop receives only the portion of the descriptor relevant to that hop  
- Each hop processes a single layer of the payload  
- No hop has visibility into the full path  

This ensures strict routing‑boundary separation.

---

### 5.2 Forwarding Flow

1. Client applies layered encapsulation (one layer per hop).  
2. First hop removes its layer → forwards to hop 2.  
3. Hop 2 removes its layer → forwards to hop 3.  
4. Final hop removes last layer → forwards to destination.  

Each hop sees only:

- `previous_hop`  
- `next_hop`  
- `payload_for_this_hop`  

Nothing else.

---

## 6. Response Path

Responses follow the same layered structure in reverse:

1. Destination → final hop  
2. Final hop applies its layer  
3. Middle hops add their layers  
4. First hop sends fully layered response to client  
5. Client removes all layers  

This ensures symmetric behavior across request and response paths.

---

## 7. Session Rotation

To maintain long‑term resilience:

- Session keys rotate periodically  
- Routes rotate based on heuristic/RL‑derived risk coefficients  
- Transport sessions may re‑handshake  
- Node selection may change mid‑session  

Rotation is transparent and does not interrupt active connections.

---

## 8. Failure Handling

### 8.1 Hop Failure

If a hop becomes unreachable:

- Routing engine computes a replacement path  
- A new Route Descriptor is generated  
- Session continues without interruption  

### 8.2 Transport Degradation

If a transport becomes unsuitable:

- RUTL selects an alternative transport  
- Session keys remain valid  
- Capability boundaries remain intact  

### 8.3 Node Anomalies

If a node exhibits anomalous behavior:

- Its score decreases in the routing engine  
- It is deprioritized or removed from future paths  
- Session may rotate immediately  

---

## 9. End‑to‑End Flow Summary

1. Client initializes session  
2. RUTL handshake establishes secure channel  
3. Routing engine selects multi‑hop path (heuristic + RL)  
4. Client applies layered encapsulation  
5. Traffic flows through hops  
6. Responses return through reverse layers  
7. Keys and routes rotate periodically  
8. Failures trigger seamless rerouting  

This architecture ensures stable, capability‑driven, and adaptive communication
across diverse connectivity environments.
