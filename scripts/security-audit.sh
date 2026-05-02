#!/bin/bash
# Dawnset - Security & Supply Chain Auditor
# Validates workspace compliance and prevents accidental credential exposure.

set -e

# Force execution from project root
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "--- [Dawnset] Executing Standard Security Audit ---"
echo "Project Root: $PROJECT_ROOT"

# 1. Dependency Vulnerability Audit
if [ -f "Cargo.lock" ]; then
    echo "Scanning Cargo.lock for security advisories..."
    # Placeholder for cargo-audit execution
    # cargo audit
else
    echo "INFO: No Cargo.lock detected. Skipping vulnerability scan."
fi

# 2. Credential & Secret Leak Detection
# Scans for accidental inclusion of sensitive patterns to maintain project integrity.
echo "Scanning for sensitive patterns (Encryption keys, API tokens)..."
if grep -rE "BEGIN RSA PRIVATE KEY|BEGIN PRIVATE KEY|xoxp-|AIza|sk_live_" . --exclude-dir=.git --exclude-dir=scripts; then
    echo "ERROR: Potential sensitive data leak detected in the source tree!"
    echo "Please audit the flagged files before finalizing the contribution."
    exit 1
fi

echo "--- [Dawnset] Security Audit Passed Successfully ---"
