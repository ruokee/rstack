# Lint settings

Select lint checks for a concrete quality problem and its false-positive cost. Effective behavior comes from the project's configuration, invocation, and pinned tool version. Read those sources rather than assuming tool defaults.

## Rule choice

Distinguish formatting, mechanical mistakes, language semantics, and heuristic maintainability rules. Let an existing formatter own formatting. Compare overlap with compilers, type checkers, and other linters before adding duplicate diagnostics.

Function length and complexity thresholds are heuristics. A diagnostic warrants the contract and responsibility judgment in [Structural quality](../code/structure.md). Tool severity and a review finding's impact describe different things.

## Effective scope

Identify the command's working directory, configuration inheritance, overrides, file matching, ignore rules, and tool version. Check production, test, script, and generated-code scope separately. Explicit file arguments can behave differently from directory discovery.

Strictness can apply globally, per directory, or through an explicit baseline. State which files and rules are actually checked. A baseline is an exception boundary whose growth affects protection.

When a required file is skipped, repair the responsible invocation, match pattern, or override and verify discovery again. Narrow an exception to its confirmed reason. Compare the resulting diagnostics and maintenance cost before broadening adoption.

## Exceptions

Give an exception its rule, smallest useful scope, and actual reason. Generated source may need a specific exception because a generator owns it. A broad ignore can hide defects beyond that reason. Suppression comments, excluded files, and legacy baselines need their effect on coverage explained.

Automatic fixes have different behavior risks. Use the tool's classification and inspect the actual change. Unsafe fixes, broader rewrites, and bulk suppression follow the task's authorization.

## Verification

Use supported configuration expansion or file-discovery commands, then exercise one intended violation and its matching legal case. Record effective files, rule identifiers, diagnostics, and exit status. A failed command, an excluded file, and zero diagnostics have different meanings.

Use controlled temporary cases where the actual configuration and file-matching rules apply. Prefer a temporary copy that preserves the relevant layout and configuration relationships. When checking real file discovery, use a configuration-applicable path. After verification, clean up the violating case, matching legal case, and temporary configuration created for the check, including on failure. Preserve the project's formal configuration and authorized permanent tests.

This standalone Ruff example enables only the unused-import check. Save this as `ruff.toml`; the generated-file exception represents a project decision that generated imports are owned by the generator:

```toml
[lint]
select = ["F401"]

[lint.per-file-ignores]
"generated/*.py" = ["F401"]
```

Save the violation as `bad.py`:

```python
import math
```

Save the legal case as `good.py`:

```python
from math import ceil


def page_count(items: int) -> int:
    return ceil(items / 10)
```

Run the project's Ruff executable with `ruff check --config ruff.toml bad.py good.py`. The expected diagnostic is `F401` for `bad.py`, with a nonzero exit status. Checking `good.py` alone should exit successfully. An identical unused import in `generated/api.py` should be exempt when checked with this configuration. Inspect `ruff check --show-settings --config ruff.toml good.py` to confirm the selected rule and exception, and `ruff check --show-files --config ruff.toml .` to inspect directory discovery. Use the project's installed version when checking option syntax. For this standalone example, create the configuration and cases in a disposable directory and remove that directory after verification.
