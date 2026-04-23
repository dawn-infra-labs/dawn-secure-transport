# Threat Model

This document defines the adversarial model, attack surfaces, and defensive assumptions for **Dawnset**.  
It provides a clear understanding of what threats the system is designed to withstand, what risks are mitigated, and what scenarios are explicitly out of scope.

The threat model applies across all transports (`REALITY`, `uTLS`, `XTLS‑Vision`, `XHTTP`, `VLESS`, `TUIC v5`) and all routing layers.

---

## 1. Adversary Classes

### 1.1 Passive Network Observer  
**What they see:**  
- Packet timings, sizes, and flows  
- Metadata such as IPs and session duration  
- Long‑term traffic pattern records  

**How Dawnset obscures visibility:**  
- End‑to‑end encryption hides payloads  
- Signal modulation and pattern masking reduce recognizability  
- Multi‑path relaying ensures no single vantage point reveals the full path  
- Continuous key rotation prevents long‑term correlation  

---

### 1.2 Active Network Attacker  
**What they attempt:**  
- Injecting or dropping packets  
- Delaying traffic  
- Automated protocol validation (simulated handshakes)  
- Downgrade attempts  

**How Dawnset resists:**  
- Hybrid KEX (`x25519 + kyber`) ensures forward secrecy and PQC readiness  
- Integrity‑protected handshakes prevent tampering  
- Replay protection blocks packet injection reuse  
- Strict version negotiation avoids silent downgrade  

---

### 1.3 State‑Level Adversary  
**What they see:**  
- Large‑scale traffic pattern analysis across multiple ISPs  
- BGP routing anomalies and hijacks  
- TLS interception infrastructure  
- Long‑term storage of encrypted traffic  

**How Dawnset resists:**  
- Multi‑path relaying disperses traffic across independent routes  
- PQC readiness ensures future safety against quantum adversaries  
- Deterministic but unlinkable node discovery prevents enumeration  
- Rotating ephemeral identities reduce correlation risk  

---

### 1.4 Malicious Node Operator  
**What they see:**  
- Traffic entering or leaving their compromised relay  
- Attempted correlation between ingress and egress  

**How Dawnset resists:**  
- Layered onion encryption ensures per‑hop isolation  
- Per‑hop key separation prevents full visibility  
- No single node sees both source and destination  
- AI‑based anomaly detection flags suspicious relay behavior  

---

## 2. Attack Surfaces

### 2.1 Transport Layer  
**Potential visibility:**  
- Protocol fingerprints  
- Timing anomalies  
- Cipher negotiation attempts  
- QUIC/TLS manipulation  

**Defenses:**  
- Unified crypto abstraction  
- PQC‑ready handshakes  
- Optional traffic padding  
- Deterministic but indistinguishable handshake flows  

---

### 2.2 Routing Layer  
**Potential visibility:**  
- Path correlation across relays  
- Compromised relay manipulation  
- Route biasing  

**Defenses:**  
- AI‑driven route selection with risk scoring  
- Continuous path rotation  
- Multi‑path relaying ensures diversity  

---

### 2.3 Node Discovery  
**Potential visibility:**  
- Poisoned DHT entries  
- DNS spoofing attempts  
- Replay of stale metadata  

**Defenses:**  
- Signed node descriptors  
- Expiration timestamps  
- Multi‑source verification  
- Ranking based on trust signals  

---

### 2.4 Metadata Leakage  
**Potential visibility:**  
- Traffic size correlation  
- Session duration fingerprints  
- Endpoint identification  

**Defenses:**  
- Optional padding  
- Session rotation  
- Multi‑hop obfuscation  

---

## 3. Security Goals

### 3.1 Confidentiality  
- All traffic encrypted end‑to‑end  
- Per‑hop encryption prevents relay visibility  
- Hybrid KEX ensures PQC safety  

### 3.2 Integrity  
- All handshakes authenticated  
- Replay protection  
- No silent downgrade allowed  

### 3.3 Availability  
- Multi‑path fallback  
- Transport diversity  
- Interference resilience strategies  

### 3.4 Unlinkability  
- No single node sees both source and destination  
- Rotating ephemeral identities  
- AI‑based route randomization  

---

## 4. Non‑Goals (Out of Scope)

**Dawnset** does **not** attempt to defend against:

- Compromised user devices  
- Malware on endpoints  
- Physical coercion  
- Side‑channel attacks on hardware  
- Global adversaries with perfect visibility of all relays simultaneously  

---

## 5. Residual Risks

Even with all mitigations, some risks remain:

- Large‑scale correlation by extremely powerful adversaries  
- Traffic pattern analysis on very long‑lived sessions  
- Compromised relays observing partial metadata  
- Misconfigured deployments reducing anonymity  

Residual risks are minimized but cannot be fully eliminated.

---

## 6. Summary

**Dawnset** is designed to withstand:

- Passive observers  
- Active attackers  
- State‑level adversaries  
- Malicious relay operators  

By ensuring that adversaries **only see fragments of traffic or indistinguishable patterns**, while the architecture enforces:  

- Hybrid post‑quantum key exchange  
- Multi‑path relaying  
- Metadata minimization  
- Continuous key rotation  
- AI‑driven path selection  

This threat model defines the boundaries of what the system protects and clarifies the assumptions required for secure operation.
