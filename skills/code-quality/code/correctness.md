# Correctness

Correctness means satisfying the confirmed contract under legal inputs and execution conditions. A finding connects a specific implementation or design decision to a reproducible value, state transition, failure, or permitted interleaving.

## Values

Check units, precision, ranges, empty values, identity, ordering, and representation conversions. Establish which party owns each precondition. A caller that already establishes a required invariant can be relevant counterevidence. Runtime validation follows the project's actual input contract.

A type annotation, immutable field, or naming convention supplies its language's specific guarantee. Check construction, mutation, aliasing, and access paths before claiming an invariant is preserved. When a demonstrated unit or representation mismatch crosses a boundary, normalize it at the responsible conversion point and preserve the contract's precision and rounding. For deeper representation design, see `code-design/approaches/data-modeling.md`.

## Errors

Check that success, business rejection, and infrastructure failure retain distinctions needed by consumers. Error mapping can lose retry eligibility, accountability, or information about whether an effect happened. A timeout after dispatch may leave the effect unknown.

This complete stable Rust 2021 example preserves two declared error categories. `Transport` must remain distinguishable from a business refusal:

```rust
#[derive(Debug, PartialEq)]
enum SdkError {
    Declined,
    Transport,
}

#[derive(Debug, PartialEq)]
enum PaymentError {
    Rejected,
    Unavailable,
}

fn map_error(error: SdkError) -> PaymentError {
    match error {
        SdkError::Declined => PaymentError::Rejected,
        SdkError::Transport => PaymentError::Unavailable,
    }
}

fn main() {
    assert_eq!(map_error(SdkError::Declined), PaymentError::Rejected);
    assert_eq!(map_error(SdkError::Transport), PaymentError::Unavailable);
}
```

Mapping both variants to `Rejected` would lose the caller's required distinction. Restore distinct mappings and preserve required cause information. Whether to retry is a separate project policy. For deeper boundary design, see `code-design/interfaces.md`.

## State

Trace the relevant creation, mutation, and observation paths. Check stale snapshots, shared mutable aliases, competing writers, and invalid transitions. A check followed later by a write can allow another actor to invalidate the checked condition.

For a multi-effect operation, identify what has completed at each failure point and what the caller learns. A database transaction covers its actual transactional resources. Remote calls and messages need their own confirmed completion semantics. Business rules come from the project; missing rules leave specific judgments open.

When an interleaving invalidates a checked condition, keep the check and update within the same supported atomic operation, lock, or transaction. Choose the mechanism that covers the actual writers and resources. A wider lock or transaction can increase contention. For partial completion, preserve the confirmed reporting and recovery contract and account for the actual effects.

## Resources

Identify who acquires, owns, borrows, transfers, and releases each resource, and when responsibility changes. An iterator's ownership contract includes what happens on exhaustion, explicit close, early exit, errors, and cancellation.

Check acquisition, partial initialization, transfer, borrowing, and release. Include errors, cancellation, cleanup failure, and tasks that outlive the scope owning their resources.

Distinguish stopping consumption, closing resources, and cancelling in-flight work. A caller can retain a suspended iterator. Establish the owner and completion action behind each guarantee.

For a demonstrated leak or premature release, place cleanup in the owning scope's guaranteed exit mechanism, release partially acquired resources, and join work before releasing resources it still uses. An iterator-based repair needs an explicit close or scoped-use contract that its callers actually follow. Eager collection changes memory use and release timing. For deeper lifetime design, see `code-design/approaches/resource-lifecycle.md`.

## Concurrency

A race finding gives a legal interleaving and its consequence. Relate atomicity, locking, transaction isolation, cancellation, and task ownership to the actual runtime. Check that limits cover active operations, queued work, retained results, and buffers separately. A semaphore around I/O can coexist with an unbounded number of waiting tasks.

When reviewing a design, compare its promises with its proposed representation. A promise of bounded streaming conflicts with collecting all results before return when input size is unbounded. Repair the violated bound with incremental production, backpressure, or a bounded worker queue as appropriate to the source and consumer. Preserve required ordering and cancellation behavior; limiting retained results can change latency and scheduling. For deeper scheduling design, see `code-design/approaches/async-concurrency.md`.

## Cost

Allocations, copying, repeated I/O, cache growth, and queue retention become findings against stated resource or performance requirements. State input size and the mechanism causing growth. Runtime timing or throughput claims need their measurement conditions. Distinguish a code-derived capacity argument from a measured runtime result.

Remove demonstrated redundant copies or repeated effects at their owner, or bound retention to the confirmed requirement. Compare the resulting memory, recomputation, and I/O costs under the relevant workload before choosing a repair that trades one resource for another.
