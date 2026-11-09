# Python lint settings

Formatting, standard lint, and custom-rule operations for Python projects.

## Tool choice

Read the project's tools, configuration, and version conventions first. Ruff can run formatting and standard lint rules separately. For an existing formatter such as Black, assess configuration and migration cost, assigning each set of files to one formatter. On initial adoption, add the selected version to project development dependencies or the tool lockfile.

Run the following Ruff example in a disposable directory. Check options against the Ruff version selected in the development environment. Save this as `ruff.toml`:

```toml
line-length = 88

[format]
quote-style = "double"
exclude = ["generated/*.py"]

[lint]
select = ["F401"]

[lint.per-file-ignores]
"generated/*.py" = ["F401"]
```

This example enables only `F401`. Its convention assigns generated imports and formatting to the generator, so `generated/*.py` ignores that rule and is excluded from formatting discovery. Configure these exceptions separately.

## Standard lint

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

Run the checks:

```bash
ruff check --config ruff.toml bad.py good.py
ruff check --config ruff.toml good.py
```

The first command reports `F401` only for `bad.py` and exits nonzero. The second exits `0`. Put the same content as `bad.py` in `generated/api.py`; checking that file alone should pass under the exception.

Inspect rules, exceptions, and directory discovery:

```bash
ruff check --config ruff.toml generated/api.py
ruff check --show-settings --config ruff.toml good.py
ruff check --show-files --config ruff.toml .
```

Discovery lists files; per-file exceptions determine their diagnostics. Check what each result establishes.

## Formatting

Save this as `unformatted.py`:

```python
def message( name ):return {'greeting':name}
```

Check, write, and recheck in order:

```bash
ruff check --config ruff.toml unformatted.py
ruff format --check --diff --config ruff.toml unformatted.py
ruff format --config ruff.toml unformatted.py
ruff format --check --config ruff.toml unformatted.py
ruff format --config ruff.toml unformatted.py
```

Lint passes first. The initial format check shows a diff and exits `1`; after writing, the check exits `0` and another format run should leave content unchanged. A `--check` exit of `2` indicates a configuration, argument, or internal error. Record formatter and lint results separately.

When using lint fixes, run `ruff check --fix`, then `ruff format`, and recheck lint and formatting separately. Check formatter-incompatible rules such as `W191`, `Q000`, and `COM812`. The formatter makes a best effort at line length; `E501` can still report long lines. Editors, commit hooks, and CI reuse the same versions, configuration, and entry points. Verify format exclusions against actual file discovery.

## Flake8 custom rules

Check existing rules first. Ruff currently does not load third-party plugins. Run local custom checks through Flake8. Install Flake8 and plugin dependencies in its development environment, sharing versions, configuration, and commands between local runs and CI. Use package entry points when the plugin needs distribution.

This independent example checks a project convention through the AST: synchronous or asynchronous `job_` functions declared directly in the module must explicitly declare a required keyword-only `context` parameter. Class methods and nested functions are outside its scope. Tokens suit lexical relationships, and line checks suit independent line conventions; this rule depends on function syntax structure.

Save `checks.py` in a separate disposable directory:

```python
import ast


class JobContextChecker:
    name = "project-job-context"
    version = "1.0.0"

    def __init__(self, tree):
        self.tree = tree

    def run(self):
        for node in self.tree.body:
            if not isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                continue
            if not node.name.startswith("job_"):
                continue
            required_context = any(
                argument.arg == "context" and default is None
                for argument, default in zip(
                    node.args.kwonlyargs, node.args.kw_defaults
                )
            )
            if not required_context:
                yield (
                    node.lineno,
                    node.col_offset,
                    "PRJ001 job_ function must declare required keyword-only context",
                    type(self),
                )
```

In `kw_defaults`, `None` marks a required parameter. A source-level default of `None` is an AST node and still makes the parameter optional. The diagnostic returns the function definition's location; Flake8 displays columns starting at `1`.

Save `.flake8` in the same directory:

```ini
[flake8]
select = PRJ001

[flake8:local-plugins]
extension =
    PRJ = checks:JobContextChecker
paths = .
```

`paths` resolves relative to the configuration file. Ruff handles standard rules; select only the local `PRJ001` here to avoid duplicate diagnostics.

Save violations as `bad.py`:

```python
def job_build(context):
    return context


def job_optional(*, context=None):
    return context
```

Save legal cases as `good.py`:

```python
def job_build(*, context):
    return context


async def job_async(*, context):
    return context
```

Save excluded constructs as `edge.py`:

```python
class Handler:
    def job_local(self):
        return "method"


def helper():
    def job_nested():
        return "nested"

    return job_nested()
```

Run from that directory:

```bash
python -m flake8 --config .flake8 bad.py
python -m flake8 --config .flake8 good.py edge.py
```

The first command reports `PRJ001` at `bad.py:1:1` and `bad.py:5:1`, with the message `job_ function must declare required keyword-only context`, and exits nonzero. The second exits `0`, covering legal synchronous and asynchronous declarations and false-positive boundaries for class methods and nested functions.

Clean up this example's temporary directories and tool artifacts after verification, including on failure. Preserve project configuration and authorized permanent tests.
