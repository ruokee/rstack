# Isolate before sharing

Sharing a destination couples writers even when their logical data is independent. Before selecting synchronization, determine which facts actually need joint ownership or a joint invariant.

Suppose parallel document converters create preview images. A shared temporary filename makes otherwise independent conversions overwrite each other. Give each conversion its own output location and combine their results when building the catalogue. Separate outputs remove that write conflict. A catalogue requiring one consistent version still needs a publication mechanism for that requirement.

Partition by ownership only where the facts are independent. Two updates to different fields can still compete if each rewrites the entire containing object. Examine the actual read-modify-write operation and every participant that can perform it.

Shared inventory is different: two reservations must respect the same remaining quantity. Protect the complete decision and update with a transaction, lock, compare-and-swap, single writer, or other mechanism that enforces that invariant. Its scope, competing writers, and failure behavior determine the guarantee.

An ownership note tells participants what to do. Mutual exclusion requires an enforcing mechanism covering the relevant reads and writes. Use [Idempotency](./idempotency.md) separately to reason about repeated calls and recovery.
