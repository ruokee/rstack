# Scaling

Locate the constrained resource under the actual workload before choosing a capacity change. Separate average throughput, burst behavior, concurrency, and latency distribution. General flow and stable-window reasoning are in [Dynamics](../core/dynamics.md).

## Measure demand on resources

Attribute CPU time, retained memory, connections, storage I/O, network, persistent storage, and concurrency to an operation class. Include fan-out, background jobs, retries, cache rebuilds, replication, and migration. A low fleet average can hide one saturated worker, lock, shard, or key.

Constructed estimate: at 200 completed operations per second, each retaining 2 MB for an average 0.5 seconds, that active population retains about `200 × 0.5 × 2 = 200 MB`. This stable-window estimate excludes idle processes, caches, queues outside that boundary, and size variation. Peak and tail requirements need their own observations.

An M/M/1 model assumes Poisson arrivals, independent exponential service times, one server, and arrival rate λ below service rate μ. Its mean time in system is `1 / (μ - λ)`, including service, and mean queue wait is `λ / (μ × (μ - λ))`. The growing delay near saturation explains the model's behavior. Real workloads need their actual variability and scheduling assumptions. Headroom follows the required outcome rather than a universal CPU ratio.

## Choose the changed resource

Vertical scaling can add CPU, memory, or I/O capacity with limited coordination change. It has price and physical limits. Existing redundancy can remain in place. Horizontal replication adds operating instances, with benefits limited by shared state, downstream quotas, coordination, and routing. Added nodes need correct takeover to provide fault tolerance.

Compare eliminating repeated work, indexing, batching, caching, single-flight, admission changes, replication, and sharding against the identified resource. Batching amortizes setup at the cost of waiting and larger partial work. Stateless replicas still share dependencies. A write bottleneck can come from unnecessary writes or locking as well as a storage capacity limit.

## Distribute state deliberately

Range partitioning preserves locality for range operations and can concentrate current-time traffic. Hash partitioning distributes distinct keys under its hash assumptions while spreading range queries. A single hot key remains hot. Read replicas or local caches can spread reads. Splitting a counter across keys can spread writes while adding aggregation and consistency work.

Changing `hash(key) % N` to `% (N + 1)` moves about `N / (N + 1)` of keys under a uniform-hash model and stable node numbering. A balanced consistent-hash ring moves an expected share around `1 / (N + 1)` when adding one equal-capacity node to N nodes. Virtual nodes can reduce random imbalance. Placement balance leaves unequal request rates and hot keys to be handled separately. Resharding consumes storage, network, and write capacity while normal work continues.

Single-flight merges concurrent requests for the same result within its coordination scope. Bound retained waiters and define failure and cancellation behavior. Jitter spreads refreshes across keys. Serving stale data while refreshing requires an explicit age limit and business permission. A multi-level cache adds invalidation and cold-rebuild behavior at each level.

## Account for the tail

For n independent, identically distributed parallel calls that all must finish, with latency CDF F, the maximum's CDF is `F(t)^n`. If each call meets a threshold with probability 0.99, 100 calls all meet it with probability `0.99^100 ≈ 0.366`. Shared dependencies and correlated delays violate independence. A different completion rule changes the calculation.

A delayed hedge starts a second eligible request after a chosen wait and uses the first acceptable result. With a stationary continuous distribution, no early errors, and a p95 threshold, about 5% of operations launch one extra request. That is request count rather than a direct CPU or connection-cost estimate. Both copies consume resources while in flight; cancellation can lag. Shared slow causes can limit benefit. Use duplicate-safe operations and a load budget.

Measure capacity gains at the required latency and failure conditions. Coordination overhead can make added concurrency yield diminishing or negative returns, as modeled by the Universal Scalability Law. Fit a model to relevant observations before extrapolating. State the load or resource change that would trigger another decision. Overload handling is in [Resilience](./resilience.md).
