# Threat Model

This document defines the adversarial model, attack surfaces, and defensive assumptions for Dawn Bridge Core.  
It provides a clear understanding of what threats the system is designed to withstand, what risks are mitigated, and what scenarios are explicitly out of scope.

The threat model applies across all transports (`REALITY`, `uTLS`, `XTLS‑Vision`, `XHTTP`, `VLESS`, `TUIC v5`) and all routing layers.

---

## 1. Adversary Classes

Dawn Bridge considers four primary adversary classes:

### 1.1 Passive Network Observer  
Capabilities:
- Monitors traffic on-path  
- Records metadata  
- Performs long-term traffic analysis  

Mitigations:
- Encrypted transports  
- Traffic obfuscation  
- Multi-hop routing  
- Key rotation  

### 1.2 Active Network Attacker  
Capabilities:
- Injects packets  
- Drops or delays traffic  
- Performs MITM  
- Attempts protocol downgrade  

Mitigations:
- Hybrid KEX (`x25519 + kyber`)  
- Integrity-protected handshakes  
- Replay protection  
- Strict version negotiation  

### 1.3 State-Level Adversary  
Capabilities:
- Large-scale traffic correlation  
- BGP hijacking  
- TLS interception infrastructure  
- Long-term storage of encrypted traffic  

Mitigations:
- Multi-hop routing  
- PQC readiness  
- Deterministic but unlinkable node discovery  
- Rotating ephemeral identities  

### 1.4 Malicious Node Operator  
Capabilities:
- Runs a compromised relay  
- Attempts to deanonymize traffic  
- Tries to correlate ingress/egress  

Mitigations:
- Layered encryption  
- Per-hop key separation  
- No single node sees both ends  
- AI-based anomaly detection  

---

## 2. Attack Surfaces

### 2.1 Transport Layer  
Potential attacks:
- Protocol fingerprinting  
- Timing analysis  
- Cipher downgrade  
- QUIC/TLS manipulation  

Defenses:
- Unified crypto abstraction  
- PQC-ready handshakes  
- Traffic padding (optional)  
- Deterministic but indistinguishable handshakes  

### 2.2 Routing Layer  
Potential attacks:
- Path correlation  
- Relay compromise  
- Route manipulation  

Defenses:
- Multi-hop routing  
- AI-based route selection  
- Risk scoring per node  
- Continuous path rotation  

### 2.3 Node Discovery  
Potential attacks:
- Poisoned DHT entries  
- DNS spoofing  
- Replay of stale node metadata  

Defenses:
- Signed node descriptors  
- Expiration timestamps  
- Multi-source verification  
- Ranking based on trust signals  

### 2.4 Metadata Leakage  
Potential attacks:
- Traffic size correlation  
- Session duration fingerprinting  
- Endpoint identification  

Defenses:
- Optional padding  
- Session rotation  
- Multi-hop obfuscation  

---

## 3. Security Goals

### 3.1 Confidentiality  
- All traffic encrypted end-to-end  
- Per-hop encryption prevents relay visibility  
- Hybrid KEX ensures PQC safety  

### 3.2 Integrity  
- All handshakes authenticated  
- Replay protection  
- No silent downgrade allowed  

### 3.3 Availability  
- Multi-path fallback  
- Transport diversity  
- Anti-jamming strategies  

### 3.4 Unlinkability  
- No single node sees both source and destination  
- Rotating ephemeral identities  
- AI-based route randomization  

---

## 4. Non-Goals (Out of Scope)

Dawn Bridge does **not** attempt to defend against:

- Compromised user devices  
- Malware on endpoints  
- Physical coercion  
- Side-channel attacks on hardware  
- Global adversaries with perfect visibility of all relays simultaneously  

These are explicitly out of scope.

---

## 5. Residual Risks

Even with all mitigations, some risks remain:

- Large-scale correlation by extremely powerful adversaries  
- Traffic analysis on very long-lived sessions  
- Compromised relays observing partial metadata  
- Misconfigured deployments reducing anonymity  

Residual risks are minimized but cannot be fully eliminated.

---

## 6. Summary

Dawn Bridge Core is designed to withstand:

- Passive observers  
- Active attackers  
- State-level adversaries  
- Malicious relay operators  

Through:

- Hybrid post-quantum key exchange  
- Multi-hop routing  
- Metadata minimization  
- Continuous key rotation  
- AI-driven path selection  

This threat model defines the boundaries of what the system protects and clarifies the assumptions required for secure operation.
