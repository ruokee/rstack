# State machine

A state machine defines states and the rules for responding to inputs. A transition can depend on a guard and produce effects. Use the model when permitted history, state-dependent behavior, or rejection of an operation matters.

## Define the model

Identify the initial state, accepted inputs, guards, resulting state, and effects. Give every relevant state-input pair an intended outcome, including rejection or an explicitly accepted no-op. State what remains after a guard or effect fails.

Finite control states can carry data, such as a receipt or retry count. Independent dimensions can remain separate or form a product state. Hierarchical and concurrent state models can represent larger workflows. A single flat enum is one representation.

Independent booleans are suitable when their combinations are genuinely valid. Use variants when only particular combinations and payloads belong together. State labels describe current conditions; inputs describe commands or observed facts.

## Enforce transitions

This Rust 2021 example starts pending and accepts one settlement or failure observation. Both outcomes are terminal. All `u64` receipt values and strings are valid payloads in this local model. Each call consumes its input; an invalid transition preserves the stored state.

```rust
mod payment {
    #[derive(Debug, PartialEq)]
    pub enum State {
        Pending,
        Settled { receipt: u64 },
        Failed { reason: String },
    }

    pub enum Event {
        Settle { receipt: u64 },
        Fail { reason: String },
    }

    #[derive(Debug, PartialEq)]
    pub struct InvalidTransition;

    pub struct Payment {
        state: State,
    }

    impl Payment {
        pub fn new() -> Self {
            Self { state: State::Pending }
        }

        pub fn state(&self) -> &State {
            &self.state
        }

        pub fn apply(&mut self, event: Event) -> Result<(), InvalidTransition> {
            if !matches!(self.state, State::Pending) {
                return Err(InvalidTransition);
            }
            self.state = match event {
                Event::Settle { receipt } => State::Settled { receipt },
                Event::Fail { reason } => State::Failed { reason },
            };
            Ok(())
        }
    }
}

fn main() {
    use payment::{Event, InvalidTransition, Payment, State};
    let mut paid = Payment::new();
    paid.apply(Event::Settle { receipt: 42 }).unwrap();
    assert_eq!(paid.apply(Event::Settle { receipt: 42 }), Err(InvalidTransition));
    assert_eq!(paid.state(), &State::Settled { receipt: 42 });

    let mut failed = Payment::new();
    failed.apply(Event::Fail { reason: "declined".into() }).unwrap();
    assert!(matches!(failed.state(), State::Failed { reason } if reason == "declined"));
}
```

The enum defines legal shapes. The private field and transition operation control this object's history. Callers can construct a separate `State` value. They cannot replace the private field through this API. The caller remains responsible for the authority of the observation supplied to `apply`.

## Place effects at their consistency boundary

The example changes local memory. A payment provider call has its own outcome, which may be unknown after a timeout. Represent uncertainty when it belongs to the domain. Converting that timeout into a known failure would permit incorrect later transitions.

A transition that reads and writes persistent state needs the required transaction, conditional update, or exclusive owner. Two readers of the same old state can both pass a guard. Sending an external effect and storing the new state also needs a defined partial-failure policy.

Repeated inputs can be rejected, return a previous result, or trigger an idempotent operation according to the contract. A local terminal state alone cannot establish exactly-once external effects. See [Event-driven design](./event-driven.md).

## Choose a representation

Use a direct branch or exhaustive match for a small closed model. A transition table suits uniform rules. A pure reducer can return the next state and intended actions for a [Functional core](./functional-core.md). The GoF [State pattern](../design-patterns/state.md) distributes substantial state-specific behavior across objects.

Typestate can make some transitions consume one Rust type and return another, moving legal call sequencing into compilation. Runtime-selected states may still need an enum or dynamic check. Choose the representation from the callers, payloads, and required guarantees.

Check initial and terminal states, guards, invalid transitions, repeated inputs, and failure preservation. Keep the complete transition policy inspectable in one responsible place. A workflow engine earns its added persistence and operating costs when those capabilities are required.
