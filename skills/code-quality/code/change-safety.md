# Change safety

Structural changes and migrations need to preserve the behavior required by the project's contract: values, errors, events, persisted results, order, resource ownership, and stated cost bounds. Refactoring preserves externally observable behavior. An intentional behavior correction has its own changed contract.

## Behavior evidence

Match evidence to the risk. Compilation and type checking cover supported static relationships. Tests cover their inputs and assertions. Repeatable runs can compare outputs, effects, and failure behavior. A green fixed suite is useful in proportion to the contracts it protects.

Characterization observations document current behavior. Known errors remain behavior-change questions. Missing evidence identifies the exact transformation or guarantee at risk; the current workflow decides whether to gather it, change scope, or defer the transformation.

Small transformations help locate a regression and make reasoning local. Check cadence, test creation, commits, rollback, and deployment follow the current task. This reference supplies risks for judging the candidate.

## Extraction

For Extract Function, check inputs, returned values, variable writes, aliasing, control flow, and error propagation. A `return`, `break`, or `continue` may have a different target after extraction. Closures can observe later values; moved resource scopes can change release time.

An extraction should name a coherent responsibility. Passing many writable locals or returning a bundle solely to reconstruct old control flow is evidence that the chosen boundary needs review. Narrow the extraction to a coherent operation, make required state inputs and results explicit, and keep control transfers in the scope they must exit. Preserve evaluation and cleanup timing when moving the boundary.

## Inlining

For Inline Function, compare argument evaluation count, order, and timing. Replacing a parameter with an effectful expression at each use can repeat I/O or mutation. Also check short-circuiting, captured state, recursion, overload resolution, dynamic dispatch, and local name collisions.

This complete Python 3.11+ example preserves one call to `read_value`. Its contract is a doubled value with exactly one source read:

```python
def run():
    reads = []

    def read_value():
        reads.append(1)
        return len(reads)

    def double(value):
        return value + value

    original = double(read_value())
    assert (original, len(reads)) == (2, 1)
    reads.clear()
    value = read_value()
    inlined = value + value
    assert (inlined, len(reads)) == (2, 1)


run()
```

Substituting `read_value() + read_value()` produces `3` and two reads. The temporary preserves evaluation rather than adding an arbitrary abstraction.

## Moving behavior

For Move Function, compare rule ownership, required state, visibility, dependency direction, and caller burden. Moving code can change imports, initialization order, cycles, registration, reflection, dynamic lookup, and serialized names. A changed source-level reference is one part of the consumer contract.

Independently published consumers or release obligations can require a compatibility forwarder and an explicit removal condition. A project-wide clean cutover requires all affected callers and old paths to satisfy the chosen migration contract. A review checks ordinary callers, dynamic references, and documentation, then reports omissions with locations, effects, and repair directions. Modification follows separate task authorization.

When a migration omits a caller or registration, migrate that reference under the chosen cutover contract and check affected import and initialization behavior. Ownership, cleanup, cancellation, and capacity obligations are described locally in [Correctness](./correctness.md). Keep those obligations intact when moving scopes or work. A complete migration design can use `code-design/existing-code.md`.
