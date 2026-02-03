# Transport Framework Module

The Transport Framework provides a unified, extensible, and censorship‑resistant abstraction layer for all Dawn Bridge Core transport protocols.  
It defines the lifecycle, interfaces, handshake model, encryption boundaries, and behavioral simulation mechanisms shared across all supported transports.

This module enables the system to integrate multiple advanced circumvention protocols—xHTTP, XTLS, Hysteria2, VLESS, Reality, and Trojan—under a single coherent architecture.

---

## Background

Modern censorship systems rely on protocol fingerprinting, TLS metadata inspection, active probing, and traffic classification.  
To survive in adversarial environments, circumvention systems must support multiple transport protocols and be able to switch between them dynamically.

Implementing each protocol independently leads to:

- duplicated logic  
- inconsistent security boundaries  
- incompatible handshake flows  
- fragmented routing integration  
- difficulty adding new transports  

The Transport Framework solves these issues by providing a shared foundation for all protocols.

---

## Goals

The framework is designed to:

- unify transport lifecycle management  
- provide a consistent handshake and encryption boundary  
- support protocol camouflage and DPI evasion  
- allow new transports to be added with minimal effort  
- integrate seamlessly with the AI Routing Engine  
- expose stable interfaces for upper‑layer modules  

---

## Architecture Overview

The Transport Framework consists of four major components:

### 1. Transport Abstraction Layer
Defines the common interface implemented by all transports.

### 2. Handshake Engine
Provides shared primitives for key exchange, authentication, and obfuscation.

### 3. Session Manager
Handles connection lifecycle, retries, fallback, and error recovery.

### 4. Protocol Registry
Allows dynamic registration and selection of transport implementations.

---

## Directory Structure

```text
transport-framework/
│
├── src/
│   ├── traits/
│   │   └── transport.rs
│   ├── registry.rs
│   ├── handshake.rs
│   ├── session.rs
│   └── utils.rs
│
└── README.md
```

---

## Core Interfaces (English‑only code block)

Below is the core trait implemented by all transport protocols:

```rust
pub trait Transport {
    fn name(&self) -> &'static str;

    fn handshake(&mut self, ctx: &mut HandshakeContext) -> Result<()>;

    fn open_stream(&mut self) -> Result<Box<dyn TransportStream>>;

    fn close(&mut self) -> Result<()>;
}
```

The stream interface:

```rust
pub trait TransportStream {
    fn read(&mut self, buf: &mut [u8]) -> Result<usize>;
    fn write(&mut self, buf: &[u8]) -> Result<usize>;
    fn flush(&mut self) -> Result<()>;
    fn shutdown(&mut self) -> Result<()>;
}
```

Protocol registration:

```rust
pub struct TransportRegistry {
    transports: HashMap<String, Arc<dyn TransportFactory>>,
}

impl TransportRegistry {
    pub fn register(&mut self, name: &str, factory: Arc<dyn TransportFactory>) {
        self.transports.insert(name.to_string(), factory);
    }

    pub fn create(&self, name: &str) -> Option<Box<dyn Transport>> {
        self.transports.get(name).map(|f| f.create())
    }
}
```

---

## Handshake Model

All transports share a common handshake structure:

1. **ClientHello**  
2. **Key Exchange**  
3. **Obfuscation Layer Activation**  
4. **Transport‑specific Negotiation**  
5. **Secure Session Established**

This ensures:

- consistent security boundaries  
- predictable integration with routing  
- easier protocol extension  

---

## Integration with AI Routing

The Transport Framework exposes:

- protocol capabilities  
- performance metrics  
- detectability characteristics  
- handshake success/failure signals  

AI Routing uses these signals to:

- select the best protocol  
- avoid detectable patterns  
- fallback when censorship pressure increases  

---

## Extensibility

New transports can be added by implementing:

- `Transport` trait  
- `TransportStream` trait  
- optional handshake extensions  
- registration via `TransportRegistry`  

This design allows future protocols (including PQC‑ready transports) to be integrated without modifying existing code.

---

## Security Considerations

- All handshake metadata is minimized  
- Obfuscation is applied before any sensitive exchange  
- No protocol exposes identifiable fingerprints  
- Session boundaries are consistent across transports  
- Error messages avoid leaking internal state  

---

## Future Work

Planned enhancements include:

- unified congestion control  
- adaptive obfuscation layers  
- transport‑level anomaly detection  
- PQC‑ready handshake primitives  
- protocol auto‑tuning based on censorship pressure
