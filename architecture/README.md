
# Architecture Overview

This directory contains the core architectural specifications for **Dawnset**.  
Each document describes a major subsystem of the platform and defines how the system
achieves resilient, modular, and transport‑agnostic communication across diverse
connectivity environments.

Dawnset’s architecture is organized around two foundational cores:

1. **Rust Unified Transport Layer (RUTL)** — the unified abstraction for all transport protocols  
2. **Amalgamated Protocols** — performance‑, stealth‑, and survival‑oriented transports built from multiple source protocols

These cores are supported by decentralized node discovery, an AI‑driven routing engine,
and a system‑wide security model that governs metadata exposure, capability boundaries,
and operational behavior under challenging connectivity conditions.

All documents in this directory are **transport‑agnostic** and describe architectural
principles rather than implementation details of any specific protocol.

---

## Files in This Directory

### **rutl.md**
Full specification of the **Rust Unified Transport Layer (RUTL)** —  
the first core of Dawnset.  
Defines the unified transport abstraction, capability model, handshake boundaries,
error semantics, and extensibility points for integrating new transports.

### **amalgamated-protocols.md**
Architecture of the **Amalgamated Protocols (ruxvv, ruxsv, ruxpv)**.  
Explains how multiple source protocols are combined into cohesive transport designs
optimized for performance, stealth, or survival.

### **source-protocols.md**
Reference architecture for the **source protocols** used during the amalgamation
process (REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS).  
Describes their roles as internal building blocks rather than exposed transports.

### **node-discovery.md**
Design of the decentralized discovery subsystem.  
Covers DHT‑based discovery, DNS TXT fallback, node verification, scoring, and
policy distribution.

### **ai-routing.md**
Architecture of the AI‑driven routing engine.  
Describes multi‑hop path selection, risk‑aware scoring, adaptive heuristics,
and integration with RUTL.

### **data-flow.md**
End‑to‑end data‑flow architecture.  
Defines handshake sequencing, capability layering, routing boundaries, and
packet movement across multi‑hop paths.

### **protocol-integration.md**
Guidelines for integrating new transports into RUTL.  
Explains capability requirements, handshake structure, error propagation,
and compatibility constraints.

### **security-design.md**
System‑wide security model.  
Defines adversarial assumptions, metadata‑exposure boundaries, linkability
constraints, and architectural mitigations across transport, routing, and discovery.

### **deployment-models.md**
Deployment‑level architectural considerations.  
Describes single‑node, multi‑node, edge, and distributed deployment models,
as well as operational boundaries for real‑world environments.

---

## Purpose

The architecture directory provides:

- **Unified Reference**  
  A consistent, system‑level specification for developers, auditors, and contributors.

- **Structural Transparency**  
  Clear definitions of subsystem boundaries, capability surfaces, and integration points.

- **Long‑Term Stability**  
  A future‑proof foundation that allows transports, routing models, and discovery
  mechanisms to evolve without breaking the overall architecture.

Each document is self‑contained but designed to operate within a cohesive architectural
pipeline that spans transport, discovery, routing, and security.

---

## Additional Documentation

For protocol‑level specifications, handshake details, and extended references,
see the documents in the `docs/` directory.
