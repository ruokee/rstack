# Migration

Use [Evolution](../core/evolution.md) to define preserved obligations and the reason for change. Here, define how code, consumers, state, and authority move through the transition. Each consequential stage needs an owner, entry condition, completion evidence, and recovery condition.

## Choose a change boundary

A complete cutover can be simpler when all consumers can change together and an acceptable pause resolves in-flight work. A strangler routes a defined capability or traffic cohort to its replacement. The routing boundary must cover all relevant entry points and preserve the operation's identity and state authority.

Branch by abstraction puts replaceable implementations behind an internal contract while callers move to it. It can support gradual replacement of a widely used dependency. The temporary interface and flags add maintenance and can hide capability differences. Remove obsolete routes after the cutover obligation ends.

Expand-contract first introduces a representation usable during coexistence, moves consumers and stored state, and finally removes the old representation. Define which reader and writer versions coexist and how each handles each representation. Consumers can include background jobs, old clients, historical events, and recovery tooling. Use a clean cutover when compatibility is unnecessary.

## Keep one authority per scope

State the authoritative writer for each entity, cohort, or capability at every stage. Read routing and write authority are separate decisions. Explain the status of in-flight requests, scheduled jobs, queued events, and cached routes during a switch. A stale writer can undo a clean-looking cutover unless draining, a write fence, an epoch, or an equivalent mechanism prevents its commits.

Independent dual writes can partially succeed. Writing old first can leave the new store behind; writing new first can leave old behind. Retrying both needs identity and duplicate safety. Define which committed fact drives repair and how an acknowledged operation survives restart. A source transaction with an Outbox or a recoverable change log can make replication follow one authority. Two separately successful calls alone leave an atomicity gap. Mechanisms are in [Consistency](./consistency.md).

## Backfill without losing live changes

Constructed entity timeline:

1. Backfill reads `order-A`, version 1, status `pending` from the old store.
2. A live update commits version 2, status `completed` at the source.
3. Replication applies version 2 to the new store.
4. Backfill attempts to apply its saved version 1.

An unconditional final write restores stale state. Coordinate the snapshot and live stream, or make the destination apply older versions harmlessly. The mechanism must cover the actual ordering and transaction contract.

One approach takes a consistent snapshot tied to source log position L0, retains changes from that position, loads the snapshot, and applies the changes in source order. Define the snapshot/log handoff so every committed change is covered, and retain the log until all required consumers have passed it. Track source and applied positions per ordering scope, such as partition. A moving source head needs a bounded comparison or a cutover barrier.

If snapshot loading overlaps stream application, a destination can conditionally apply only a newer source entity version, using an atomic comparison and write. Equal versions must represent the same logical effect or have an explicit conflict rule. Versions need source-defined ordering within that entity and a rule for deletion and recreation. A local arrival timestamp leaves late old data able to win.

Capture deletes as tombstones or equivalent ordered changes. Retain them through the period in which a late snapshot or replay can reintroduce the entity. Recreated identities need a generation or ordering rule that distinguishes them. Replayed events must be duplicate-safe. Multi-row invariants require transaction-aware application or a contract that accepts intermediate visibility.

Persist backfill progress and repair state. Include failed batches, conversions, source log gaps, and destination errors in the completion criteria. Vector-index backfills also consume embedding capacity and money; account for their document and embedding versions.

## Define cutover stages

A source-log migration can use these stages, adapted to the actual contract:

- Prepare: old storage owns writes and serves reads. Establish compatible consumers, snapshot/log positions, retained changes, and the destination apply contract. Recovery can abandon unused destination work while old service remains valid.
- Populate: old remains authoritative. Backfill and capture live changes. Track watermarks, deletes, failures, and semantic invariants. Pausing population is safe while the source and retained log still cover the required history; loss of that history requires a new consistent population.
- Compare: old still owns writes. Compare corresponding versions or account for replication lag. Counts alone miss wrong values and missing deletions. Check critical queries, identities, amounts, access behavior, and required invariants. Read routing may move separately if its freshness contract permits it. Returning reads to old requires old to satisfy the reader contract.
- Transfer authority: establish a barrier, drain or fence old writers, finish changes through the barrier, verify destination readiness, and route subsequent operations to the new authority. State how rejected, queued, and in-flight operations resume. If a brief pause is unacceptable, use a scoped ownership-transfer protocol with equally explicit ordering and fencing.
- Retire: after the recovery obligation and remaining consumers are resolved, end replication and remove old write paths, flags, jobs, and representations. Preserve required history and recovery material under the actual retention contract.

An acceptance target for mismatch rate needs a definition of allowable differences. A low average mismatch rate can conceal an unacceptable money or deletion error. Cutover conditions follow the invariants and operating targets.

## Isolate shadow execution

Shadow work compares a candidate with the serving implementation while the serving result remains authoritative. Prevent the candidate from issuing real payments, notifications, writes to shared business state, or other external effects. Use an effect boundary that records intended actions or an isolated destination. Give shadow work a resource budget and separate observations so it cannot exhaust production capacity or count as real business completion.

Record candidate failures at that isolation boundary and define how the comparison handles them. The serving operation keeps its own error contract. Compare deterministic values exactly where required. Compare open-ended AI responses using [Evaluation](./ai/evaluation.md). Production traffic use needs the current task's permission.

## Recover after authority moves

New-only writes invalidate an immediate return to stale old storage. For example, new storage can hold `order-A=completed` and a new `order-B`, while old has only `order-A=pending`. A routing reversal loses both current state and an accepted obligation.

Choose a recovery mechanism that fits the contract: ordered reverse replication from the new authority, replayable committed history, a pause to synchronize and transfer ownership back, or forward repair while the new authority remains in charge. Reverse synchronization needs conflict and loop handling. Confirm old formats can represent new facts and old code can interpret them before transferring authority back. Fence the outgoing writer again.

Payments already made, messages sent, and other irreversible effects need valid compensation or reconciliation. Define who owns an unknown result and remaining work. A rollback switch controls a route. Current data, compatible behavior, authority, and accounted effects establish the recovery path.
