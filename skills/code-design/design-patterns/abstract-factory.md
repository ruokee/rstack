# Abstract factory

An abstract factory makes a related family of products the unit of selection. In the GoF structure, a factory contract creates each product kind, and each concrete factory supplies one compatible family. The useful constraint is that the products must work together.

## Identify the family invariant

Name what must match: a codec's encoding rules, a database connection's dialect, or session-scoped objects that share one transaction. Mere similarity or use in the same application is insufficient.

Specify whether products share mutable state, configuration, or a resource lifetime. A factory should acquire and release any partially created resources according to its contract. Products reaching unrelated global configuration can break the intended family relationship.

## Assemble paired capabilities

This Python 3.11 example returns paired text operations. Inputs are Unicode strings encodable by the selected codec and byte sequences valid for its decoder. Codec errors propagate. The two factories select UTF-8 and UTF-16 little-endian without a byte-order mark.

```python
from collections.abc import Callable
from dataclasses import dataclass


@dataclass(frozen=True)
class TextCodec:
    encode: Callable[[str], bytes]
    decode: Callable[[bytes], str]


def utf8_codec() -> TextCodec:
    return TextCodec(
        encode=lambda text: text.encode("utf-8"),
        decode=lambda data: data.decode("utf-8"),
    )


def utf16_codec() -> TextCodec:
    return TextCodec(
        encode=lambda text: text.encode("utf-16-le"),
        decode=lambda data: data.decode("utf-16-le"),
    )


for factory in (utf8_codec, utf16_codec):
    codec = factory()
    assert codec.decode(codec.encode("hello 世界")) == "hello 世界"
```

The factories assemble matching operations. Public construction of `TextCodec` still permits a mismatched pair, and the callable types cannot distinguish encodings. Freezing the record restricts ordinary field assignment. Stronger family guarantees require controlled construction or types that carry the family relationship.

In Rust, associated types or family parameters can express relationships between products. Consumers must retain those relationships; erasing both products behind unrelated trait objects can lose them.

## Keep the family bounded

A bundle of functions or values can be sufficient. Use a reusable factory object when it must create products repeatedly or own shared construction state. A single family may need coordinated assembly without needing an abstract hierarchy. Keep unrelated dependencies out of the family contract.

See [Factory](./factory.md) for individual creation, [Builder](./builder.md) for assembly steps, and [Facade](./facade.md) for a combined operation over the products.
