# Contributing to dawnset

Thank you for your interest in contributing to **dawnset**.  
This document defines the contribution workflow, terminology standards, architectural expectations, and review requirements for all changes to the project.

dawnset is a multi‑crate Rust workspace built around a unified transport abstraction and a strict architectural model.  
To maintain consistency and reviewer‑friendly clarity, all contributions must follow the guidelines below.

---

## 1. Project Architecture Overview

### 1.1 Core Architectural Concepts

- **RUTL — Rust Unified Transport Layer (First Core)**  
  The foundational abstraction of dawnset.  
  All transport protocols, discovery mechanisms, and routing logic must integrate through RUTL.  
  RUTL is always referenced first in documentation and design discussions.

- **Amalgamated Protocols (Second Core)**  
  The capability‑layered protocol family built on top of RUTL.  
  These protocols represent the “amalgamated” (combined and unified) behavior of multiple transport capabilities.

- **Module System**  
  The workspace is organized into four primary modules:  
  - `core`  
  - `transport`  
  - `discovery`  
  - `routing`  

All contributions must respect this architectural hierarchy.

---

## 2. Terminology Standards

To ensure clarity and avoid ambiguity, dawnset uses a unified terminology system.

### 2.1 Naming Conventions

- **Full project name:** `dawn-secure-transport`  
  Used only in the root README and GitHub links.

- **Short name:** **dawnset**  
  Used everywhere else (documentation, code comments, templates).

- **First Core:** **RUTL (Rust Unified Transport Layer)**  
- **Second Core:** **Amalgamated Protocols**

### 2.2 Protocol Capability Labels

All protocol descriptions must use the standardized labels:

- **Performance**
- **Stealth**
- **Survival**

These labels must be consistent across all documentation and code.

### 2.3 Terminology Table

| Term | Meaning |
|------|---------|
| **dawnset** | Short name of the project |
| **dawn-secure-transport** | Full project name (used only in root README + GitHub links) |
| **RUTL** | Rust Unified Transport Layer (First Core) |
| **Amalgamated Protocols** | Second Core protocol family |
| **Performance / Stealth / Survival** | Standardized protocol capability labels |
| **Workspace** | Multi-crate Rust project structure |

---

## 3. Contribution Workflow

### 3.1 Before You Start

- Search existing issues and discussions.  
- For architectural changes, open an **Architecture Change Proposal** issue.  
- For module documentation updates, use the **Module Update Request** template.  
- For new features, use the **Feature Request** template.

### 3.2 Branching Model

Use feature branches for all work:

```
feature/<short-description>
fix/<short-description>
docs/<short-description>
```

### 3.3 Commit Message Guidelines

Use clear, reviewer-friendly commit messages:

```
<type>: <summary>

<optional detailed explanation>
```

Allowed types:

- `feat:` new feature  
- `fix:` bug fix  
- `docs:` documentation changes  
- `refactor:` internal restructuring  
- `chore:` maintenance tasks  
- `test:` test-only changes  

---

## 4. Pull Request Requirements

Every PR must:

- Build successfully (`cargo build --workspace --all-targets`)  
- Pass all tests (`cargo test --workspace --all-targets`)  
- Pass lint (`cargo clippy -- -D warnings`)  
- Pass formatting (`cargo fmt --all -- --check`)  
- Include updated documentation when applicable  
- Follow the terminology and naming rules above  
- Reference RUTL correctly when touching transport or protocol code  
- Use **Amalgamated Protocols** terminology when describing second-core behavior  

### 4.1 PR Description Requirements

A PR must include:

- Summary of the change  
- Rationale  
- Impact on modules or architecture  
- Any alternatives considered  

---

## 5. Review Guidelines

Reviewers will check:

- Architectural correctness (RUTL-first integration)  
- Correct use of **Amalgamated Protocols** terminology  
- Naming convention compliance  
- Documentation clarity  
- Code readability and maintainability  
- Test coverage and correctness  
- Absence of unnecessary complexity  

PRs that violate terminology or naming rules will be requested to revise before review continues.

---

## 6. Code Style

- Follow Rust standard formatting (`cargo fmt`).  
- Avoid unnecessary abstractions.  
- Prefer explicitness over cleverness.  
- Keep modules small and cohesive.  
- Document all public APIs.  

---

## 7. Security Considerations

- Do not disclose vulnerabilities publicly.  
- Use GitHub Security Advisories for private reporting.  
- Follow the project’s `SECURITY.md` policy.

---

## 8. License

By contributing, you agree that your contributions will be licensed under the project’s license.

---

Thank you for helping improve **dawnset**.  
Consistency, clarity, and architectural discipline are core to the project’s identity.
