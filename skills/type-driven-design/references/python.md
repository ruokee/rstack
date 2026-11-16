# Python type models

Use this reference for Python representation and guarantee choices. Follow the project's actual dependencies and checker configuration.

## Choose by meaning

For internal fixed-shape data, prefer named records. Prefer named multi-field results so attributes explain each role. Use `dict` primarily for genuine key-value lookup and dynamic collections. Prefer `tuple[T, ...]` for immutable homogeneous sequences. These are design defaults for this Skill.

Python also supports fixed-length heterogeneous tuples, such as `tuple[str, int]`. Preserve real positional protocols. Dictionary interoperability, schema-owned shapes, and tuple-compatible APIs each have their own requirements.

### Named records

Use `dataclass` for a record with named fields, methods, and ordinary class behavior. Keyword-only fields make construction roles visible. Its generated equality normally compares fields between instances of the identical class. Annotations describe fields to tools. The generated constructor assigns field values. It does not check their annotated types. See the [dataclasses documentation](https://docs.python.org/3.12/library/dataclasses.html).

Use `NamedTuple` when named access must coexist with tuple operations. It retains iteration, positional unpacking, and element-wise equality with ordinary tuples. Adding a field affects positional consumers. See [NamedTuple](https://docs.python.org/3.12/library/typing.html#typing.NamedTuple) and the evolution tradeoffs in [PEP 557](https://peps.python.org/pep-0557/#why-not-just-use-namedtuple).

Use `TypedDict` where callers actually require a dictionary interface with specific string keys and corresponding value types. `dict[str, str | int]` permits either value type at every key; a `TypedDict` can associate each field with its own type. A required key and a nullable value express different facts. `NotRequired` describes a key that may be absent. The runtime value is an ordinary dictionary. Runtime key and value validation belongs to a parser or adapter. See the [TypedDict specification](https://typing.python.org/en/latest/spec/typeddict.html) and the motivation in [PEP 589](https://peps.python.org/pep-0589/#motivation).

### Identity

A type alias names an existing type expression and remains statically equivalent to it. Use the `type Name = ...` statement to define aliases, including generic aliases such as `type Items[T] = tuple[T, ...]`.

`NewType` gives checked callers a distinct static subtype. At runtime its call returns the supplied object. It establishes neither a value range nor the existence of a referenced entity. Two same-typed parameters still need role names. See [NewType](https://docs.python.org/3.12/library/typing.html#newtype).

```python
from typing import NewType

WarehouseId = NewType("WarehouseId", str)
ProductId = NewType("ProductId", str)


def stock_key(*, warehouse: WarehouseId, product: ProductId) -> str:
    return f"{warehouse}/{product}"


print(stock_key(warehouse=WarehouseId("north"), product=ProductId("bolt")))
```

This prints `north/bolt`. A checker should reject a `ProductId` passed as `warehouse`. A runtime call alone exercises string formatting, so use checker evidence for the role distinction.

### Alternatives

Use a union of records when payloads belong to different outcomes. Narrow with a supported branch such as `isinstance` before accessing case-specific fields. `assert_never` gives a checker a place to report an unhandled case. The actual checker and checked scope determine that coverage. The [worked example](./worked-example.md) distinguishes empty success from failure.

Choose missing-value representations by operation. A field update may distinguish omission from an explicit null. A lookup may distinguish not-found from a zero value. Give separate cases or an explicit sentinel only when the consumer needs those distinctions.

### Relationships

Use a type parameter when the output must preserve an input's type. This complete Python 3.12+ example retains the element type with an inline type parameter:

```python
from collections.abc import Sequence


def last_or_none[T](values: Sequence[T]) -> T | None:
    if not values:
        return None
    return values[-1]


print(last_or_none((2, 5)))
```

The output is `5`. The checker can infer `int | None` for this call. Use inline type parameters for generic functions and classes, such as `class Box[T]:`. Keep a concrete signature when the operation has no useful type relationship.

Use `Protocol` for a consumer's structural capability requirements. Implementations can satisfy it without inheritance. State semantic obligations such as ordering, errors, and resource ownership beside the operation. A read-only property can express read access to a protocol member. `@runtime_checkable` checks attribute presence with limited runtime semantics. It does not verify member signatures. See the [Protocol specification](https://typing.python.org/en/latest/spec/protocol.html) and [runtime checking](https://docs.python.org/3.12/library/typing.html#typing.runtime_checkable).

## Establish the properties

### Construction

A value constraint needs a mechanism on every supported construction path. The following interval represents `start <= stop` for typed integer inputs. Direct calls, its convenience factory, and `dataclasses.replace` all reach `__post_init__`:

```python
from dataclasses import dataclass, replace


@dataclass(frozen=True, kw_only=True)
class Interval:
    start: int
    stop: int

    def __post_init__(self) -> None:
        if self.stop < self.start:
            raise ValueError("stop precedes start")

    @classmethod
    def from_size(cls, *, start: int, size: int) -> "Interval":
        return cls(start=start, stop=start + size)


interval = Interval.from_size(start=3, size=2)
print(interval)
print(replace(interval, stop=6))
try:
    Interval(start=3, stop=2)
except ValueError as exc:
    print(exc)
```

Expected output:

```text
Interval(start=3, stop=5)
Interval(start=3, stop=6)
stop precedes start
```

The factory also rejects a negative size through the generated constructor. Replacing `stop` with a value below `start` fails through the same hook. The check establishes ordering for typed integer inputs. It does not validate arbitrary input types. Parse external data according to its real contract before using this constructor.

Inspect restoration separately. A custom ORM loader or pickle restoration can bypass ordinary initialization. If such paths are supported, arrange for them to establish the invariant before exposing the value. Explicit low-level mutation such as `object.__setattr__` falls outside the ordinary frozen API. A guarantee must name the supported paths.

### Mutation

`frozen=True` blocks ordinary field reassignment. A list or dictionary referenced by a frozen record can still mutate. A tuple prevents changing its element references, while mutable elements retain their own behavior. `Mapping[K, V]` grants read operations through that interface; another alias may still update the underlying dictionary. See [frozen dataclasses](https://docs.python.org/3.12/library/dataclasses.html#frozen-instances) and [collection interfaces](https://docs.python.org/3.12/library/collections.abc.html).

Choose borrowed read access, an immutable value, or a copied snapshot according to the operation's actual needs. State who may modify shared values. Add copying only where snapshot isolation is required. An existence check or concurrency-sensitive rule belongs to the operation that controls those facts.

### Structured parsing

Reuse an established parser or serialization library when the project needs one. Standard-library records remain sufficient for trusted internal values. `msgspec.Struct` is one option when the project uses structured serialization. Its [Struct documentation](https://msgspec.dev/structs#post-init-processing) and [usage guide](https://msgspec.dev/usage#typed-decoding) distinguish the paths:

- Direct construction assigns fields and runs `__post_init__`.
- Typed decoding validates serialized input against annotations and `Meta` constraints, then runs `__post_init__`.
- `msgspec.convert` validates already parsed builtin objects against the requested type and runs `__post_init__` when constructing a Struct.
- Strict decoding and conversion limit unsafe implicit conversions. They are the default. The allowed conversions depend on the destination type.

This separate example requires `msgspec` with `Struct`, `Meta`, and typed conversion support. Record the actual installed version when exercising it. The live official documentation is unversioned.

```python
from typing import Annotated

import msgspec


class PageSize(msgspec.Struct, frozen=True):
    value: Annotated[int, msgspec.Meta(ge=0)]


print(PageSize(-1).value)
print(msgspec.json.decode(b'{"value":0}', type=PageSize).value)
print(msgspec.convert({"value": 4}, type=PageSize).value)
try:
    msgspec.json.decode(b'{"value":-1}', type=PageSize)
except msgspec.ValidationError as exc:
    print(type(exc).__name__)
```

Expected output is `-1`, `0`, `4`, and `ValidationError` on separate lines. The direct constructor bypasses `Meta` validation. If every ordinary construction must establish nonnegativity, add that actual check to `__post_init__` or constrain the supported construction API. `frozen=True` governs later assignment. Field assignment on a mutable Struct also bypasses annotation and `Meta` validation.

Use `__post_init__` for actual custom invariants. During typed decoding and conversion, msgspec wraps `ValueError` and `TypeError` from that hook in `ValidationError`. Ordinary construction raises the original exception. Check decoding, conversion, direct construction, restoration, and updates according to the guarantee being claimed. Use `msgspec` guidance for library-specific options. Derive expected behavior from the model's contract.
