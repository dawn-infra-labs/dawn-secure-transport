# Research Notes

This document collects research findings, references, and technical insights that inform the design of Dawn Bridge Core.  
It serves as a living knowledge base for censorship resistance, protocol behavior, cryptographic trends, and routing intelligence.

The notes here support future improvements, academic collaboration, and long‑term system evolution.

---

## Censorship Research

### DPI Capabilities
Modern DPI systems can analyze:
- TLS fingerprints  
- QUIC handshake patterns  
- HTTP header anomalies  
- packet size distributions  
- timing and burst patterns  

Key observations:
- censors increasingly rely on statistical fingerprinting  
- active probing is becoming more common  
- protocol mimicry must be precise to avoid detection  

### Active Probing Techniques
Censors may:
- initiate fake handshakes  
- replay captured packets  
- send malformed packets to test server behavior  
- attempt protocol downgrades  

Implication:
- transports must fail closed  
- handshake behavior must be indistinguishable from legitimate protocols  

### Regional Censorship Patterns
Different regions exhibit different behaviors:
- some block entire protocol families  
- some throttle instead of block  
- some use time‑based or event‑based filtering  
- some rely heavily on active probing  

This diversity motivates multi‑transport and AI‑driven routing.

---

## Transport Protocol Research

### Protocol Fingerprinting
Each protocol has unique characteristics:
- TLS ciphersuite ordering  
- QUIC version negotiation  
- HTTP header ordering  
- packet size entropy  
- handshake timing  

Research shows:
- fingerprint diversity is essential  
- mimicry must be exact, not approximate  
- obfuscation must adapt over time  

### Performance Characteristics
Different transports excel in different scenarios:
- QUIC‑based protocols handle high latency well  
- TLS‑based protocols blend into normal traffic  
- lightweight protocols reduce overhead  

This supports the multi‑transport strategy.

---

## Discovery Research

### DHT Behavior
DHT networks provide:
- decentralized lookup  
- resilience against takedown  
- natural churn resistance  

Challenges:
- poisoning attacks  
- eclipse attacks  
- inconsistent availability  

Mitigations:
- node verification  
- multi‑source aggregation  
- trust scoring  

### DNS TXT Fallback
Advantages:
- simple  
- widely supported  
- hard to block without collateral damage  

Limitations:
- centralized  
- cache poisoning risks  

Fallback use only.

---

## Cryptography Research

### PQC Readiness
Post‑quantum algorithms are maturing:
- Kyber for key exchange  
- Dilithium for signatures  

Considerations:
- handshake size increases  
- performance trade‑offs  
- hybrid handshakes recommended  

### Metadata Minimization
Research emphasizes:
- avoid static identifiers  
- avoid predictable handshake patterns  
- minimize observable fields  

This informs transport design.

---

## Routing Intelligence Research

### Traffic Classification
Machine learning can classify:
- streaming  
- browsing  
- gaming  
- VoIP  
- bulk transfer  

Implication:
- routing must adapt to application type  

### Risk Modeling
Risk factors include:
- protocol detectability  
- regional censorship intensity  
- node reliability  
- historical performance  

AI routing integrates these signals.

### Reinforcement Learning (Future)
RL can:
- learn optimal protocol selection  
- adapt to censorship changes  
- optimize multi‑hop paths  

Challenges:
- safe exploration  
- avoiding unstable behavior  

---

## Simulation & Testing Research

### Censorship Simulation
Simulated environments help test:
- throttling  
- packet dropping  
- active probing  
- protocol blocking  

### Network Emulation
Tools can simulate:
- high latency  
- jitter  
- packet loss  
- bandwidth constraints  

These tests guide transport tuning.

---

## Future Research Areas

- encrypted DHT overlays  
- adaptive obfuscation models  
- PQC handshake optimization  
- collaborative performance sharing  
- region‑specific routing policies  
- anomaly detection in routing behavior
