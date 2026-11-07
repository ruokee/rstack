# Event-driven design

An event records or announces a fact, such as `OrderPaid`. Consumers react through an agreed schema and delivery mechanism. This separates the producer's operation from the implementation of its reactions while introducing delivery, timing, and failure contracts.

## Define the message

A command requests an operation, such as `ChargeCard`. An event describes an observed outcome, such as `PaymentCaptured`. A notification may carry the fact itself or tell a consumer to read current state. In the latter case, that later read can observe a newer version.

Meaning and routing are separate choices. An event can have one consumer, and several workers can compete to execute commands. Required event reactions remain real dependencies. If an operation promises that a reaction has completed, its owner needs evidence of that completion.

Define the payload's meaning, identity, relevant version, and whether it captures event-time data or a reference to current data. Consumers that require different schema versions need a compatible evolution or migration plan.

## Choose delivery semantics

- Synchronous dispatch runs handlers before returning. Define order, reentrancy, and whether a failure stops later handlers or collects their errors. Earlier effects may already have completed.
- Asynchronous in-process dispatch hands work to an owned task or queue. Define capacity, task ownership, failure reporting, and shutdown. Memory-only messages are lost on process termination.
- Durable transport defines persistence, acknowledgment, retention, ordering, and redelivery within its own boundary. State exactly what a successful publish or acknowledgment confirms.

An enqueue acknowledgment and a completed business effect are different milestones. Ordering might apply to one key or partition. Concurrent consumers can finish in a different order from delivery. Match the required order to the actual execution mechanism.

## Coordinate persistence

Publishing before a database commit can expose a fact whose transaction later rolls back. Publishing after commit leaves a gap if the process stops before publication. When the requirement joins stored state and eventual delivery, an outbox can record the state change and message in the same transaction, with a separate delivery owner.

The outbox still needs a policy for delivery failure and duplicates. Use it when the atomic boundary is required. A direct call or local [Observer](../design-patterns/observer.md) can be enough for in-process reactions.

## Handle repetition at the effect

At-most-once delivery permits loss. At-least-once delivery permits repeats. An exactly-once claim needs a named boundary and failure model. A broker's transaction does not automatically include an external payment or email.

Choose idempotent effects, deduplication, or transactional coordination according to the operation. When a deduplication marker and database change must succeed together, commit them atomically. A read-then-write check alone races with other consumers. Define the deduplication key, retention period, and behavior for a repeated key with different content when these affect correctness.

Required retries need an owner, a stopping condition, and a disposition for persistent failure. A dead-letter queue retains failed work for a defined follow-up process. It does not complete that work. Preserve enough operation context to connect a consumer failure to its cause.

## Own the lifecycle

Specify when admission stops, how queued work drains or is abandoned, and when active handlers finish cleanup. Track subscriptions or registrations that outlive their useful scope. Bound event cascades through the actual work and queue limits; inspect feedback cycles that can generate more events indefinitely.

Event sourcing makes an event sequence the authoritative state history. That choice adds event evolution, replay, and projection-consistency duties. Ordinary event publication can coexist with a database that remains authoritative. Replaying historical events needs an explicit policy for external effects.

Use this approach for independent reactions, extension points, and workflows that benefit from separated delivery. Keep a direct sequence when its control flow and completion contract are clearer. See [State machine](./state-machine.md) for repeated inputs and [Async concurrency](./async-concurrency.md) for task and queue bounds.
