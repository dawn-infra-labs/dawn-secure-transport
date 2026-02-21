# Data Flow Architecture

This document describes the end‑to‑end data flow inside Dawn Bridge Core, including handshake sequences, routing decisions, encryption layers, and multi-hop forwarding behavior.  
It provides a unified view of how packets move through the system across all transports and routing layers.

---

## 1. High-Level Overview

Dawn Bridge Core processes data through five major stages:

1. **Session Initialization**  
2. **Handshake & Key Exchange**  
3. **Route Selection**  
4. **Multi-Hop Forwarding**  
5. **Response Path & Session Rotation**

Each stage is transport-agnostic and applies to all protocols (`REALITY`, `uTLS`, `XTLS‑Vision`, `XHTTP`, `VLESS`, `TUIC v5`).

---

## 2. Session Initialization

When a client initiates a connection, the system prepares:

- Ephemeral identity  
- Supported KEX list (`x25519`, `kyber`, `hybrid`)  
- Transport capabilities  
- Routing preferences  
- Risk profile for the session  

The client does **not** reveal its final destination at this stage.

---

## 3. Handshake & Key Exchange

### 3.1 Hybrid KEX

The handshake negotiates:

- Transport protocol  
- Cipher suite  
- Hybrid key exchange method  

The shared secret is derived as:

`shared_secret = KDF( x25519_secret || kyber_secret )`

### 3.2 Handshake Flow

1. Client → Server: `ClientHello`  
2. Server → Client: `ServerHello`  
3. Both sides: derive ephemeral keys  
4. Both sides: confirm integrity  
5. Secure channel established  

After this point, all metadata and routing instructions are encrypted.

---

## 4. Route Selection

Once the secure channel is established, the client requests a route.

### 4.1 AI Routing Engine

Inputs include:

- Node latency  
- Historical reliability  
- Jurisdiction risk  
- Traffic load  
- Past anomaly scores  
- User’s risk preference  

The engine outputs:

- A multi-hop path  
- Per-hop encryption keys  
- Expected rotation interval  

### 4.2 Route Descriptor

    RouteDescriptor {
        hops: [node1, node2, node3, ...]
        per_hop_keys: [...]
        risk_score: int
        rotation_after: duration
    }

This descriptor is encrypted and sent to the first hop only.

---

## 5. Multi-Hop Forwarding

### 5.1 Onion Encryption

Each hop receives only:

- The encrypted payload  
- The next hop address  
- A per-hop decryption key  

No hop can see both source and destination.

### 5.2 Forwarding Flow

1. Client encrypts payload N times (one per hop).  
2. First hop decrypts one layer → forwards to hop 2.  
3. Hop 2 decrypts one layer → forwards to hop 3.  
4. Final hop decrypts last layer → sends to destination.  

Each hop sees only:

- `previous_hop`  
- `next_hop`  
- `payload_for_this_hop`

Nothing else.

---

## 6. Response Path

Responses follow the same path in reverse:

1. Destination → final hop  
2. Final hop encrypts one layer  
3. Middle hops add encryption layers  
4. First hop sends fully wrapped response to client  
5. Client removes all layers  

This ensures symmetric anonymity.

---

## 7. Session Rotation

To prevent long-term correlation:

- Keys rotate periodically (`rotation_interval = 30 minutes`)  
- Routes rotate based on risk score  
- Transport sessions may re-handshake  
- Node selection may change mid-session  

Rotation is transparent to the user and does not break connections.

---

## 8. Failure Handling

### 8.1 Hop Failure  
If a hop becomes unreachable:

- AI routing engine selects a replacement  
- New route descriptor is generated  
- Session continues without interruption  

### 8.2 Transport Failure  
If a transport fails (e.g., QUIC blocked):

- System falls back to another transport (`XHTTP`, `XTLS`, etc.)  
- Session keys remain valid  
- No metadata leakage occurs  

### 8.3 Node Misbehavior  
If a node shows anomalies:

- Risk score increases  
- Node is removed from future paths  
- Session may rotate immediately  

---

## 9. End-to-End Flow Summary

1. Client initializes session  
2. Hybrid handshake establishes secure channel  
3. AI routing engine selects multi-hop path  
4. Client applies onion encryption  
5. Traffic flows through hops  
6. Responses return through reverse onion layers  
7. Keys and routes rotate periodically  
8. Failures trigger seamless rerouting  

This architecture ensures confidentiality, unlinkability, and resilience against active and passive adversaries.
