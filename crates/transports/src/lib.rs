//! Rust Unified Transport Layer (RUTL) implementation for Dawnset.
//!
//! RUTL provides the unified abstraction layer that all transport
//! protocols must implement. It defines the common interface for
//! session management, handshake behavior, encryption boundaries,
//! capability descriptors, and error handling.
//!
//! Dawnset implements three Amalgamated Protocols under RUTL:
//! - ruxvv (performance‑oriented Amalgamated Protocol)
//! - ruxsv (stealth‑oriented Amalgamated Protocol)
//! - ruxpv (survivability‑oriented Amalgamated Protocol)
//!
//! These Amalgamated Protocols are produced through the amalgamation
//! of five source protocols: REALITY, uTLS, XTLS‑Vision, XHTTP, and
//! VLESS. The source protocols are internal components and are not
//! exposed to the routing engine.

pub mod ruxvv;
pub mod ruxsv;
pub mod ruxpv;

mod source;

pub fn init_transports() {
    // Initialize RUTL transport components:
    // - register Amalgamated Protocol implementations
    // - prepare async runtime hooks
    // - load capability descriptors and feature flags
    //
    // Actual initialization logic will be implemented in v0.2.
}
