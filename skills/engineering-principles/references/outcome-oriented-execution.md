# Outcome-oriented execution

A migration needs a clear completion state. Define the target behavior and the consumers that must adopt it, then judge intermediate work by whether it moves that whole result closer.

For example, replacing a local search index may require changing its data writer, query reader, and stored format together. On an isolated development branch, those parts can be temporarily inconsistent while the coordinated change is built. Give that interval a contained scope and a recovery point. For a live search service, continuous query availability may instead require building a separate index and switching readers after it is ready.

The operating contract decides which intermediate states are acceptable. Include actual compatibility obligations and a clear exit condition for transition mechanisms. Each extra path has a maintenance cost for as long as it remains.

Completion combines the target result with evidence of the behavior promised under its relevant conditions. Select final checks by that promise and its risks. Their execution belongs to the roles assigned by the current task.

Use [Migrate then clean up](./migrate-then-clean-up.md) for consumer migration and [Verify before advancing](./verify-before-advancing.md) when later work depends on an intermediate result.
