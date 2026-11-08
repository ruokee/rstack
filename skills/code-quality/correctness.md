# Correctness

Correctness means satisfying the confirmed contract under legal inputs and execution conditions. A finding connects a specific implementation or design decision to a reproducible value, state transition, failure, or permitted interleaving.

## Values

Check units, precision, ranges, empty values, identity, ordering, and representation conversions. Establish which party owns each precondition. A caller that already establishes a required invariant can be relevant counterevidence. Runtime validation follows the project's actual input contract.

A type annotation, immutable field, or naming convention supplies its language's specific guarantee. Check construction, mutation, aliasing, and access paths before claiming an invariant is preserved. Representation design belongs to [Data modeling](../code-design/approaches/data-modeling.md) or [State machines](../code-design/approaches/state-machine.md).

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

Mapping both variants to `Rejected` would lose the caller's required distinction. Whether to retry is a separate project policy. For the full boundary contract, read [Interfaces](../code-design/interfaces.md) or [Adapter](../code-design/design-patterns/adapter.md).

## State

Trace the relevant creation, mutation, and observation paths. Check stale snapshots, shared mutable aliases, competing writers, and invalid transitions. A check followed later by a write can allow another actor to invalidate the checked condition.

For a multi-effect operation, identify what has completed at each failure point and what the caller learns. A database transaction covers its actual transactional resources. Remote calls and messages need their own confirmed completion semantics. Business rules come from the project; missing rules leave specific judgments open.

## Resources

Before proposing an iterator-based interface or repair, or judging resource ownership, cleanup, cancellation, or early iteration exit, read [Resource lifecycle](../code-design/approaches/resource-lifecycle.md).

Check acquisition, partial initialization, transfer, borrowing, and release. Include errors, cancellation, cleanup failure, and tasks that outlive the scope owning their resources.

Distinguish stopping consumption, closing resources, and cancelling in-flight work. A caller can retain a suspended iterator. Establish the owner and completion action behind each guarantee.

## Concurrency

A race finding gives a legal interleaving and its consequence. Relate atomicity, locking, transaction isolation, cancellation, and task ownership to the actual runtime. Check that limits cover active operations, queued work, retained results, and buffers separately. A semaphore around I/O can coexist with an unbounded number of waiting tasks.

For scheduling and capacity contracts, read [Async concurrency](../code-design/approaches/async-concurrency.md). When reviewing a design, compare its promises with its proposed representation. A promise of bounded streaming conflicts with collecting all results before return when input size is unbounded. Report that conflict and the contract or representation that needs to change.

## Cost

Allocations, copying, repeated I/O, cache growth, and queue retention become findings against stated resource or performance requirements. State input size and the mechanism causing growth. Runtime timing or throughput claims need their measurement conditions. Distinguish a code-derived capacity argument from a measured runtime result.
