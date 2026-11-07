# Resource lifecycle

A resource has a period of valid use and an obligation to release or finish it. Files, locks, connections, leases, subprocesses, and tasks each have different completion rules. Define the owner, usable lifetime, release order, and observable failure behavior.

## State ownership

- An owner controls final release. Returning an owned value can transfer that responsibility to the caller.
- A borrower uses a resource within an agreed lifetime. The owner remains responsible for release.
- A lease gives temporary access to a pool-owned resource. Releasing the lease returns or discards the resource according to the pool contract.
- Shared ownership needs a release protocol. Reference counting tracks owners. It does not synchronize access or break ownership cycles.

Ownership and usability are distinct. A failed write leaves a borrowed stream with its owner. Whether another operation can succeed depends on the underlying failure. Returning a connection after an error may require rollback, reset, or discard before reuse.

## Separate writing from completion

This Rust 2021 example borrows any `Write` implementation to write each string verbatim followed by a newline. The caller controls flushing and final release. `save_lines` owns a buffered file, creates or truncates its destination, and explicitly flushes before returning success. Run the program with an output path.

```rust
use std::fs::File;
use std::io::{self, BufWriter, Write};
use std::path::Path;

fn write_lines<W: Write + ?Sized>(out: &mut W, lines: &[&str]) -> io::Result<()> {
    for line in lines {
        writeln!(out, "{line}")?;
    }
    Ok(())
}

fn save_lines(path: &Path, lines: &[&str]) -> io::Result<()> {
    let file = File::create(path)?;
    let mut out = BufWriter::new(file);
    write_lines(&mut out, lines)?;
    out.flush()
}

fn main() -> io::Result<()> {
    let mut bytes = Vec::new();
    write_lines(&mut bytes, &["hello", "世界"])?;
    bytes.write_all(b"done\n")?;
    assert_eq!(bytes, "hello\n世界\ndone\n".as_bytes());

    let path = std::env::args_os().nth(1).expect("pass an output path");
    save_lines(Path::new(&path), &["hello", "世界"])
}
```

Errors propagate through `io::Result`, and earlier writes may remain. A failed save can leave a truncated or partial file. `BufWriter` may attempt another write during drop and ignores errors from that attempt. Explicit `flush` exposes flush failure on the success path.

Flushing drains the buffer to the underlying file. Durable storage and atomic replacement require their own operations and filesystem assumptions. Dropping a Rust `File` ignores close errors. A successful destructor is therefore a different contract from an explicitly checked completion operation.

## Use scoped cleanup

Rust RAII ties cleanup to dropping the owner. Locals normally drop on scope exit, including unwinding. Process abort, termination, deliberately leaked values, and reference cycles have different behavior. A `Drop` implementation performs synchronous cleanup and has no result return channel.

Python `with` calls the manager's exit method after successful entry, including when the body raises. The manager defines what exit actually does. A database transaction context can commit or roll back while leaving its connection open. Use explicit context scopes for required cleanup. Avoid relying on garbage collection or `__del__` timing.

In both languages, releasing a handle, flushing output, committing a transaction, acknowledging a message, and waiting for a task are separate operations. Choose which outcomes the caller needs to observe.

## Handle partial acquisition

Acquire dependencies before their dependents, then release dependents first. Rust local bindings and Python nested managers can express this order. Python `ExitStack` and `AsyncExitStack` support a dynamic collection of cleanup actions.

Register cleanup as each acquisition succeeds. A Python manager whose entry fails must clean up its own partial acquisition; its exit method is called only after successful entry. A Rust constructor that returns an error should leave acquired resources in owned values whose drop behavior handles cleanup.

Cleanup can fail while another failure is active. Define whether to propagate, chain, aggregate, or separately report those failures according to the API. A context manager that suppresses an exception changes the operation's control flow and needs an explicit suppression contract.

## Own longer lifetimes

Application-owned pools and clients belong to startup and shutdown scopes. An import is usually the wrong lifetime for an active connection. A pool should stop new leases and resolve existing borrowers before releasing shared resources.

Async cleanup may require an explicit awaited close or scope. Rust's ordinary `Drop` cannot await it. Python `async with` and `try/finally` provide cleanup locations, and cancellation can interrupt awaits inside cleanup. Resource-holding async generators need scoped finalization when iteration ends early, such as `contextlib.aclosing()` in Python.

Join or await owned work through shutdown and define what a missed deadline means for remaining resources. See [Async concurrency](./async-concurrency.md) for cancellation and [Unit of Work](../design-patterns/unit-of-work.md) for transaction completion.
