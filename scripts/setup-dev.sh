#!/bin/bash
# Dawnset - Development Environment Setup
# Ensures the local environment aligns with high-performance engineering standards.

set -e

# Force execution from project root
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "--- [Dawnset] Starting Environment Initialization ---"
echo "Project Root: $PROJECT_ROOT"

# 1. Check for Rust Toolchain
if ! command -v cargo &> /dev/null; then
    echo "ERROR: Cargo not found. Please install the Rust toolchain from https://rustup.rs/"
    exit 1
fi
echo "OK: Rust toolchain detected."

# 2. Install Required Rust Components
echo "Checking essential Rust components..."
rustup component add rustfmt --toolchain stable
rustup component add clippy --toolchain stable
echo "OK: Standard components (rustfmt, clippy) are verified."

# 3. Supply Chain Security Tooling
# We mandate cargo-audit to prevent vulnerable dependencies in the transport stack.
if ! command -v cargo-audit &> /dev/null; then
    echo "INFO: Installing 'cargo-audit' for supply chain security..."
    cargo install cargo-audit --features=vendored
else
    echo "OK: 'cargo-audit' is already installed."
fi

# 4. Final Verification
echo "--- [Dawnset] Setup Complete ---"
echo "Next steps:"
echo "1. Run './scripts/workspace-check.sh' to verify architecture."
echo "2. Start implementing transport logic in 'crates/'."
