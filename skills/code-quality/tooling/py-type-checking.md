# Python type checking

Static type guarantees, representation invariants, and type-checking settings for Python projects.

## Static guarantees

`NewType` distinguishes uses statically for a checker; `TypedDict` describes a static mapping shape. Neither validates arbitrary runtime input. A frozen dataclass restricts normal field assignment. Check whether construction and nested-object mutation preserve value constraints. Choose runtime validation according to the project's input contract.

`typing.cast` tells the checker what to assume and returns the original object at runtime. It does not validate external values. Trace `Any`, dynamic attributes, and ignore comments into consumers, distinguishing checker guarantees from value constraints the author must still establish.

## Tool choice

Keep the project's existing mypy, pyright, basedpyright, ty, or other checker, with its supported version and configuration. For initial selection, compare required static checks, dependency type coverage, and toolchain compatibility, then establish commands, scope, and strictness.

## mypy example

This example uses mypy to check nullable-value misuse in Python 3.11+. Its local contract permits a missing label to raise `ValueError`; a present label is uppercased. Save the violation as `bad.py` in a disposable directory:

```python
def label(value: str | None) -> str:
    return value.upper()
```

Save the legal implementation as `good.py`:

```python
def label(value: str | None) -> str:
    if value is None:
        raise ValueError("missing value")
    return value.upper()
```

Run mypy from the development environment:

```bash
mypy --strict bad.py
mypy --strict good.py
```

The first command reports unsafe access on the `None` variant and exits nonzero; the second exits `0`. The branch in `good.py` performs runtime handling, and the checker verifies supported static relationships. The checker adds no runtime validation.

Clean up the example's temporary directory and tool artifacts after verification. Check missing dependency types and local exceptions at the application's real boundary, tracing `Any` into consumers. State which properties still depend on runtime checks or behavioral verification.
