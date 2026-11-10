# Consistency

Start with an invariant and the operations that could violate it. Examples include unique allocation, conserved ledger value, or one refund for one business operation. Identify the objects, transactions, observers, and external effects covered by each guarantee.

## Specify the observation

Consistency models describe different contracts. Name the needed one and its scope.

- Linearizability makes each operation appear atomic at a point between its invocation and response. The order respects real-time precedence: an operation completed before another begins precedes it. The object can be a key, a collection, or another scope defined by the service. Concurrent operations can take either permitted order. A replica may wait or reject a read to uphold the contract.
- Serializability makes committed transactions equivalent to some serial execution. That order can differ from wall-clock precedence. Strict serializability also respects real-time precedence between transactions.
- Sequential consistency preserves each participant's operation order within one common order. Real-time precedence across participants is a separate requirement.
- Read-your-writes is a session guarantee that subsequent reads reflect that session's writes. Monotonic reads prevent a session from moving backward through versions. Neither alone establishes a global order.
- Causal consistency preserves causal dependencies, such as seeing a reply after its originating message. Concurrent independent updates need a conflict policy.
- Eventual convergence promises replicas converge after updates cease and communication and reconciliation complete under the system's assumptions. A bounded staleness deadline needs an additional contract.

Check the database's actual isolation level and access path. A transaction with weaker isolation can admit write skew or lost updates. A linearizable single-key operation leaves cross-key invariants to a multi-object mechanism. The word "strong" leaves these scopes unspecified.

## Commit local changes

A local transaction can atomically commit business state, a deduplication record, and an outbox row when all belong to the same transactional resource. Isolation, uniqueness, conditional writes, or locks must also preserve the invariant under competing requests.

Constructed example: two modules in one process both reserve stock. One transaction reads available stock and conditionally reduces it while creating the reservation. Route all authorized writes through the same invariant-preserving operation or enforce the rule in the shared store. A service split adds communication and partial failure. Process count is separate from authority.

Two-phase commit coordinates an atomic decision across participating transactional resources. Participants durably prepare, then follow the coordinator's durable commit or abort decision. Prepared participants can retain locks and block while the decision is unavailable. Recovery needs durable records and a way to resolve in-doubt transactions. Compare that cost with the invariant's actual need. An arbitrary third-party API is outside this contract unless it explicitly participates.

## Coordinate committed steps

A Saga advances through local commits and business-valid compensations. State what is visible between steps, which actions can still proceed, who schedules recovery, and what happens when compensation fails. Compensation adds a new business action to an existing history. A database rollback undoes uncommitted work within its own contract.

Refunding a settled payment can compensate its monetary effect. Sending a correction can address a sent message. The original external action remains part of history. Inventory compensation also needs a rule for goods already consumed or allocated elsewhere.

An orchestrator owns progression and exposes one place to inspect a stuck operation. It adds a coordinator whose state and availability need management. Choreography lets participants react to events; progression and recovery responsibilities then span those participants. Choose by visibility, change coupling, and recovery needs rather than step count.

## Deliver committed facts

An Outbox records the event with business state in the same local transaction. A relay polls committed rows or tails the transaction log and publishes them. A crash after publishing but before recording success can cause redelivery. Consumers need duplicate-safe effects and a retained replay policy. Persistent backlog also needs an owner and recovery capacity.

Change data capture, or CDC, reads committed changes from a log or equivalent source. Define snapshot position, log retention, schema handling, restart position, and ordering scope. Order may hold only within a source log, partition, or entity. Repartitioning, parallel delivery, and sink application can change what a consumer observes. Database commit order alone leaves downstream order unspecified.

Outbox and CDC can close the gap between a committed fact and eventual publication under their delivery and recovery assumptions. They add delivery state, delay, and operational work. They leave the consumer's transaction and external effects to the consumer's own mechanism.

## Make repetition safe

For a duplicate-safe local operation, define:

- A stable business operation identifier, scoped to the relevant caller or tenant and operation type. Retries reuse it. A new request with changed meaning needs its own operation or an explicit conflict response.
- A durable uniqueness or serialization mechanism for concurrent requests with that identifier.
- Atomic commitment of the business effect and completion record within the controlled resource, including the result to replay.
- Behavior while the first execution is in progress, and after it has completed or failed.
- Retention covering permitted retries and delayed delivery. After expiry, a separate business uniqueness constraint or explicit expiry policy determines whether repetition is legal.

Recording the key before a non-atomic effect can leave a permanently skipped operation. Recording it afterward can repeat the effect after a crash. A uniqueness constraint coordinates competing keys only within the resource it controls. Result replay should preserve the original business outcome according to the API contract.

## Resolve external unknowns

Constructed refund example: a provider completes a refund, then its response is lost. The caller times out. A local request table still says `pending`. The local database controls that row. The provider controls the refund.

Check whether the provider accepts the same stable operation key, its scope and retention period, how concurrent duplicates behave, and how a result can be queried. Persist the operation key and an explicit unknown or pending-reconciliation state. Assign a component to query status, consume a reliable completion notification, or reconcile records. An unresolved operation needs an escalation owner and a defined next action.

When provider deduplication covers the retry horizon and concurrency, reuse the same key within that contract and persist the confirmed result. A sound proposal satisfying those conditions can pass with zero findings. When a provider lacks duplicate-safe execution, determine the original result before initiating another effect. Blindly issuing a new key creates a new refund opportunity. Bounded retries also need the conditions in [Resilience](./resilience.md).

Transport-level exactly-once claims need the same boundary analysis. A broker's consume-process-produce transaction can cover its own records. A payment or email sent outside that transaction needs its own contract. At-least-once delivery plus local deduplication gives one committed local effect only when the atomicity, concurrency, identity, and retention conditions above hold.

## Store history deliberately

Event sourcing stores authoritative domain events and derives state by replay. It supports historical reconstruction and new projections when event semantics, completeness, ordering, and evolution remain valid. It adds event-version handling, replay cost, snapshot management, and retention obligations. Replay must separate rebuilding state from repeating external effects.

CQRS separates write and read models. It can use one database or distinct stores, with or without event sourcing. Separate projections can optimize queries and isolate read load. Their freshness, repair, and rebuild become explicit contracts. Synchronous updates within one transaction and asynchronous projections provide different guarantees. Select this separation when its query or operating benefit pays for the additional model and synchronization work.

For authority and derived data, read [Data](./data.md). For partial failure and consensus, read [Distributed systems](./distributed-systems.md). For compatibility and backfill, read [Migration](./migration.md).
