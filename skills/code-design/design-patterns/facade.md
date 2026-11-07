# Facade

A facade provides a coherent operation over a subsystem. It owns useful coordination so callers can express their intent without reconstructing internal sequencing. It can be a function, module, or object sharing the subsystem's dependencies.

## Identify the coordinated use

Name what the caller wants to complete and which steps must agree. A billing operation may load required data, create an invoice, and arrange notification. The facade can own sequencing, result assembly, and the partial-failure contract. Domain rules remain with their authoritative owners.

A curated package API can also act as a facade. Its value depends on the decisions and obligations hidden behind it. A single delegated call can still carry a useful compatibility or lifecycle boundary.

## Define partial completion

Consider an operation that commits an invoice and then publishes an event. A publish failure occurs after the invoice exists. An undifferentiated failure can cause a caller to create a second invoice on repetition.

Choose the contract the use case actually requires:

- Expose partial completion with the invoice identifier and notification outcome. Define how callers continue from that state.
- If invoice creation must durably schedule notification, write the invoice and an outbox entry in the same supported transaction. Success then means that the invoice and publication intent committed. Delivery occurs under a separate publisher contract.
- If the caller needs to control transaction or publication timing, expose those operations at an appropriate lower level and make their ownership explicit.

Preserve an unknown commit outcome when the storage contract reports one. A facade name cannot turn independent effects into an atomic operation. See [Unit of work](./unit-of-work.md) and [Event-driven](../approaches/event-driven.md).

## Preserve required control

Keep pagination, cancellation, batching, and meaningful error distinctions visible when callers need them. Offer lower-level operations for actual advanced uses. Preserve invariants across every supported path; direct access is a product decision rather than an automatic right to bypass coordination.

Avoid accumulating unrelated use cases into one object solely because they share infrastructure. Shared dependencies can be assembled once while each operation keeps its own contract.

## Distinguish neighboring patterns

[Adapter](./adapter.md) translates an existing contract. A facade organizes a useful higher-level operation. A mediator coordinates communication among participants that call back through it. A facade normally directs use of a subsystem whose parts can operate independently of that entry point.

Evaluate caller knowledge and exposed failure costs using [Deep modules](../design-principles/deep-modules.md).
