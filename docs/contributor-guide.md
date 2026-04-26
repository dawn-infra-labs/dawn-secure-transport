# Contributor Guide

This document provides guidelines for contributors participating in the
development of Dawnset.  
It outlines the development workflow, coding conventions, repository structure,
and review expectations to ensure consistency, clarity, and long‑term
maintainability.

The goal is to maintain a clean, predictable, and professional engineering
environment.

---

## 1. Development Workflow

### Branching Model
- `main` contains stable, reviewed work  
- feature development occurs in dedicated branches  
- branches should follow the naming pattern:

```text
feature/<crate>-<short-description>
```

### Commit Guidelines
- commits must be atomic  
- commit messages must be descriptive and scoped  
- avoid mixing unrelated changes  

### Pull Requests
- each PR must address a single topic  
- PR descriptions must include context and rationale  
- reviewers may request changes before merging  
- PRs must pass automated checks  

---

## 2. Repository Structure

The repository is organized into clearly defined directories:

```text
architecture/      → internal system design and abstractions
docs/              → public-facing documentation
crates/            → Rust workspace (implementation)
.github/           → contribution workflows, templates, and policies
```

Each directory has a specific purpose and should not be mixed with others.

---

## 3. Coding Conventions

### Language
- Rust is the primary implementation language  
- all code must follow Rust’s official style guidelines  

### Formatting
- use `rustfmt` for formatting  
- use `clippy` for linting  

### Error Handling
- avoid panics in production code  
- use `Result<T, E>` consistently  
- prefer explicit error types  

### Safety
- unsafe code must be avoided unless absolutely necessary  
- any unsafe block must include justification and documentation  

---

## 4. Testing Guidelines

### Test Types
- unit tests for individual components  
- integration tests for crate interactions  
- simulation tests for **challenging connectivity environments
  (restricted, unstable, filtered, or unreliable networks)**  

### Requirements
- all new features must include tests  
- tests must be deterministic  
- avoid network‑dependent tests unless mocked  

---

## 5. Documentation Requirements

### Code Documentation
- all public functions must include doc comments  
- complex logic must include inline explanations  

### Architecture Alignment
- implementation must follow architecture documents  
- deviations must be documented and justified  

### Contributor Notes
- contributors should update relevant docs when modifying behavior  

---

## 6. Security Expectations

### Principles
- minimize metadata  
- avoid static identifiers  
- follow secure‑by‑design practices  

### Reviews
- security‑sensitive code requires additional review  
- cryptographic changes require explicit approval  
- changes affecting routing or transport behavior must be reviewed carefully  

---

## 7. Contribution Rules

### Do
- keep changes small and focused  
- follow the established directory structure  
- write clear commit messages  
- maintain consistency with existing code  
- ensure tests and documentation are updated  

### Don’t
- introduce new dependencies without discussion  
- modify architecture documents without justification  
- merge without review  
- commit generated files  

---

## 8. Review Process

### Steps
1. contributor opens a PR  
2. automated checks run  
3. reviewers evaluate code  
4. contributor applies requested changes  
5. PR is approved and merged  

### Review Criteria
- correctness  
- clarity  
- security  
- performance  
- consistency with architecture  
- maintainability  

---

## 9. Getting Started

### Requirements
- Rust toolchain (stable)  
- familiarity with async Rust  
- understanding of **connectivity constraints and traffic classification models**  

### Recommended Reading
- architecture documents  
- protocol documentation  
- security considerations  
- research notes  

---

## 10. Collaboration

Contributors may collaborate through:
- issues  
- pull requests  
- discussions  
- architecture proposals  

All contributions should follow the project’s professional, transparent, and
long‑term‑oriented engineering standards.
