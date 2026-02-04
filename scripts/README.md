# Scripts Overview

The `scripts/` directory contains utility scripts used for development, testing, automation, and repository maintenance.  
These scripts are optional helpers designed to streamline workflows for contributors and maintainers.

At the current stage (v0.1 — Architecture & Documentation), this directory contains only documentation.  
Actual scripts will be added during v0.2 and later phases as implementation begins.

---

## Purpose

The scripts in this directory will support:

- development automation  
- code quality checks  
- build and test workflows  
- documentation generation  
- linting and formatting  
- simulation and benchmarking tasks  

Scripts are intended to improve productivity and ensure consistent development practices.

---

## Planned Script Structure

The following structure outlines the scripts expected in future phases:

```text
scripts/
│
├── dev/
│   ├── format.sh
│   ├── lint.sh
│   └── test.sh
│
├── build/
│   ├── build-release.sh
│   └── build-debug.sh
│
├── tools/
│   ├── generate-docs.sh
│   ├── simulate-censorship.sh
│   └── benchmark-transports.sh
│
└── windows/
    ├── format.ps1
    ├── lint.ps1
    └── build.ps1
```

Scripts will be organized by purpose and platform.

---

## Script Categories

### 1. Development Scripts (`dev/`)
Used during day‑to‑day development:

- formatting  
- linting  
- running tests  
- checking workspace consistency  

These scripts ensure code quality and reduce manual steps.

---

### 2. Build Scripts (`build/`)
Used to build the project in different modes:

- debug builds  
- release builds  
- cross‑compilation (future)  

These scripts help maintain consistent build environments.

---

### 3. Tooling Scripts (`tools/`)
Used for advanced tasks:

- generating documentation  
- running censorship simulations  
- benchmarking transports  
- analyzing routing behavior  

These scripts support research and performance tuning.

---

### 4. Windows Scripts (`windows/`)
PowerShell equivalents of the above scripts for Windows contributors.

---

## Development Phases

Scripts will be added progressively:

### Phase 1 — v0.2
- formatting and linting scripts  
- basic build scripts  
- test automation  

### Phase 2 — v0.3
- censorship simulation tools  
- transport benchmarking tools  

### Phase 3 — v0.4
- routing analysis tools  
- multi‑hop simulation scripts  

### Phase 4 — v1.0
- full automation suite  
- CI/CD integration helpers  

---

## Current Status

The `scripts/` directory is intentionally empty at this stage.  
Scripts will be added once the implementation phase begins.

This ensures:
- no premature tooling  
- no unused files  
- clean repository structure  

---

## Contribution Notes

When scripts are added:

- scripts must be minimal and portable  
- avoid external dependencies unless necessary  
- scripts must include comments explaining usage  
- scripts must not modify user environments without confirmation
