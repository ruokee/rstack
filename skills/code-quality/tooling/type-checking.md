# Type checking

Type checking evaluates the static contracts supported by a language and checker. Choose scope and strictness for the errors the project needs to detect. Runtime input validity, business invariants, and concurrency coordination have their own mechanisms.

## Applicability

Use this topic when the project's actual checking workflow, scope, strictness, or type escapes need examination. Rust projects normally check static types during compilation, so routine quality analysis can skip this topic; inspect it when checking configuration or coverage. For TypeScript, confirm that the build or CI actually runs type checking. Transpilation alone can omit it, so a transpilation-only pipeline may need a separate type-checking command such as `tsc`. For Python, use the project's existing mypy, pyright, basedpyright, ty, or other checker and its supported version and configuration.

## Effective checks

Identify the checker, language and dependency versions, target platform, module resolution, checked files, and external declarations. Resolve strictness presets and defaults from the selected version's help or documentation. Existing project strictness is a constraint; proposed changes need their effect explained.

Distinguish argument and return checking, nullability, closed variants, generics, dynamic values, and untyped dependencies. File discovery and dependency analysis can cover different files. An import can reach a file excluded from discovery. A successful check describes the code and relationships actually analyzed. Unanalyzed files and unchecked function bodies limit that result.

## Dynamic boundaries

Trace `Any`, dynamic attributes, casts, assertions, and ignore comments into consumers. They can remove checks or transfer an obligation to the author. A cast tells the checker what to assume. It does not validate an external value at runtime.

For an untyped dependency, first check whether matching upstream types or stubs exist for the installed version. A local declaration needs evidence from the real API and the application's actual use. Inventing a convenient signature can make the checker accept a false contract. A narrowly scoped missing-import exception exposes its dynamic consequence; global suppression can spread it to unrelated code.

Controlled construction and private state may enforce invariants through their actual access paths. Static shape describes permitted types and members. Check which constructors and mutations establish each value constraint and which consumers rely on it. For a demonstrated dynamic escape, restore an accurate type at the responsible boundary or narrow the exception. A cast or fabricated stub leaves the underlying obligation with the author.

## Adoption

A per-module rollout or baseline states which code is checked, which constraints apply, and why exceptions remain. Compare diagnostics with the targeted mistakes before tightening everything. Record a suppression's rule, scope, reason, and loss of checking.

## Verification

Keep versions, entry files, import options, and declarations fixed when comparing strictness. Use a file that should be included and introduce one targeted static error, paired with a legal case. Observe actual diagnostics, location, severity, and exit status. Check file discovery and effective configuration separately when zero errors could mean that the code was skipped.

Use temporary cases where the actual configuration and file-matching rules apply, or a temporary copy preserving those relationships. Clean up the violating case, matching legal case, temporary configuration, and tool artifacts created for verification, including on failure. Preserve the project's formal configuration and authorized permanent tests.

For a project already using mypy, this example targets nullable-value misuse in Python 3.11+. Its local contract permits a missing label to raise `ValueError`; a present label is uppercased. Save this as `bad.py` in a disposable example directory:

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

Using the project's mypy executable, `mypy --strict bad.py` should report unsafe access on the `None` variant and exit nonzero. `mypy --strict good.py` should succeed. The branch in `good.py` performs the runtime handling. The checker verifies supported static relationships; it adds no runtime validation.

Remove this example's temporary directory after verification. For real project checking, keep its supported checker, version, and configuration. Verify missing dependency types and local exceptions on the application's real boundary, including how `Any` reaches its consumers. State which properties still depend on runtime checks or behavioral verification.
