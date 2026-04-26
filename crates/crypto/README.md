
# Dawnset Crypto Crate

The `crypto/` crate provides the cryptographic foundations for Dawnset.  
It defines the primitives required for handshake protocols, hybrid key exchange,
encryption utilities, and secure randomness.

This crate is intentionally minimal during **v0.1 (Architecture Foundation)** and will
become a major implementation target in **v0.2 (Core Implementation)**.

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
Dawnset follows an **architecture‑first** workflow, and implementation begins in v0.2.

---

## 3. Upcoming Work (v0.2)

During the next phase, this crate will introduce:

- hybrid handshake primitives  
- PQC‑ready key exchange  
- authenticated encryption utilities  
- secure randomness abstraction  
- integration hooks for transports and RUTL  

---

## 4. Notes for Contributors

When implementation begins:

- avoid locking into a single crypto backend  
- maintain clear separation between primitives and protocol logic  
- ensure all operations are constant‑time where applicable  
- document all public types and algorithms  
- keep PQC integration modular and optional  

---

## 5. Architectural Challenges for the Lead Engineer

The following areas are intentionally left open for design refinement in v0.2:

- **Hybrid Key Exchange Design** — Selecting the optimal combination of classical and PQC algorithms.
- **Randomness Backend** — Choosing between OS RNG, hardware RNG, or deterministic constructions.
- **Handshake Structure** — Defining a type‑safe, verifiable handshake state machine.
- **Crypto Backend Abstraction** — Designing a backend‑agnostic interface that supports multiple libraries.

These decisions are deferred by design to ensure flexibility during implementation.
