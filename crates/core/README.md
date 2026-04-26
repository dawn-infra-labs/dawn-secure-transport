
# Dawnset Core Crate

The `core/` crate provides the foundational runtime and abstraction layer for  
**Dawnset’s Rust Unified Transport Layer (RUTL)**.  
It serves as the central coordination point between transports, discovery, routing,
and cryptographic components.

This crate is intentionally minimal during **v0.1 (Architecture Foundation)** and will
become the primary implementation target in **v0.2 (Core Implementation)**.

---

## 1. Purpose

The `core` crate defines the shared runtime elements required across the system:

- session context  
- shared data structures  
- common utilities  
- RUTL traits and capability interfaces  
- integration points for transports, discovery, and routing  

It acts as the backbone of the Dawnset implementation layer.

---

## 2. Current Status

The crate is currently a placeholder:

- no runtime logic  
- no protocol logic  
- no routing logic  
- no cryptographic logic  

This is intentional.  
Dawnset follows an **architecture‑first** workflow, and implementation begins in v0.2.

---

## 3. Upcoming Work (v0.2)

During the next phase, this crate will introduce:

- core runtime initialization  
- session and capability models  
- RUTL trait definitions  
- integration hooks for transports and discovery  
- shared type definitions  

These components will form the foundation for higher‑level subsystems.

---

## 4. Notes for Contributors

When implementation begins:

- keep modules decoupled  
- avoid embedding protocol‑specific logic  
- follow Rust best practices  
- maintain clear boundaries between RUTL, transports, and discovery  
- document all public traits and types  

The `core` crate should remain stable and minimal, serving as the system’s
long‑term abstraction layer.

---

## 5. Architectural Challenges for the Lead Engineer

The following areas are intentionally left open for design refinement in v0.2.  
They represent engineering decisions that require benchmarking, experimentation,
and cross‑crate coordination:

- **Async Runtime Strategy** — Selecting the optimal execution model (`tokio`, `io_uring`,
  or hybrid approaches) for high‑performance, low‑latency I/O.
- **Resource Management** — Defining backpressure, rate‑limiting semantics, and
  cooperative scheduling within the RUTL runtime.
- **State Machine Rigor** — Designing a type‑safe, verifiable state machine for the
  handshake‑to‑session transition.
- **Telemetry Hooks** — Establishing low‑overhead metrics and observation points for
  integration with the RL‑assisted routing engine.

These decisions are deferred by design to ensure flexibility during implementation.
