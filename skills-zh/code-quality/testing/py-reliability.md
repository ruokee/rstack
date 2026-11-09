# Python 测试可靠性

检查 Python asyncio 测试的任务完成、线程取消及资源清理。以下完整 Python 3.11+ 示例拥有自己的目录，等写入任务结束后再读取结果：

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

TaskGroup 正常退出时，写入任务在断言及目录清理前结束。任务取消不会停止已经运行的 `to_thread` 函数。异常及取消退出时，先等待或协调仍使用资源的线程，再释放资源。依据项目实际运行时观察完成条件。
