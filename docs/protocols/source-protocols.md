# Source Protocols

This document provides background information on the Source Protocols that form the foundation of the Rux Protocol Suite.  
They are well‑established transport mechanisms, each with distinct operational characteristics.  
Understanding these protocols is essential for contributors working on amalgamation, routing, and transport‑layer interoperability.

---

## 1. REALITY

**Type:** TLS‑based handshake and session establishment  
**Strengths:**  
- interoperable with mainstream TLS implementations  
- stable handshake behavior  
- widely deployed in modern transport systems  

**Limitations:**  
- requires correct certificate and domain configuration  
- sensitive to deployment‑specific TLS settings  

**Use Cases:**  
- environments requiring standardized TLS handshake behavior  
- systems built on established TLS infrastructure  

---

## 2. uTLS

**Type:** TLS handshake behavior alignment  
**Strengths:**  
- aligns ClientHello behavior with mainstream TLS clients  
- flexible fingerprint configuration  
- supports broad interoperability across TLS ecosystems  

**Limitations:**  
- requires periodic updates as client implementations evolve  
- outdated fingerprints may introduce behavioral inconsistencies  

**Use Cases:**  
- deployments requiring consistent TLS handshake characteristics  
- systems integrating with diverse TLS client profiles  

**RUTL Integration:**  
RUTL includes logic for **automatic fingerprint library updates** to maintain handshake consistency over time.

---

## 3. XTLS‑Vision

**Type:** optimized data path and flow control  
**Strengths:**  
- high performance, low overhead  
- efficient for long‑lived connections  
- supports advanced multiplexing  

**Limitations:**  
- requires correct configuration to maintain expected flow characteristics  
- performance may vary across heterogeneous network environments  

**Use Cases:**  
- performance‑critical deployments  
- scenarios requiring stable throughput and efficient flow control  

---

## 4. XHTTP

**Type:** structured HTTP framing  
**Strengths:**  
- integrates cleanly with HTTP‑centric infrastructures  
- flexible request/response encapsulation  
- supports both stream and packet modes  

**Limitations:**  
- introduces overhead compared to native transports  
- less efficient for high‑bandwidth streaming workloads  

**Use Cases:**  
- environments where HTTP framing is operationally preferred  
- systems requiring structured message encapsulation  

---

## 5. VLESS

**Type:** lightweight framing layer  
**Strengths:**  
- simple and flexible  
- minimal metadata  
- delegates encryption to the underlying TLS layer  
- easy to integrate with higher‑level transport components  

**Limitations:**  
- requires pairing with a secure handshake layer  
- limited standalone functionality  

**Use Cases:**  
- base framing layer for amalgamated transports  
- deployments requiring minimal metadata footprint  

---

## Relationship to the Rux Protocol Suite

The Rux Protocol Suite builds upon these Source Protocols by combining and extending them into unified transports:

- **ruxvv (Performance):** REALITY + uTLS + XTLS‑Vision + VLESS  
- **ruxsv (Stealth):** REALITY + uTLS + XHTTP (Stream) + VLESS  
- **ruxpv (Survival):** REALITY + uTLS + XHTTP (Packet) + VLESS  

Understanding the operational characteristics of each Source Protocol helps contributors evaluate the design choices and trade‑offs embodied in the Rux Suite.
