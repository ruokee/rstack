# Keep it simple

KISS favors the least complicated design that satisfies the actual contract. Count the concepts and obligations needed to use, understand, and change it. Short source code can still conceal expensive work or difficult control flow.

## Locate the complexity

Some complexity belongs to the problem: legal states, conflicting updates, partial failure, or an actual protocol. The design must represent it somewhere. Added complexity comes from unnecessary state, duplicated interpretation, speculative options, or indirection without a current responsibility.

Compare the full operation. A short call that makes every consumer configure a lifecycle can cost more than an explicit owner. A longer sequential function can be easier to follow than many helpers with hidden shared state. A single implementation can justify an interface that owns a real conversion or compatibility boundary.

## Prefer direct mechanisms

Use a lookup for a fixed mapping, a branch for a small closed choice, and a function for a stateless calculation. Give persistent state and resources a visible owner. Use language and library mechanisms that express the required guarantee directly.

For example, mapping three external field names to internal names usually needs a table or direct construction. A plugin registry adds discovery, registration order, and missing-provider behavior. Those obligations need an actual extension requirement.

## Compare total cost

Check caller knowledge, mutable state, control flow, dependency count, and change propagation. Include allocation, copying, repeated I/O, and task retention where relevant. Avoid trading a clear local operation for a general framework that each caller must configure.

Correctness and required performance remain part of simplicity's target. Cleanup, failure reporting, and synchronization earn their cost when the operation needs them. Keep a necessary optimization near the behavior it changes, with the condition that makes it worthwhile.

Read [Deep modules](./deep-modules.md) to contain necessary complexity, [YAGNI](./yagni.md) for speculative capability, and [DRY](./dry.md) when reducing repetition would add coupling.
