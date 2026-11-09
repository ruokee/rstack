# Test reliability

A reliability finding identifies a dependency on state, order, time, environment, or scheduling that can change the result under the test's declared execution conditions. Describe the interfering sequence and the guarantee lost.

## State ownership

Each test needs ownership of its mutable state and resources: files, database rows, ports, environment, globals, and background tasks. A fixed shared directory can let one parallel test overwrite or delete another's output. Reusing a database fixture can make a later test depend on earlier execution.

Prefer per-test resources and cleanup that runs after assertion failure. Restoration of patched environment and global state must also occur on failure. Check worker shutdown before releasing a directory or connection it still uses. Integration scenarios may intentionally share a system; their isolation and cleanup contract must account for that sharing.

## Completion conditions

A fixed sleep assumes work finishes within an unrelated duration. Slow machines and alternate schedules can violate that assumption. Wait for a result, task completion, event, or explicitly defined state. A deadline bounds waiting. It does not establish that the operation completed.

Distinguish a cancellation request, the end of a wait, and the actual end of work. Before releasing a resource, require completion evidence covering all users. Check who still owns the resource and who joins or coordinates remaining work on exceptional and cancelled exits. A runtime may cancel only the waiter while in-flight work continues. Check the guarantees of the project's actual runtime.

## Determinism

Control clock, timezone, random input, and environment where they determine the assertion. A fixed random seed controls that generator's input sequence. Thread scheduling and task interleaving need their own control or an assertion valid across allowed interleavings.

Concurrency tests can use explicit synchronization to force a relevant race. Randomized and external-system tests retain their stated execution conditions. Their scope explains reproducibility and failure meaning. Being an integration test alone does not make interference harmless.

## Dependency fidelity

Use real dependencies when their semantics are required. A fake or mock should preserve the errors, ordering, transactions, cancellation, or concurrency that the tested behavior depends on. Echoing a configured return value checks setup rather than integration. Verify the application's real use of a dependency at the relevant boundary.

For erratic failures, identify the state or interleaving, its observed impact, and a matching repair. A rerun that passes is another observation. It does not replace the explanation of the failure.

## Language guidance

For Python projects, see [Python test reliability](./py-reliability.md).
