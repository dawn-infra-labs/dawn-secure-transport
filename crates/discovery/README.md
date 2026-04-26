
# Dawnset Discovery Crate

The `discovery/` crate provides decentralized node discovery for Dawnset.  
It integrates multiple channels such as DHT, DNS TXT fallback, remote policy
delivery, and local freshness tracking.

This crate is intentionally minimal during **v0.1 (Architecture Foundation)** and
will become a major implementation target in **v0.2 (Core Implementation)**.

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
Dawnset follows an **architecture‑first** workflow, and implementation begins in v0.2.

---

## 3. Upcoming Work (v0.2)

During the next phase, this crate will introduce:

- DHT‑based discovery  
- DNS TXT fallback resolver  
- node verification and scoring  
- freshness tracking and local cache  
- integration hooks for RUTL and transports  

---

## 4. Architectural Challenges for the Lead Engineer

The following areas are intentionally left open for design refinement in v0.2:

- **DHT Runtime Design** — Selecting the optimal topology and routing strategy.
- **Verification Pipeline** — Designing a type‑safe, low‑overhead validation model.
- **Freshness Semantics** — Defining cache invalidation and staleness rules.
- **Policy Delivery** — Integrating remote policy channels without coupling.

These decisions are deferred by design to ensure flexibility during implementation.
