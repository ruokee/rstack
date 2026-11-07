# Builder

A builder owns intermediate construction state and produces a value once its requirements are satisfied. The GoF form separates a construction sequence from the representation produced by concrete builders. A fluent options builder is a common, smaller form.

## Decide where validity begins

Put required information in the initial constructor, require it through typed stages, or reject its absence at `build`. Validate cross-field rules in one authoritative construction path. Keep a partially configured builder distinct from a usable product.

Use a builder when inputs arrive in stages or optional combinations make direct construction difficult. A named-field record or ordinary constructor is simpler for a small independent set of values. Cloning an existing value can fit small variations when its ownership and copying costs are acceptable.

## Consume intermediate state

This complete Rust 2021 example illustrates consuming options and a checked cross-field rule. It constructs a half-open integer range with a nonzero step. Empty ranges are valid. Reversed bounds are rejected. For this small value, a checked constructor would also be a reasonable API.

```rust
mod ranges {
    use std::num::NonZeroUsize;

    pub struct RangePlan {
        start: usize,
        end: usize,
        step: NonZeroUsize,
    }

    impl RangePlan {
        pub fn values(&self) -> impl Iterator<Item = usize> {
            (self.start..self.end).step_by(self.step.get())
        }
    }

    pub struct Builder {
        start: usize,
        end: usize,
        step: NonZeroUsize,
    }

    impl Builder {
        pub fn new(start: usize, end: usize) -> Self {
            Self { start, end, step: NonZeroUsize::new(1).unwrap() }
        }

        pub fn step(mut self, step: NonZeroUsize) -> Self {
            self.step = step;
            self
        }

        pub fn build(self) -> Result<RangePlan, &'static str> {
            if self.start > self.end {
                return Err("start exceeds end");
            }
            Ok(RangePlan { start: self.start, end: self.end, step: self.step })
        }
    }
}

fn main() {
    use std::num::NonZeroUsize;
    let plan = ranges::Builder::new(1, 7)
        .step(NonZeroUsize::new(2).unwrap())
        .build()
        .unwrap();
    assert!(plan.values().eq([1, 3, 5]));
    assert!(ranges::Builder::new(4, 2).build().is_err());
}
```

Private fields prevent callers outside the module from bypassing construction. Consuming `self` prevents reusing that builder value after `build`, including on error. The API intentionally discards failed construction state. A builder that should support correction needs a different error or borrowing contract.

## Keep guarantees distinct

Typestate can make required stages visible at compile time. It adds types and can complicate conditional assembly. Runtime construction can express the same domain rule with a checked result. Consuming construction controls reuse of a value. It does not establish thread safety or validate unrelated input properties.

See [Factory](./factory.md) for product selection and [Data modeling](../approaches/data-modeling.md) for representation invariants.
