# Messaging

Choose by the role of the retained information: a rebuildable cache, executable work, or a stream of facts. One product can implement several roles with different configurations and guarantees. Compare alternatives using [Decisions](../../core/decisions.md).

## Choose a cache

A cache retains a derived result to avoid repeated work. A local cache avoids network calls but gives each process its own freshness and memory obligations. A distributed cache shares results while adding network and service dependencies. A CDN places suitable content near readers, with key, invalidation, and content-access rules.

Define authority, key scope, expiry, invalidation, refresh concurrency, and the result after cache loss. A product commonly used for caching can also hold authoritative state under a different persistence contract. Call that state by its actual role. Mechanisms for stale refills and rebuild load are in [Data](../data.md) and [Scaling](../scaling.md).

## Choose a queue

A task queue separates acceptance from execution. Define what a durable acceptance acknowledgment promises and how a client discovers completion. It can absorb bursts and let workers recover unfinished work. A persistent capacity deficit still grows backlog.

Evaluate producer acknowledgment and durability, replication failure behavior, consumer leases or visibility windows, acknowledgment timing, redelivery, ordering, expiration, and dead-letter handling. A crash after a side effect but before acknowledgment can repeat the effect. Consumer duplication safety follows [Consistency](../consistency.md).

Constructed example: accepted document-processing jobs remain queued during a worker outage. On recovery, workers need enough capacity to process new arrivals and drain the backlog before the promised completion window. Oldest-job age can reveal a missed promise even when the queue count falls.

## Choose a fact stream

A command asks a participant to perform an operation. An event reports an occurrence. A retained log supports replay and independent subscriber positions within its retention contract. Pub/Sub provides logical subscription fan-out; consumers within a group may share that group's work.

Specify event identity and meaning, schema evolution, ordering key, partitioning, replay horizon, and handling of late or duplicate facts. Replaying a notification event can send another notification unless the effect boundary prevents it. Required audit history needs the appropriate completeness and retention contract.

Order within a partition leaves cross-partition order unresolved. An acknowledgment can mean broker receipt, durable replication, or completed consumer work. Name the exact one. The end-to-end operation can cross several such boundaries.

## Compare operational contracts

Compare retained logs, routed task queues, lightweight channels, and managed offerings on the required semantics rather than their labels. Managed operation shifts broker maintenance to a provider while consumers retain responsibility for quotas, backlog, delivery semantics, incident response, and exit.

Check the selected product version's durability, transaction scope, limits, ordering, retention, and recovery. Include staffing and the cost of replaying or migrating retained data. Connect business commits to publication through a suitable transactional or recoverable mechanism, such as an Outbox, when the operation requires both. Its delivery and external-effect limits are in [Consistency](../consistency.md).
