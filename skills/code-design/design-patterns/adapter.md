# Adapter

An adapter translates an existing interface into the contract a caller needs. The translation can cover values, units, operations, errors, and resource ownership. One external dependency is enough to require a real translation.

## Define both contracts

Name the target operation and the foreign operation. Check the input domain, output meaning, failure categories, partial effects, lifetime, and cost on both sides. If the foreign operation lacks a required guarantee, the adapter must provide a real mechanism or expose a different contract.

For example, a timeout from a payment provider is an infrastructure failure with a possibly unknown payment outcome. A business decline is a known decision. Mapping both to a decline loses information the caller needs.

## Preserve error meaning

This Rust 2021 example adapts a supplied provider operation. Amounts are positive integer cents in an agreed currency. The provider returns an approval identifier, an explicit decline, or a transport error. The target represents a decline as a normal decision and preserves the transport error.

```rust
use std::io;
use std::num::NonZeroU64;

#[derive(Debug)]
enum ProviderError {
    Declined,
    Transport(io::Error),
}

#[derive(Debug, PartialEq)]
enum Decision {
    Approved { receipt: u64 },
    Declined,
}

fn authorize<F>(cents: NonZeroU64, send: F) -> io::Result<Decision>
where
    F: FnOnce(u64) -> Result<u64, ProviderError>,
{
    match send(cents.get()) {
        Ok(receipt) => Ok(Decision::Approved { receipt }),
        Err(ProviderError::Declined) => Ok(Decision::Declined),
        Err(ProviderError::Transport(error)) => Err(error),
    }
}

fn main() {
    let amount = NonZeroU64::new(250).unwrap();
    assert_eq!(authorize(amount, |_| Ok(7)).unwrap(), Decision::Approved { receipt: 7 });
    assert_eq!(authorize(amount, |_| Err(ProviderError::Declined)).unwrap(), Decision::Declined);
    let result = authorize(amount, |_| {
        Err(ProviderError::Transport(io::Error::new(io::ErrorKind::TimedOut, "confirmation lost")))
    });
    assert_eq!(result.unwrap_err().kind(), io::ErrorKind::TimedOut);
}
```

The operation is called once. A transport error leaves payment completion governed by the provider's contract. It is not evidence of a decline. Repeating the request requires a separate decision about duplicate effects and reconciliation.

## Choose the form

A value-conversion function can be an adapter. An object adapter holds or borrows the foreign component and delegates through it. A class adapter uses inheritance where the language supports that arrangement, coupling the adaptation to the inherited types. Use the form that expresses the real ownership and compatibility constraints.

When both sides are controlled and can migrate together, changing the original interface may remove the translation entirely. An adapter remains useful for independent versions, distinct models, or a deliberate compatibility boundary.

## Keep related concepts separate

Adaptation concerns translation. [Dependency inversion](../design-principles/dependency-inversion.md) concerns who owns the required abstraction. Injection concerns how the dependency is supplied. Implementing an already matching interface can require no adapter.

A [Decorator](./decorator.md) composes behavior around a shared interface. A [Facade](./facade.md) provides a coherent operation over a subsystem. Their roles follow their contracts. The number of wrapped objects does not determine the pattern.
