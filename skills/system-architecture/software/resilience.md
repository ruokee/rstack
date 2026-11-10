# Resilience

Design for the actual failure, its propagation, and recovery. A slow dependency can retain connections, memory, and worker slots, causing healthy paths to queue behind it. Retry traffic can amplify that pressure.

## Budget elapsed time

Derive an end-to-end deadline from the operation's contract. Allocate time for admission, downstream work, local processing, response, and any permitted retry. Pass the remaining deadline through the call chain. Constructed example: a 3-second operation reserves local margin and gives a dependency at most 2 seconds. Its retries share those 2 seconds.

A timeout limits waiting at a defined layer. It can leave remote work running. Check whether cancellation reaches queued and executing work, whether that work cooperates, when resources release, and what side effects may already have committed. A disconnected caller and a stopped business operation are different states.

## Retry within the contract

Retry when the error is eligible, repetition is safe, time remains, and additional load fits the retry budget. Distinguish a known rejection before execution from a lost response after possible completion. An unknown external effect follows [Consistency](./consistency.md).

Place retry ownership deliberately. If each of three layers makes up to three attempts, one caller operation can generate up to 27 deepest calls. Count attempts, including the first one, and any provider retries. Backoff gives a recovering dependency time; jitter disperses synchronized clients. Limits on attempts, total elapsed time, and aggregate retry load constrain different costs. Choose values from the workload and objective.

An expired business operation can need status reconciliation after its user-facing deadline. Give that recovery a durable owner and its own explicit policy. Starting a new business operation is a separate decision.

## Contain propagation

Bulkheads partition concurrency, connections, memory, or other resources by dependency or workload. They protect a critical path when another path exhausts its share. Their cost is unused reserved capacity and more complex sizing.

Cells isolate groups of users or work through separate operating resources. Shared databases, identity providers, deployment controls, and recovery tools can remain common failure causes. Shuffle sharding assigns each workload a subset of resources to reduce identical overlap. Partial overlap and shared dependencies still transmit some load or failure.

A circuit breaker stops sending ordinary calls after a defined failure signal. It moves from normal operation to rejection, then allows bounded probes before recovery. Set its scope, error classification, observation window, probe load, and caller result. A false trip sacrifices useful work; aggressive probing can overload recovery. It limits further traffic rather than undoing work already sent.

## Control overload

State where work waits, its capacity and maximum age, who experiences that wait, and what happens when limits are reached. Backpressure asks upstream to slow down and requires upstream cooperation. Admission control rejects or defers work before consuming scarce resources. Load shedding chooses which work to stop accepting or executing under pressure.

Distinguish accepting durable work from completing it. A queue needs status, expiry, duplicate-safe consumers, dead-letter ownership, and recovery capacity. It absorbs temporary imbalance. For sustained overload, reduce admitted demand or raise effective capacity.

Degradation supplies a previously agreed reduced result: omit recommendations, serve a permitted stale view, or accept work for later. Check the invariant before using a cached or default value. A missing stock check cannot justify a confirmed reservation. Define the user-visible promise and restoration condition.

## Restore the result

Choose recovery point objective, or RPO, for tolerable lost committed data and recovery time objective, or RTO, for tolerable restoration time. Use the relevant failure scope. Online redundancy can preserve service through component loss. Backups and retained history can recover from deletion or corruption that replication also copied.

List dependency order, credentials and access needed during failure, authoritative state, takeover rules, and backlog replay. Recovery controls need an available route when the failed dependency is unavailable. Restore evidence must include reading and using the recovered state. Check that recovery load fits the surviving resources.

An SLI measures a defined service outcome. An SLO sets its target and window. An SLA records a contractual commitment and consequences. An error budget is the allowed failure portion under the chosen SLO. A request-based budget measures failed requests; a time-based budget measures downtime. Release restrictions and exceptions follow the project's actual policy.

Failure exercises need a question, observable results, a bounded affected area, an abort method, and execution permission. Use the environment and failure scope needed for that question. Observation and response tooling are in [Observability](./selection/observability.md).
