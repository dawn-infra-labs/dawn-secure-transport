
# Dawnset Transports Crate

The `transports/` crate implements the Rust Unified Transport Layer (RUTL),
providing a unified abstraction for all Dawnset transport protocols.

This crate is intentionally minimal during **v0.1 (Architecture Foundation)** and
will become the primary implementation target in **v0.2 (Core Implementation)**.

---

## 1. Purpose

The `transports` crate will provide:

- unified transport framework (RUTL)
- protocol abstraction and capability descriptors
- protocol registry and initialization logic
- integration with crypto and discovery layers
- support for fused protocols (ruxvv, ruxsv, ruxpv)
- support for TUIC v5 and future protocols

---

## 2. Current Status

The crate is currently a placeholder:

- no protocol implementations  
- no RUTL traits  
- no capability model  
- no registry  
- no initialization logic  

This is intentional.  
Dawnset follows an **architecture‑first** workflow, and implementation begins in v0.2.

---

## 3. Upcoming Work (v0.2)

During the next phase, this crate will introduce:

- RUTL trait definitions  
- protocol capability descriptors  
- protocol registry and initialization  
- fused protocol implementations  
- TUIC v5 integration  
- transport metrics and runtime hooks  

---

## 4. Architectural Challenges for the Lead Engineer

The following areas are intentionally left open for design refinement in v0.2:

- **RUTL Trait Design** — Defining a unified interface for all transports.
- **Capability Model** — Designing a flexible, future‑proof capability descriptor.
- **Protocol Registry** — Managing dynamic protocol loading and negotiation.
- **Runtime Integration** — Coordinating with crypto, discovery, and routing layers.

These decisions are deferred by design to ensure flexibility during implementation.
