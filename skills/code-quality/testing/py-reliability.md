# Python test reliability

Check task completion, thread cancellation, and resource cleanup in Python asyncio tests. This complete Python 3.11+ example owns its directory and awaits the writer before reading its result:

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

Normal TaskGroup exit joins the writer before the assertion and directory cleanup. Task cancellation does not stop an already running `to_thread` function. On exceptional and cancelled exits, join or coordinate threads still using a resource before releasing it. Observe completion according to the project's actual runtime.
