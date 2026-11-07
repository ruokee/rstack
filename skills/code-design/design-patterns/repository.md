# Repository

A repository offers domain-facing access to persisted entities or aggregates through a collection-like contract. It contains mapping and access decisions that callers should not repeat. Storage semantics remain part of the contract wherever they affect correct use.

## Define the operations callers need

Specify identity, missing-record behavior, ordering, filtering, pagination, and the state returned. State whether results are detached snapshots, tracked objects, or session-bound values. Define when loading performs I/O and whether following a relationship can issue another query.

For example, a reservation operation needs current availability and an atomic update under competing writers. Returning a mutable inventory snapshot does not make a later save safe. A conditional update with an expected version, or an appropriate transaction and lock, can enforce the required rule.

Use query-specific projections for reporting when loading full aggregates would waste work. Keep a caller's batch operation visible so implementations can avoid repeated per-item queries.

## Choose what to hide

A repository can hide row mapping and domain-oriented queries. Exposing a vendor query builder, ORM session, or lazy collection keeps that dependency public. Choose it deliberately if callers need that query model.

Direct SQL or an existing ORM interface can be sufficient for a small data-access operation. A repository is valuable when it owns a meaningful domain contract or access policy. One storage implementation can be enough; hypothetical database replacement is a weak justification.

## Place the transaction owner

When several repository operations must commit together, give them the same transaction scope and a common completion owner. Internal commits would end that coordination early. A repository operation can own a transaction when its public contract is itself the complete atomic operation.

Keep commit ownership explicit in the API and document nested usage. Read [Unit of work](./unit-of-work.md) for coordinated change tracking and completion.

## Verify storage semantics

Exercise actual constraints, query results, update conflicts, loading behavior, and transaction outcomes against the real implementation. An in-memory substitute can support pure policy checks. It can differ in ordering, isolation, identity, and failure behavior.

Measure query count and transferred data for representative caller operations. A clean method name can still conceal an unbounded scan or an N+1 query pattern.

Use [Dependency inversion](../design-principles/dependency-inversion.md) when the policy owns the persistence contract. A [Facade](./facade.md) can coordinate a broader use case over repositories and other dependencies.
