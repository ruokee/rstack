# Object-oriented programming

Object-oriented design groups state with the operations responsible for it. Objects can represent identity, controlled values, resource lifetimes, or interchangeable behavior. Their value comes from a coherent contract and ownership. Classes or inheritance alone do not establish that value.

## Define the invariant owner

Name the legal states, construction paths, and permitted mutations. Keep the rule with the authority that can enforce it. A value object may need only checked construction; a mutable entity may need operations that preserve its state after each call.

Functions and transparent records remain useful for transformations and data exchange. A data-only record with a separate policy function can be a deliberate design. The problem is scattered or bypassable enforcement of a rule that needs one owner.

## Control a reservation

This Rust 2021 example owns a local stock count. Every `u32` starting count is valid. A reservation requires a nonzero quantity, rejects insufficient stock, and preserves the count on rejection.

```rust
mod inventory {
    use std::num::NonZeroU32;

    pub struct Stock {
        available: u32,
    }

    #[derive(Debug, PartialEq)]
    pub struct InsufficientStock;

    impl Stock {
        pub fn new(available: u32) -> Self {
            Self { available }
        }

        pub fn available(&self) -> u32 {
            self.available
        }

        pub fn reserve(&mut self, units: NonZeroU32) -> Result<(), InsufficientStock> {
            let remaining = self.available.checked_sub(units.get()).ok_or(InsufficientStock)?;
            self.available = remaining;
            Ok(())
        }
    }
}

fn main() {
    use std::num::NonZeroU32;
    let mut stock = inventory::Stock::new(5);
    stock.reserve(NonZeroU32::new(2).unwrap()).unwrap();
    assert_eq!(stock.available(), 3);
    assert_eq!(stock.reserve(NonZeroU32::new(4).unwrap()), Err(inventory::InsufficientStock));
    assert_eq!(stock.available(), 3);
}
```

Private fields enforce the module boundary in safe Rust. `&mut self` requires exclusive access to this value for the call. Independent stock snapshots or storage writers still need an authority and concurrency contract; this object represents local state.

## Match encapsulation to the language

Rust module privacy and ownership provide compiler-enforced restrictions. Interior-mutability types introduce their own access rules. Python's underscore convention communicates internal intent; ordinary attribute access can bypass that convention. A frozen dataclass restricts ordinary field assignment and can still contain mutable children.

State the actual enforcement mechanism. A private name, type annotation, immutable binding, and validated constructor provide different guarantees.

## Compose behavior deliberately

Use [Composition over inheritance](../design-principles/composition-over-inheritance.md) to separate implementation reuse from substitution. Related state-dependent operations can use a [State machine](./state-machine.md). A method's decision can remain a [Functional core](./functional-core.md) when separating its effects is useful.
