# Architecture Overview

This directory contains the core architectural documents for **dawnset**.  
Each file describes a major subsystem or design pillar of the platform.  
All documents are transport‑agnostic and apply across REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS.

These documents reference the underlying source protocols rather than the Rux Protocol Suite, because the system architecture is transport‑agnostic and applies independently of any specific amalgamated or extended protocol.

---

## Files in This Directory

- **overview.md**  
  High‑level description of the system architecture and its major components.

- **transport-architecture.md**  
  Detailed design of the six transport protocols and their cryptographic envelopes.

- **node-discovery-architecture.md**  
  Architecture for node discovery, DHT, DNS TXT, ranking, and policy distribution.

- **ai-routing-architecture.md**  
  Multi-hop routing, risk scoring, and AI‑driven path selection.

- **crypto-and-future-extensions.md**  
  Cryptographic foundations, hybrid KEX, PQC readiness, and future protocol extensions.

- **threat-model.md**  
  System-wide adversary model, attack surfaces, mitigations, and security assumptions.

- **data-flow.md**  
  End‑to‑end data flow, handshake sequence, multi-hop forwarding, and session rotation.

---

## Purpose

The architecture directory provides:

- A unified reference for contributors  
- A clear structure for auditors and reviewers  
- A stable foundation for future protocol and implementation work  

Each document is self‑contained but designed to interoperate with the others.

---

For detailed protocol specifications and transport‑level documentation, see the files in the `docs/` directory.
