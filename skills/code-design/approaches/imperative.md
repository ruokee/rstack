# Imperative programming

Imperative code states the steps of a computation and how local state changes. Procedural decomposition groups those steps into named operations. It is a direct fit for ordered effects, resource acquisition, startup, command handlers, and small scripts.

## Make order explicit

For each step, identify its inputs, effect, result, and failure state. A configuration-driven job might parse input, resolve settings, acquire a client, process records, and finish its output. The owner of that sequence must decide what happens if processing fails after some records are written.

Sequential calls establish execution order in that caller. They do not make the effects atomic. A write can expose partial output, and a remote call can leave an unknown result. Put transaction and recovery decisions at the operation that owns those effects.

## Keep state local

Use local variables and explicit parameters to show what changes. Give shared mutable state a defined owner and synchronization contract. Passing one mutable context through every procedure can hide dependencies just as effectively as globals.

A pure algorithm can use loops and private temporary mutation. Imperative syntax describes how it computes; purity describes what its caller can observe. These properties can coexist.

## Extract a useful operation

Split a sequence where a phase has its own rule, input-output contract, resource lifetime, or reusable purpose. Keep the caller readable at a coherent level of detail. A helper should reduce required knowledge or isolate a decision.

Avoid extracting every short block merely to name its position in the sequence. Keep straightforward local bookkeeping inline when another call would make the operation harder to follow. Repeated flags or unrelated branches may indicate several operations combined behind one entry point.

## Separate decisions when useful

A pricing rule or eligibility decision can often use plain input values while the surrounding procedure owns I/O and persistence. This gives the rule a direct check independent of infrastructure. Read [Functional core](./functional-core.md).

A byte-copying operation may contain almost no separate policy. Its meaningful work is the effect sequence itself. Keep cleanup, failure reporting, and completion visible using [Resource lifecycle](./resource-lifecycle.md). Use [Data modeling](./data-modeling.md) when intermediate values need a clearer contract.
