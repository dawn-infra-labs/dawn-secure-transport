# Dawnset Crypto Crate

The `crypto/` crate provides the cryptographic foundations for Dawnset.  
It defines the primitives required for handshake protocols, hybrid key exchange,
encryption utilities, and secure randomness.

This crate is intentionally minimal during the architecture‑first phase and will
be expanded according to the system’s design and crate boundaries.

---

## 1. Purpose

The `crypto` crate will provide:

- handshake primitives  
- hybrid key exchange mechanisms  
- encryption and decryption utilities  
- secure randomness sources  
- PQC‑ready extension points  

These components will be consumed by the transport layer and the RUTL runtime.

---

## 2. Current Status

The crate is currently a placeholder:

- no cryptographic logic  
- no handshake implementation  
- no key exchange  
- no PQC integration  
- no randomness backend  

This is intentional.  
Dawnset follows an **architecture‑first** workflow, and implementation will be
introduced as the system evolves.

---

## 3. Notes for Contributors

When implementation begins:

- avoid locking into a single crypto backend  
- maintain clear separation between primitives and protocol logic  
- ensure all operations are constant‑time where applicable  
- document all public types and algorithms  
- keep PQC integration modular and optional  

---

## 4. Architectural Challenges for the Lead Engineer

The following areas are intentionally left open for design refinement.  
They represent engineering decisions that require benchmarking, experimentation,
and cross‑crate coordination:

- **Hybrid Key Exchange Design** — Selecting the optimal combination of classical and PQC algorithms.  
- **Randomness Backend** — Choosing between OS RNG, hardware RNG, or deterministic constructions.  
- **Handshake Structure** — Defining a type‑safe, verifiable handshake state machine.  
- **Crypto Backend Abstraction** — Designing a backend‑agnostic interface that supports multiple libraries.

These decisions are deferred by design to ensure flexibility during implementation.
