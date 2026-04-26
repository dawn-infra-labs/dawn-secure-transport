# Documentation Overview

The `docs/` directory provides all public‑facing documentation for the Dawnset
project.  
While the `architecture/` directory defines the internal system design and
implementation‑level abstractions, the `docs/` directory focuses on:

- protocol descriptions  
- design rationale  
- research background  
- security considerations  
- contributor onboarding  
- long‑term maintainability  

This directory is intended for contributors, auditors, researchers, and
stakeholders who require a clear understanding of Dawnset’s protocol suite and
design philosophy without diving into implementation details.

---

## Purpose

The `docs/` directory serves several key functions:

- document the **Rux Protocol Suite** and **Source Protocols**  
- describe the **Rust Unified Transport Layer (RUTL)** at a conceptual level  
- provide design decisions and historical rationale  
- maintain research notes relevant to **challenging connectivity environments
  (restricted, unstable, filtered, or unreliable networks)**  
- define terminology and conventions  
- support onboarding for new contributors  
- preserve long‑term project knowledge  

It complements the internal architecture documents by offering **public,
high‑level explanations** that do not lock in implementation details.

---

## Documentation Structure

```text
docs/
│
├── protocols/              ← Rux Suite, Source Protocols, RUTL (conceptual)
│   ├── README.md
│   ├── RUTL.md
│   ├── ruxvv.md
│   ├── ruxsv.md
│   ├── ruxpv.md
│   └── source-protocols.md
│
├── glossary.md             ← Terminology and definitions
├── design-decisions.md     ← Architectural rationale and trade‑offs
├── research-notes.md       ← Connectivity & traffic classification research
├── security-considerations.md
├── connectivity-landscape.md
└── contributor-guide.md
```

Each file has a specific purpose, described below.

---

## Protocol Documentation

The `protocols/` directory contains all protocol‑related documentation, including:

- **Rux Protocol Suite**  
  ruxvv (Performance), ruxsv (Low‑Observability Mode), ruxpv (High‑Robustness Mode)

- **Source Protocols**  
  REALITY, uTLS, XTLS‑Vision, XHTTP, VLESS

- **Rust Unified Transport Layer (RUTL)**  
  A conceptual overview of the unified transport abstraction used by Dawnset.  
  (Implementation details are defined in `architecture/`.)

This section is the primary reference for contributors working on transport,
routing, or **resilient operation in challenging connectivity environments**.

---

## File Descriptions

### `glossary.md`
Defines all key terms used across the project:

- transport terminology  
- routing terminology  
- cryptographic concepts  
- discovery and DHT terminology  
- terminology related to **restricted, unstable, filtered, or unreliable networks**  

Ensures consistency across documentation and implementation.

---

### `design-decisions.md`
Records major architectural decisions, including:

- why certain protocols were selected  
- why certain transports were excluded  
- how the routing pipeline is structured  
- trade‑offs between performance and observability  
- rationale behind multi‑channel discovery  

Provides transparency and historical context.

---

### `research-notes.md`
Contains references and summaries of:

- connectivity research  
- traffic classification studies  
- active probing behavior  
- transport protocol characteristics  
- PQC readiness  
- routing heuristics and lightweight RL models  

Supports future improvements and academic collaboration.

---

### `security-considerations.md`
Documents:

- metadata minimization strategies  
- threat surfaces  
- attack models  
- poisoning resistance  
- traffic classification mitigation  
- privacy guarantees  

Complements the main threat model in `architecture/`.

---

### `connectivity-landscape.md`
Provides an overview of:

- regional connectivity constraints  
- filtering and shaping patterns  
- traffic classification capabilities  
- historical protocol behavior under constrained conditions  
- emerging trends in network management  

Guides routing and transport decisions.

---

### `contributor-guide.md`
Provides onboarding information:

- development workflow  
- coding conventions  
- crate structure overview  
- testing guidelines  
- contribution rules  
- review process  

Ensures new contributors can join efficiently.

---

## Relationship to Other Directories

The `docs/` directory is not a replacement for:

- `architecture/` (internal system design and abstractions)  
- `crates/` (implementation)  
- `roadmap/` (planning and milestones)  

Instead, it provides **supporting detail** that enhances understanding and
long‑term maintainability.

---

## Future Expansion

As the project evolves, the `docs/` directory may include:

- benchmarking results  
- protocol comparison tables  
- connectivity simulation reports  
- formal verification notes  
- PQC migration plans  

This directory is designed to grow with the project while remaining clear and
well‑structured.
