# Factory

A factory owns a construction decision: selecting a product, applying a construction policy, or assembling dependencies. Callers use the resulting contract instead of repeating that decision.

The GoF Factory Method specifically lets a creator's subclasses override product creation. A standalone factory function, named constructor, and registry-based constructor are other creation mechanisms. Choose the form that matches the actual extension contract.

## Define construction behavior

State the accepted selector, product capability, resource ownership, and construction failures. Distinguish an unknown selector from an error raised while building a known product. Resource acquisition can legitimately be part of construction; make its cleanup and partial failure contract explicit.

Use a direct constructor when it already exposes the required operation clearly. A factory with one product can still own nontrivial assembly or a conversion boundary. A configurable registry needs a real registration requirement and a defined duplicate-name policy.

## Select a constructor

This Python 3.11 example creates a fresh streaming compressor for either `zlib` or `bzip2`. The caller supplies bytes and finishes each compressor once with `flush`. The protocol describes the capability used by the caller.

```python
import bz2
import zlib
from collections.abc import Callable
from typing import Protocol


class Compressor(Protocol):
    def compress(self, data: bytes, /) -> bytes: ...
    def flush(self) -> bytes: ...


_CONSTRUCTORS: dict[str, Callable[[], Compressor]] = {
    "zlib": zlib.compressobj,
    "bzip2": bz2.BZ2Compressor,
}


def make_compressor(kind: str) -> Compressor:
    try:
        constructor = _CONSTRUCTORS[kind]
    except KeyError as exc:
        raise ValueError(f"unknown compression format: {kind}") from exc
    return constructor()


compressor = make_compressor("zlib")
encoded = compressor.compress(b"report data") + compressor.flush()
assert zlib.decompress(encoded) == b"report data"
```

Only the lookup is inside the exception translation. A constructor failure propagates with its original meaning, including a `KeyError` raised internally. The fixed table expresses the supported products without a registration lifecycle.

## Check the boundary

Verify selection, independent product state, and construction failures. Avoid silently choosing a default for an unknown selector. Returning a shared cached product instead of a fresh one changes state and ownership obligations.

Use [Abstract factory](./abstract-factory.md) for matching products, [Builder](./builder.md) for staged construction, and [Strategy](./strategy.md) for the behavior a selected product supplies.
