# Distributed systems

Across independently running participants, a request can be delayed, lost, duplicated, or completed with its response lost. A timeout leaves several possible remote states. Model partial completion and unknown results explicitly.

## Define the failure model

State whether the design assumes crash-stop, crash-recovery with durable storage, network partitions, or arbitrary faulty behavior. An algorithm tolerating crashes has different premises from one tolerating malicious or Byzantine participants. Safety describes results that must remain valid. Liveness describes progress under stated conditions.

In an asynchronous network, silence alone leaves a slow participant indistinguishable from a failed one. A timeout is a local waiting decision. Pair it with status discovery and recovery appropriate to the operation. A process can fail after committing a local effect as well as before it.

Constructed example: a refund completes remotely and the response disappears. Retrying with a fresh identifier can create another refund. Query or reconcile the original operation, or reuse its identifier within the provider's duplicate-safe contract. See [Consistency](./consistency.md) for the complete effect boundary.

## Separate time from causality

Use monotonic elapsed time for local durations. Physical clocks have skew, drift, and corrections, so cross-machine timestamp order needs explicit clock assumptions. Expiring a lease on one clock leaves a paused old holder able to act after another holder takes over unless the resource rejects stale ownership, for example through fencing tokens.

Lamport timestamps preserve one direction: if A causally precedes B, A has a smaller logical timestamp. A smaller timestamp alone leaves causality undecided. A deterministic tie-breaker such as participant identity can extend the timestamps to a total order consistent with causality. That total order adds an ordering convention.

Vector clocks can distinguish causal dominance from concurrency when their metadata and participant tracking cover the relevant events. They detect a conflict relationship; the application still chooses a merge or resolution rule. Hybrid logical clocks combine physical time with logical counters. Correct snapshot and ordering guarantees depend on the database protocol using them.

## Scope coordination

Consensus lets participants agree on a value or log order under a failure model. A replicated state machine applies the same committed commands in order. The [Raft explanation](https://raft.github.io/) describes crash-fault majority progress: a 5-voter group can continue with 3 communicating voters. This is a concrete fault-tolerance example. Voter count follows the required tolerated failures and protocol.

Safety requires the protocol's durable-state and quorum rules, including during membership changes. Progress also requires a sufficiently communicating quorum and the protocol's timing conditions. Costs include communication, persistence, leadership, and replication. Business commands can legitimately use a replicated log when their required ordering and durability justify it.

A consensus decision inside a replication group leaves outside effects and stale external writers to their own contracts. Electing a leader alone leaves the old leader's access to an external resource unresolved. Client response, durable commitment, application of the command, and an external effect can occur at different points.

## State partition behavior

CAP concerns linearizable service and availability during a network partition. In its formal availability sense, every request received by a non-failing participant completes. Preserving linearizable results can require some participants to wait or reject operations. An available partitioned design needs explicit behavior for conflicting writes and reconciliation. General correctness includes business invariants beyond CAP's consistency term.

PACELC also draws attention to latency and coordination when the network is healthy. Analyze the particular operation and replication mechanism rather than assigning one permanent label to an entire product.

Choose the observation guarantee separately from transaction atomicity, delivery semantics, and recovery. The [Jepsen definition of linearizability](https://jepsen.io/consistency/models/linearizable) uses real-time operation precedence and an explicitly defined object scope. Detailed models and end-to-end duplicate handling are in [Consistency](./consistency.md).
