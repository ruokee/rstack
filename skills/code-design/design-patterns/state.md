# State pattern

The GoF State pattern delegates state-dependent operations to a current state object. A context owns the ongoing interaction and common data. Each concrete state implements the state contract. Changing the active state changes how subsequent requests behave.

## Start from the state model

Define legal states, events, guards, transitions, and failure outcomes using [State machine](../approaches/state-machine.md). Then choose how to organize behavior. State objects, enums with matching, transition tables, and reducers are alternative implementations of that model.

Polymorphic state objects fit when several operations have substantial behavior specific to each state. For example, a connection can handle sending, receiving, and closing differently while handshaking, open, or draining. Keeping each phase's related behavior together can be clearer than repeating phase checks throughout those operations.

## Assign transition responsibility

Choose whether a state computes the next state or the context decides it. A state can return a transition result for the context to apply. This can keep context mutation controlled while preserving local state-specific decisions.

Specify when effects occur relative to the state change and what remains after failure. Entering a state may acquire a resource; leaving it may require explicit completion. Replacing an object reference alone supplies none of those semantics.

State-local transitions keep behavior near its conditions. They can also spread the transition graph across files. A central transition table gives one place to inspect allowed transitions. Compare these costs for the actual operations.

## Own state data

Separate data common to the context from data that exists only in one state. Share stateless state instances only when their behavior and captured dependencies permit it. Give per-instance state and resources an explicit lifetime.

In Rust, trait objects permit runtime state implementations and add dynamic dispatch. Ownership can make replacement of a borrowed state awkward; a state method returning a transition or an enum can simplify it. Closed enums also support exhaustive matches. Typestate can restrict which operations are available at compilation, with costs for dynamic storage and conditional transitions.

## Choose the smaller representation

Use a branch or table when states mainly change a result or transition permission. Adding state classes for trivial forwarding distributes one small operation unnecessarily. Extensible state objects can make a new implementation local; transitions into it and common contracts may still need changes.

[Strategy](./strategy.md) varies an algorithm selected for an operation. State organizes behavior by lifecycle and transition rules. [Command](./command.md) can represent a request that triggers a transition or an effect scheduled by it.
