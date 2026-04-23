✦ # Crypto Architecture & Future Extensions

This document describes **dawnset**’s cryptographic foundations, post‑quantum readiness, hybrid key exchange strategy, and the extension framework that allows the system to adopt new protocols and cryptographic primitives without breaking backward compatibility.

The goal is to ensure that **dawnset** remains secure, adaptable, and future‑proof across evolving threat models, including quantum‑capable adversaries.

---

## 1. Cryptographic Principles

**dawnset** follows four core principles:

1. **Forward Secrecy (FS)**  
   Every session uses ephemeral keys. Compromise of long‑term keys does not reveal past traffic.

2. **Post‑Quantum Readiness (PQR)**  
   The system is designed to adopt PQC algorithms without redesigning the transport layer.

3. **Modular Cryptographic Layers**  
   Each transport protocol (`REALITY`, `uTLS`, `XTLS‑Vision`, `XHTTP`, `VLESS`, `TUIC v5`) defines its own crypto envelope, but all follow a unified abstraction.

4. **Graceful Upgrade Path**  
   New algorithms can be introduced without breaking compatibility with older clients.

---

## 2. Hybrid Key Exchange Model

**dawnset** uses a **hybrid key exchange** strategy to ensure security against both classical and quantum adversaries.

### 2.1 Classical + PQC Hybrid

The system supports combining:

- `X25519` (classical ECDH)  
- `Kyber` (PQC KEM)

into a single shared secret:

`shared_secret = KDF( x25519_secret || kyber_secret )`

This ensures:

- If classical crypto breaks → PQC still protects  
- If PQC breaks → classical crypto still protects  
- If both survive → security is additive

### 2.2 Negotiation Flow

- Client → Server: `supported_kex = [x25519, kyber]`  
- Server → Client: `chosen_kex = hybrid(x25519 + kyber)`  
- Both sides derive ephemeral keys  
- Both sides compute `shared_secret`

This negotiation is transport‑agnostic and works across all six protocols.

---

## 3. Transport‑Level Crypto Integration

Each protocol integrates crypto differently, but all follow the same abstraction:

```
TransportCrypto {
    handshake: function(...)
    derive_keys: function(...)
    encrypt: function(...)
    decrypt: function(...)
    rotate_keys: function(...)
}
```

### 3.1 REALITY  
Uses deterministic key derivation + hybrid KEX.

### 3.2 uTLS  
Acts as a TLS fingerprint adaptation layer that wraps or configures underlying transports to mimic real‑world client behavior.  
It does not define its own encryption scheme; instead, it:

- adjusts ClientHello parameters  
- controls cipher suite ordering  
- tunes TLS extensions  
- aligns JA3/JA4 fingerprints with popular clients  

uTLS integrates with `XHTTP`, `XTLS‑Vision`, and `REALITY` to reduce detectability while reusing their existing crypto envelopes.

### 3.3 XTLS‑Vision  
Leverages TLS 1.3 handshake with PQC extension support.

### 3.4 XHTTP  
Uses hybrid KEX + AEAD (`ChaCha20‑Poly1305` or `AES‑GCM`).

### 3.5 VLESS  
Lightweight handshake with optional PQC upgrade.

### 3.6 TUIC v5  
QUIC‑based crypto with PQC‑ready handshake.

---

## 4. Key Rotation Strategy

**dawnset** enforces continuous key rotation to minimize exposure:

- `rotation_interval = 30 minutes`  
- or  
- `rotation_trigger = traffic_volume > threshold`

Rotation is transparent to the transport layer and does not interrupt sessions.

---

## 5. Post‑Quantum Migration Path

The system defines a three‑phase migration plan:

### Phase 1 — PQC Optional (Current)  
Hybrid KEX is supported but optional.

### Phase 2 — PQC Preferred  
Clients prefer PQC‑enabled handshakes when available.

### Phase 3 — PQC Mandatory  
Classical‑only handshakes are deprecated.

This ensures a smooth transition without breaking older clients.

---

## 6. Future Protocol Extensions

The architecture supports adding new protocols without redesigning the system.

### 6.1 Extension Mechanism

```
ProtocolExtension {
    id: string
    version: int
    handshake: function(...)
    crypto_profile: enum(...)
    routing_behavior: enum(...)
}
```

### 6.2 Example Future Extensions

- `XHTTP/2` — optimized for low‑power devices  
- `Reality‑Lite` — minimal handshake for IoT  
- `PQC‑Only Transport` — no classical crypto fallback  
- `Steganographic Transport` — traffic disguised as benign flows  

---

## 7. Cryptographic Agility

**dawnset** supports **algorithm agility**, meaning:

- Algorithms can be replaced  
- Key sizes can be increased  
- Hash functions can be upgraded  
- Cipher suites can be deprecated  

without breaking compatibility.

### 7.1 Agility Table

- KEX: `x25519`, `kyber`, `hybrid(x25519+kyber)`  
- Cipher: `chacha20‑poly1305`, `aes‑gcm`  
- Hash: `sha256`, `sha3‑256`, `blake3`  
- Signature: `ed25519`, `dilithium`

---

## 8. Threat Model Alignment

The crypto design directly mitigates:

- Quantum adversaries  
- Active MITM  
- Replay attacks  
- Traffic correlation  
- Key compromise  
- Protocol downgrade attacks  

Hybrid KEX + continuous rotation + protocol agility ensures long‑term resilience.

---

## 9. Summary

**dawnset**’s cryptographic architecture is:

- PQC‑ready  
- Modular  
- Extensible  
- Future‑proof  
- Compatible with all six transport protocols  

This ensures the system remains secure and adaptable for the next decade of cryptographic evolution.
