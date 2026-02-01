# Transport Architecture

## 1. Overview

The transport layer of Dawn Bridge Core provides protocol agility, censorship resistance, and obfuscation.  
It is designed around a unified abstraction that allows multiple transports to coexist, evolve, and be replaced without affecting higher‑level modules such as routing or discovery.

This document describes the architecture, interfaces, behaviors, and design principles of the six supported transports:

- XHTTP  
- XTLS  
- Reality  
- VLESS  
- Hysteria2  
- Trojan  

and the future‑oriented PQC‑ready extensions.

The transport layer is responsible for:

- Establishing encrypted, obfuscated channels  
- Minimizing protocol fingerprintability  
- Handling active probing and DPI interference  
- Providing consistent APIs to the routing engine  
- Supporting dynamic switching and fallback  

---

## 2. Design Principles

### Protocol Agility
Transports must be replaceable at runtime without breaking application‑level behavior.

### Obfuscation by Default
Every transport includes mechanisms to resist DPI, traffic classification, and active probing.

### Minimal Metadata
Transports avoid exposing identifiable metadata such as protocol banners, fixed packet sizes, or deterministic timing.

### Unified Interface
All transports implement a common interface so the routing engine can treat them uniformly.

### Extensibility
New transports can be added without modifying existing ones.

---

## 3. Unified Transport Interface

All transports implement the following conceptual interface:
