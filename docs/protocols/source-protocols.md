# Source Protocols

This document provides background information on the Source Protocols that form the foundation of the Rux Protocol Suite.  
They are well‑established transports and obfuscation mechanisms, each with distinct strengths and limitations.  
Understanding these protocols is essential for contributors working on amalgamation, routing, and censorship‑resistance strategies.

---

## 1. REALITY

**Type:** TLS mimicry  
**Strengths:**  
- indistinguishable from HTTPS traffic  
- strong camouflage against DPI  
- widely deployed in censorship‑resistant systems  

**Limitations:**  
- complex configuration requirements  
- sensitive to certificate and domain setup  

**Use Cases:**  
- environments requiring high fidelity HTTPS mimicry  
- concealment under TLS‑focused censorship regimes  

---

## 2. uTLS

**Type:** TLS fingerprinting library  
**Strengths:**  
- replicates Chrome‑like handshake behavior  
- flexible fingerprint customization  
- widely used in anti‑fingerprinting contexts  

**Limitations:**  
- requires careful tuning  
- fingerprints must be updated as browsers evolve  
- risk of **Parrot ID lag** — outdated fingerprints may expose inconsistencies if the claimed client version does not match handshake details  

**Use Cases:**  
- blending into mainstream TLS traffic  
- reducing detectability by aligning with common client fingerprints  

**RUTL Integration:**  
RUTL includes logic for **automatic fingerprint library updates** to mitigate Parrot ID lag and ensure handshake fidelity.

---

## 3. XTLS‑Vision

**Type:** TCP obfuscation  
**Strengths:**  
- high performance, low overhead  
- efficient for long‑lived connections  
- supports advanced multiplexing  

**Limitations:**  
- fingerprintable if misconfigured  
- less effective against sophisticated DPI  

**Use Cases:**  
- performance‑critical environments  
- scenarios where throughput outweighs concealment  

---

## 4. XHTTP

**Type:** HTTP camouflage  
**Strengths:**  
- blends seamlessly into normal web traffic  
- flexible packetization options  
- effective against moderate censorship  

**Limitations:**  
- introduces overhead compared to native transports  
- less efficient for high‑bandwidth streaming  

**Use Cases:**  
- environments with HTTP‑centric censorship  
- concealment in web‑dominated traffic flows  

---

## 5. VLESS

**Type:** lightweight transport  
**Strengths:**  
- simple and flexible  
- minimal metadata  
- **no built‑in encryption overhead, delegating security to the TLS/REALITY layer**  
- easy to integrate with obfuscation layers  

**Limitations:**  
- requires pairing with camouflage or encryption  
- limited standalone concealment  

**Use Cases:**  
- base transport for amalgamated protocols  
- scenarios requiring minimal metadata footprint  

---

## 6. TUIC v5

**Type:** QUIC‑based transport  
**Strengths:**  
- high‑speed performance  
- resistant to throttling  
- supports modern congestion control  

**Limitations:**  
- QUIC increasingly targeted by censorship  
- requires fallback mechanisms in hostile environments  

**Use Cases:**  
- diverse constrained networks  
- high‑performance routing with fallback options  

---

## Relationship to the Rux Protocol Suite

The Rux Protocol Suite builds upon these Source Protocols by combining and extending them into unified transports:

- **ruxvv (Performance):** REALITY + uTLS + XTLS‑Vision + VLESS  
- **ruxsv (Stealth):** REALITY + uTLS + XHTTP (Stream) + VLESS  
- **ruxpv (Survival):** REALITY + uTLS + XHTTP (Packet) + VLESS  
- **ruxte (All‑terrain):** TUIC v5 with TCP fallback  

By understanding the strengths and weaknesses of each Source Protocol, contributors can better evaluate the design choices and trade‑offs embodied in the Rux Suite.
