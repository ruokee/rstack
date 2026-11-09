# Test reliability

A reliability finding identifies a dependency on state, order, time, environment, or scheduling that can change the result under the test's declared execution conditions. Describe the interfering sequence and the guarantee lost.

## State ownership

Each test needs ownership of its mutable state and resources: files, database rows, ports, environment, globals, and background tasks. A fixed shared directory can let one parallel test overwrite or delete another's output. Reusing a database fixture can make a later test depend on earlier execution.

Prefer per-test resources and cleanup that runs after assertion failure. Restoration of patched environment and global state must also occur on failure. Check worker shutdown before releasing a directory or connection it still uses. Integration scenarios may intentionally share a system; their isolation and cleanup contract must account for that sharing.

## Completion conditions

A fixed sleep assumes work finishes within an unrelated duration. Slow machines and alternate schedules can violate that assumption. Wait for a result, task completion, event, or explicitly defined state. A deadline bounds waiting. It does not establish that the operation completed.

This complete Python 3.11+ example owns its directory and awaits the writer before reading its result:

```python
import asyncio
from pathlib import Path
from tempfile import TemporaryDirectory


async def write_report(path):
    await asyncio.to_thread(path.write_text, "ready\n", encoding="utf-8")


async def check_report():
    with TemporaryDirectory() as directory:
        path = Path(directory) / "report.txt"
        async with asyncio.TaskGroup() as tasks:
            tasks.create_task(write_report(path))
        assert path.read_text(encoding="utf-8") == "ready\n"


asyncio.run(check_report())
```

Normal TaskGroup exit joins the writer before the assertion and directory cleanup. Task cancellation does not stop an already running `to_thread` function. A cancellation test must separately join or otherwise coordinate the thread before releasing its resources. Preserve a resource's owner until all work using it has ended, including exceptional and cancelled exits. The project's runtime determines how that completion is observed.

## Determinism

Control clock, timezone, random input, and environment where they determine the assertion. A fixed random seed controls that generator's input sequence. Thread scheduling and task interleaving need their own control or an assertion valid across allowed interleavings.

Concurrency tests can use explicit synchronization to force a relevant race. Randomized and external-system tests retain their stated execution conditions. Their scope explains reproducibility and failure meaning. Being an integration test alone does not make interference harmless.

## Dependency fidelity

Use real dependencies when their semantics are required. A fake or mock should preserve the errors, ordering, transactions, cancellation, or concurrency that the tested behavior depends on. Echoing a configured return value checks setup rather than integration. Verify the application's real use of a dependency at the relevant boundary.

For erratic failures, identify the state or interleaving, its observed impact, and a matching repair. A rerun that passes is another observation. It does not replace the explanation of the failure. Quarantine decisions and permanent changes follow the current workflow's authority.
