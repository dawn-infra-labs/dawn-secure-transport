#!/bin/bash
# Dawnset - Workspace Consistency Checker

set -e

# CRO Logic: Force the script to run from the project root
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "--- [Dawnset] Initiating Architectural Integrity Check ---"
echo "Project Root: $PROJECT_ROOT"

# 1. Directory Structure Validation
REQUIRED_DIRS=("crates" "docs" "scripts" "tests" "architecture")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "OK: Directory '$dir' found."
    else
        echo "ERROR: Critical directory '$dir' is missing!"
        exit 1
    fi
done

# 2. Root Strategy Document Validation
# NOTE: Ensure filenames match EXACTLY (case-sensitive)
REQUIRED_DOCS=("FUTURE_RESILIENCE.md" "PROTOCOLS.md" "LICENSE" "README.md")
for doc in "${REQUIRED_DOCS[@]}"; do
    if [ -f "$doc" ]; then
        echo "OK: Root document '$doc' verified."
    else
        echo "WARNING: Strategic document '$doc' missing from root. Check filename casing."
    fi
done

echo "--- [Dawnset] Integrity Check Completed Successfully. ---"
