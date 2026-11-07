# Decorator

The GoF Decorator wraps a component and provides the same interface with additional behavior. Each wrapper owns one responsibility and delegates the remaining work. Composition can be static or dynamic according to the language and representation.

## Preserve the behavioral contract

Matching method names is insufficient for substitution. Check accepted inputs, result meaning, failure behavior, partial effects, and completion. Wrappers can buffer, limit, compress, or observe operations when those behaviors fit the public contract.

Order matters. A buffer outside a limiting writer may defer a limit failure until flushing. A limiter outside a buffer restricts bytes accepted into that buffer. Compression changes which byte count a surrounding limiter measures.

## Limit a writer

This Rust 2021 decorator forwards at most its remaining byte budget to a conforming `Write` implementation. It preserves partial-write counts and forwards flushes. At an exhausted budget, `write` returns zero, so `write_all` reports `WriteZero` for remaining nonempty input.

```rust
use std::io::{self, Write};

struct Limited<W> {
    inner: W,
    remaining: usize,
}

impl<W: Write> Write for Limited<W> {
    fn write(&mut self, bytes: &[u8]) -> io::Result<usize> {
        let limit = bytes.len().min(self.remaining);
        if limit == 0 {
            return Ok(0);
        }
        let written = self.inner.write(&bytes[..limit])?;
        self.remaining -= written;
        Ok(written)
    }

    fn flush(&mut self) -> io::Result<()> {
        self.inner.flush()
    }
}

fn main() {
    let mut output = Vec::new();
    {
        let mut writer = Limited { inner: &mut output, remaining: 3 };
        let error = writer.write_all(b"hello").unwrap_err();
        assert_eq!(error.kind(), io::ErrorKind::WriteZero);
        writer.flush().unwrap();
    }
    assert_eq!(output, b"hel");
}
```

The wrapper adds no buffer or allocation. Here it borrows the destination through `&mut Vec<u8>`; the vector owns its own storage. A failed `write_all` can leave a prefix written. Flush is a separate operation with its own possible failure.

## Keep composition understandable

Expose required finalization and ownership. A resource-owning decorator can be appropriate for a stream's lifetime. A scoped context mechanism can instead surround one call. The choice depends on when added behavior starts and ends.

Python's `@` syntax applies a callable transformation. It can implement wrapping, registration, or replacement, so its syntax alone does not identify the GoF pattern. Function wrappers should preserve relevant metadata with `functools.wraps` and preserve the actual calling and failure contract.

Compare [Adapter](./adapter.md) for interface translation. A proxy has a similar wrapper structure with an access-control or indirection purpose. Keep the order and cost of each layer visible.
