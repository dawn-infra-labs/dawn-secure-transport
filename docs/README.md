# Documentation Overview

The `docs/` directory contains all supplementary documentation for Dawn Bridge Core.  
While the `architecture/`, `modules/`, and `roadmap/` directories describe the system design and development plan, the `docs/` directory provides additional materials that support implementation, onboarding, research, and long‑term maintenance.

This directory is intended for contributors, auditors, funders, and researchers who require deeper context beyond the core architecture.

---

## Purpose

The `docs/` directory serves several key functions:

- provide extended technical explanations  
- store research notes and design rationales  
- document internal conventions and standards  
- support onboarding for new contributors  
- maintain long‑term project knowledge  
- provide references for security and censorship research  

It complements the high‑level architecture documents by offering deeper detail where needed.

---

## Recommended Structure

The following structure outlines the intended organization of the `docs/` directory.  
Files will be added progressively as the project evolves.

```text
docs/
│
├── glossary.md
├── design-decisions.md
├── research-notes.md
├── security-considerations.md
├── censorship-landscape.md
└── contributor-guide.md
```

Each file has a specific purpose, described below.

---

## File Descriptions

### `glossary.md`
Defines all key terms used across the project:

- transport terminology  
- routing terminology  
- cryptographic concepts  
- discovery and DHT terminology  
- censorship‑related vocabulary  

This ensures consistency across documentation and implementation.

---

### `design-decisions.md`
Records major architectural decisions, including:

- why certain protocols were selected  
- why certain transports were excluded  
- why the routing pipeline is structured as it is  
- trade‑offs between performance and detectability  
- rationale behind multi‑hop design  

This file provides transparency and historical context.

---

### `research-notes.md`
Contains references and summaries of:

- censorship research  
- protocol fingerprinting studies  
- active probing techniques  
- transport protocol behavior  
- PQC readiness  
- routing intelligence models  

This file supports future improvements and academic collaboration.

---

### `security-considerations.md`
Documents:

- metadata minimization strategies  
- threat surfaces  
- attack models  
- poisoning resistance  
- fingerprinting mitigation  
- privacy guarantees  

This complements the main threat model in `architecture/`.

---

### `censorship-landscape.md`
Provides an overview of:

- regional censorship patterns  
- protocol blocking history  
- DPI capabilities  
- throttling and shaping techniques  
- emerging censorship trends  

This file helps guide routing and transport decisions.

---

### `contributor-guide.md`
Provides onboarding information:

- development workflow  
- coding conventions  
- testing guidelines  
- crate structure overview  
- contribution rules  
- review process  

This ensures new contributors can join efficiently.

---

## Relationship to Other Directories

The `docs/` directory is not a replacement for:

- `architecture/` (system design)  
- `modules/` (module‑level documentation)  
- `roadmap/` (planning and milestones)  

Instead, it provides **supporting detail** that enhances understanding and long‑term maintainability.

---

## Future Expansion

As the project evolves, the `docs/` directory may include:

- benchmarking results  
- protocol comparison tables  
- censorship simulation reports  
- formal verification notes  
- PQC migration plans  

This directory is designed to grow with the project.
