# Boundary discipline

Every check should have an owner and a property it establishes. A boundary is the point where an operation accepts a representation governed by another contract, such as configuration text, a request, or a stored record.

For a configuration timeout, parsing can establish its unit and nonnegative range. The calculation that consumes it can then rely on those properties while they remain valid. The same configuration may name a file. That file's availability can change after parsing, so opening it still requires handling the actual I/O result.

Separate conversion from decisions over the accepted model. Keep calculations independent of framework access where their meaning allows it. Coordination owns the surrounding I/O and propagates real failures. Return input errors at the point with enough context to explain what was rejected.

Repeated checking of an unchanged, established property adds maintenance without strengthening the contract. Recheck or synchronize when the property can change: a shared balance, mutable alias, historical record, or alternate construction path may need a different guarantee. Apply the same reasoning to internally produced data.

Expose the model consumers need. Keep transport and framework details with their adapters unless the public contract deliberately includes them. See [Type-system discipline](./type-system-discipline.md) for construction guarantees and [Isolate before sharing](./isolate-before-sharing.md) for mutable-state ownership.
