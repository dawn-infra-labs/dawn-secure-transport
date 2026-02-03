# Modules Overview

The `modules/` directory contains the core functional components of Dawn Bridge Core.  
Each module encapsulates a major subsystem of the architecture, providing clear boundaries, extensibility, and independent development paths.

These modules form the implementation layer that bridges the high‑level architecture with the underlying Rust crates.

---

## Purpose

The modules in this directory are designed to:

- separate concerns across transport, discovery, and routing  
- provide stable interfaces for future extensions  
- ensure each subsystem can evolve independently  
- support modular testing and incremental development  
- align with the threat model and data‑flow architecture  
- enable intelligent, censorship‑resistant behavior across the system  

Each module corresponds directly to a major architectural component defined in the `architecture/` directory.

---

## Module Structure

The directory contains three primary modules:

```text
modules/
│
├── transport-framework/
│   └── README.md
│
├── node-discovery/
│   └── README.md
│
└── ai-routing/
    └── README.md
```

---

## Module Responsibilities

### 1. Transport Framework
Implements the unified abstraction layer for all censorship‑resistant transport protocols.  
Defines handshake flows, encryption boundaries, behavioral simulation, and protocol‑agnostic interfaces.

This module enables the system to support multiple transports—xHTTP, XTLS, Hysteria2, VLESS, Reality, and Trojan—under a single coherent design.

It ensures:

- consistent lifecycle management  
- shared cryptographic primitives  
- protocol camouflage and DPI evasion  
- extensibility for future transports  

---

### 2. Node Discovery
Implements decentralized node discovery using DHT and DNS TXT.  
Provides mechanisms for:

- node distribution  
- remote configuration  
- policy delivery  
- dynamic updates  
- prioritization and filtering  
- fallback strategies in adversarial environments  

This module ensures the system can operate without centralized infrastructure and can adapt to censorship pressure.

---

### 3. AI Routing
Implements the intelligent routing engine responsible for:

- multi‑hop path selection  
- risk‑aware decision making  
- performance‑based adaptation  
- transport protocol selection  
- per‑application routing policies
- dynamic fallback and retry strategies  

This module integrates with both the transport framework and node discovery to optimize resilience in adversarial environments.

It is the system’s decision‑making layer, enabling adaptive, censorship‑resistant behavior.

---

## Design Principles

All modules follow these principles:

- **Modularity** — each subsystem is isolated and replaceable  
- **Extensibility** — new transports, routing strategies, or discovery mechanisms can be added  
- **Security** — boundaries align with the threat model and minimize metadata exposure  
- **Testability** — modules can be tested independently  
- **Interoperability** — modules communicate through stable, well‑defined interfaces  
- **Resilience** — modules are designed for adversarial network environments  

---

## Relationship to Architecture

These modules correspond directly to the architecture documents:

- `transport-framework/` → `architecture/transport-architecture.md`  
- `node-discovery/` → `architecture/node-discovery-architecture.md`  
- `ai-routing/` → `architecture/ai-routing-architecture.md`  

They serve as the implementation‑ready interpretation of the high‑level design.

---

## Future Work

Future development may introduce additional modules, such as:

- policy engine  
- remote configuration service  
- telemetry and adaptive feedback  
- PQC‑ready cryptographic extensions  
- collaborative routing intelligence  
- advanced anomaly detection  

The current structure is intentionally designed to accommodate these expansions.
