# Data

For each class of fact, define its authority, permitted writers, access shape, lifecycle, derived copies, tolerated staleness, and recovery. Authority follows the data's contract. An object store or specialized database can own its data just as a relational store can.

## Locate state

Stateless computation keeps no required progress between operations and is often easier to replicate. It still consumes CPU, memory, connections, and downstream capacity. Stateful work needs ownership, persistence, and coordination when another instance takes over. Moving state to a shared store concentrates those obligations in that store.

Distinguish business facts, execution progress, cached results, search indexes, and analytical projections. State which store wins when they disagree and who repairs a derived copy. Some facts have different authorities by field, entity, or operation; write those scopes explicitly.

Constructed example: object storage owns uploaded document bytes, a metadata database owns document access and version identity, and a search index derives searchable content. Rebuilding the index needs both source versions and access metadata. An index update alone leaves the source document's authority unchanged.

## Protect the invariant

List operations that can violate the rule, including concurrent writers and stale readers. A non-negative balance may require a conditional update and a transaction linking the ledger entry. Reconciliation can discover an error after commitment. It is a recovery mechanism rather than immediate prevention of that violation.

ACID describes transaction atomicity, consistency with maintained constraints, isolation, and durability. Actual database guarantees depend on configuration and operation. BASE describes availability-oriented approaches with eventual state. CAP concerns distributed operation during partitions. These describe different questions, so a system can combine local transactions with asynchronous projections. Name the needed observation and transaction scope using [Consistency](./consistency.md).

## Evaluate copies

- Replication places copies of a dataset on multiple nodes. It can add fault tolerance and read capacity. Synchronous and asynchronous replication differ in commit delay, failure behavior, and possible data loss. Read replicas can return old data. More replicas leave a single writer's coordination and commit capacity to be addressed.
- Sharding divides responsibility for data by a routing rule. It can spread storage and writes when load distributes across keys. Cross-shard queries and transactions add coordination, and hot keys or skew can dominate capacity. Choose by entity locality, query shape, growth, and resharding cost.
- A cache serves a retained result or copy. It reduces repeated work while adding freshness and invalidation obligations. Specify source authority, key scope, version, lifetime, refresh, and behavior on loss. A cached decision such as permission or price needs a contract for permitted staleness.

Cache invalidation has concurrent races. A reader can load an old value, a writer can update the source and delete the cache, and that reader can then refill the cache with the old value. A TTL bounds that copy's lifetime only under the stated refresh and serving rules. Versions, synchronized invalidation, or source reads can establish other contracts at a cost.

Negative caching can reduce repeated misses, with an expiry rule for newly created data. Single-flight can merge concurrent rebuilds for one key. Jittered expiry can spread refresh load. Failure of a shared cache still requires enough source capacity or controlled admission. See [Scaling](./scaling.md).

## Follow the lifecycle

Define creation, validation, change, retention, archival, deletion, and recovery. Include backups, logs, projections, and export copies where the requirement covers them. A restored backup can reintroduce deleted records unless recovery reapplies the applicable deletion history.

Changing entity identity, relationships, formats, or routing can require conversion and compatibility across real stored data. Plan from the actual consumers and in-flight work using [Migration](./migration.md). Select storage by concrete operations and constraints in [Storage](./selection/storage.md).
