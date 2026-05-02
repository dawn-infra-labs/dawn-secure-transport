# **Dawnset Project Roadmap**

The Dawnset roadmap consists of three major phases: early-stage architectural foundation, mid-stage core development (6 months), and late-stage hardening and external review (3 months). It follows the **6+3 engineering model**, ensuring architectural consistency, verifiable engineering, and long-term maintainability.

---

## **Phase 1 — Architecture & Documentation (v0.1)**

**Status: Completed (April 2026)**

- Completion of **RUTL (Rust Unified Transport Layer)** abstract semantics.
- Completion of system architecture documents, design decision records, and threat models.
- Completion of protocol semantic analysis for **Source Protocols**.
- Completion of Dawnset’s top-level architectural abstraction and formalization.

**Version: v0.1**

---

## **Phase 2 — Review**

**Status: Under Review**

---

## **Phase 3 — Organizational Registration**

**Status: Pending**

This phase ensures legal and structural compliance, aimed at **preserving project sovereignty and expert team safety**, rather than tax optimization.

- Register **Wyoming (USA) parent entity** as the **Legal Holder**, ensuring long-term enforceability of the AGPLv3 license.
- Parent entity does **not** require a bank account.
- Register **Swiss operating company** as a **wholly-owned subsidiary**, leveraging Switzerland’s stringent privacy protection regime.
- Swiss entity opens a primary bank account.

**Estimated duration: 1–3 months**

---

## **Phase 4 — Research Lab Setup & Physical Security Isolation Zone**

**Status: Pending** *(May proceed in parallel with Phase 3 or begin immediately upon Phase 3 completion)*

- Establish an isolated development environment.
- Establish physically isolated zones for hardware (development systems and testing clusters).

**Estimated duration: 1–2 weeks**

---

## **Phase 5 — Expert Assembly & Procurement of Validation Cluster**

**Status: Pending**

- Assemble a core committee of **five to six senior experts** in distributed systems, Rust async engineering, and cryptography.
- Build validation clusters (multi-node, multi-region, and heterogeneous networks).
- Procure isolated servers, validation nodes, and network simulation equipment.
- Finalize the full research environment and internal security protocols.

**Estimated duration: 3.6–4.8 weeks (including 20% buffer)**

---

## **Phase 6 — Core Development Cycle (Month 1–6)**

**Status: Pending**

Dawnset’s core development follows **six months of mainline engineering + three months of hardening and review**. The following is the final, frozen 6+3 roadmap.

---

### **Month 1 — Source Protocol Modeling & RUTL Semantics**

- **Cross‑language State Machine Modeling** of existing Source Protocols.
- **Memory‑safe Re‑implementation** under Rust async execution semantics.
- Define RUTL abstract semantics (lifecycle, error model, and invariants).
- Initialize Rust workspace (multi‑crate architecture).
- core/: Build the async runtime skeleton.
- Initialize CI/CD, linting, and testing frameworks.

---

### **Month 2 — RUTL Core Engine & Minimal Pipeline**

- RUTL: Implement unified interfaces, capability models, and session contexts.
- core/: Develop event loops, schedulers, and error semantics.
- crypto/: Foundational cryptographic primitives (Rust async adaptation).
- discovery/: Implement DNS TXT parsing and caching mechanisms.
- transports/: Develop the minimal transport interface.
- routing/: Construct the routing state machine framework.
- Establish initial **memory‑safety invariants**.

---

### **Month 3 — Core Runtime Completion (v0.2)**

- Foundational DHT implementation (Rust async model).
- RUTL trait v1 (Stabilized interface).
- Protocol frameworks (ruxvv / ruxsv / ruxpv).
- Implement basic path selection logic.
- Implement initial **zero‑copy strategy**.
- v0.2 documentation finalization.

**Version: v0.2**

---

### **Month 4 — Amalgamated Protocols Reconstruction (I)**

- ruxvv: Implementation of handshake, key agreement, and data flow.
- **Cross‑language logic migration** (Refactoring logic from Go to Rust).
- **Async concurrency resolution** and state machine consistency validation.
- RUTL adaptation layer enhancements.

---

### **Month 5 — Amalgamated Protocols Reconstruction (II) + Distributed Network**

- ruxsv: Implementation of streaming logic and obfuscation semantics.
- ruxpv: Implementation of fragmentation and reassembly.
- Develop the path scoring engine (heuristic-based).
- Implement node state synchronization and fault recovery mechanisms.
- **Basic Validation Utilities**: Tools used solely for infrastructure stability, consistency, and performance baseline verification.

---

### **Month 6 — Full Protocol Suite Integration (v0.3)**

- Full functionality integration for ruxvv / ruxsv / ruxpv.
- routing/: Multi‑hop, scoring, and automated recovery integration.
- discovery/: DHT health metrics and self-healing logic.
- **Zero‑copy optimization** for high-throughput environments.
- v0.3 documentation finalization.

**Version: v0.3**

---

## **Phase 7 — Hardening & External Review (Month 7–9)**

---

### **Month 7 — System Hardening**

- Routing randomization and path entropy strategies.
- Cryptographic parameter strengthening and audit.
- DHT resilience enhancements and anti-partitioning.
- Deployment of a large‑scale simulation environment.
- **RUTL invariants validation** and **metadata minimization**.

---

### **Month 8 — External Security Audit (Initiation)**

- Initiate third‑party security audit with recognized partners.
- Cryptographic review and memory‑safety assessment.
- Multi‑region, multi‑node consistency validation.
- Stress testing using validation utilities in collaboration with auditors.

---

### **Month 9 — Audit Fixes & Technical Specification (v0.4)**

- Resolve all findings from the external security audit.
- Finalize **Technical Specification v0.4** and the **Security Model Document**.
- Execute **Infrastructure Public Release**, including repository hosting and final documentation publication.

**Version: v0.4**

---

## **Post‑Roadmap Plan**

After Dawnset (Dawn‑Secure‑Transport) reaches the **v0.4 stable infrastructure milestone**, development will commence on the next system:

⭐ **Dawn‑Secure‑Publish (Dawnsep)** — A content‑publication infrastructure built atop the Dawnset transport layer.
