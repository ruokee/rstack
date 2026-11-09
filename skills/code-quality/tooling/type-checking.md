# Type checking

Type checking evaluates the static contracts supported by a language and checker. Choose scope and strictness for the errors the project needs to detect. Runtime input validity, business invariants, and concurrency coordination have their own mechanisms.

## Applicability

Use this topic when the project's actual checking workflow, scope, strictness, or type escapes need examination. Establish whether static checking runs during compilation, through a separate command, or at another step. When compilation already covers the required static relationships, routine quality analysis can skip duplicate checking; inspect configuration and coverage as needed. A transpilation-only pipeline can omit type checking, so verify whether the build or CI runs it separately. Keep the project's existing checker, supported version, and configuration.

## Effective checks

Identify the checker, language and dependency versions, target platform, module resolution, checked files, and external declarations. Resolve strictness presets and defaults from the selected version's help or documentation. Existing project strictness is a constraint; proposed changes need their effect explained.

Distinguish argument and return checking, nullability, closed variants, generics, dynamic values, and untyped dependencies. File discovery and dependency analysis can cover different files. An import can reach a file excluded from discovery. A successful check describes the code and relationships actually analyzed. Unanalyzed files and unchecked function bodies limit that result.

## Dynamic boundaries

Trace dynamically typed values, dynamic members, type assertions, conversions, and ignore comments into consumers. Distinguish assertions that supply only static assumptions, operations that check types at runtime, and conversions that change an actual value or representation. Determine which checks each operation preserves, bypasses, or adds, how failure behaves, and what obligations remain with consumers. Guarantees depend on the specific language and operation.

For an untyped dependency, first check whether matching upstream types or stubs exist for the installed version. A local declaration needs evidence from the real API and the application's actual use. Inventing a convenient signature can make the checker accept a false contract. A narrowly scoped missing-import exception exposes its dynamic consequence; global suppression can spread it to unrelated code.

Controlled construction and private state may enforce invariants through their actual access paths. Static shape describes permitted types and members. Check which constructors and mutations establish each value constraint and which consumers rely on it. For a demonstrated dynamic escape, restore an accurate type at the responsible boundary or narrow the exception. An assertion supplying only static assumptions or a fabricated stub leaves the underlying obligation with the author.

## Adoption

A per-module rollout or baseline states which code is checked, which constraints apply, and why exceptions remain. Compare diagnostics with the targeted mistakes before tightening everything. Record a suppression's rule, scope, reason, and loss of checking.

## Verification

Keep versions, entry files, import options, and declarations fixed when comparing strictness. Use a file that should be included and introduce one targeted static error, paired with a legal case. Observe actual diagnostics, location, severity, and exit status. Check file discovery and effective configuration separately when zero errors could mean that the code was skipped.

Use temporary cases where the actual configuration and file-matching rules apply, or a temporary copy preserving those relationships. Clean up the violating case, matching legal case, temporary configuration, and tool artifacts created for verification, including on failure. Preserve the project's formal configuration and authorized permanent tests.

## Language guidance

For Python projects, see [Python type checking](./py-type-checking.md).
