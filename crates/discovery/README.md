# Dawnset Discovery Crate

The `discovery/` crate provides decentralized node discovery for Dawnset.  
It integrates multiple channels such as DHT, DNS TXT fallback, remote policy
delivery, and local freshness tracking.

This crate is intentionally minimal during the architecture‑first phase and will
be expanded according to the system’s design and crate boundaries.

---

## 1. Purpose

The `discovery` crate will provide:

- decentralized node discovery  
- DNS TXT fallback  
- remote policy delivery  
- node verification pipeline  
- freshness and cache tracking  

These components will be consumed by the RUTL runtime and the transport layer.

---

## 2. Current Status

The crate is currently a placeholder:

- no DHT logic  
- no DNS TXT resolver  
- no verification pipeline  
- no freshness tracking  
- no policy integration  

This is intentional.

---

## 3. Architectural Challenges for the Lead Engineer

The following areas are intentionally left open for design refinement.  
They represent engineering decisions that require benchmarking, experimentation,
and cross‑crate coordination:

- **DHT Runtime Design** — Selecting the optimal topology and routing strategy.  
- **Verification Pipeline** — Designing a type‑safe, low‑overhead validation model.  
- **Freshness Semantics** — Defining cache invalidation and staleness rules.  
- **Policy Delivery** — Integrating remote policy channels without coupling.

These decisions are deferred by design to ensure flexibility during implementation.
